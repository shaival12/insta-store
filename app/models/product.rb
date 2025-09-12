class Product < ApplicationRecord
  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :category, presence: true, length: { minimum: 2, maximum: 50 }
  validates :image_url, format: { with: URI::regexp(%w[http https]), message: "must be a valid URL" }, allow_blank: true

  scope :by_category, ->(category) { where(category: category) if category.present? }
  scope :price_range, ->(min_price, max_price) { where(price: min_price..max_price) if min_price.present? && max_price.present? }
  scope :recent, -> { order(created_at: :desc) }
  scope :expensive, -> { where('price > ?', 100) }
  scope :cheap, -> { where('price <= ?', 100) }

  # Class methods for fetching products
  def self.search(query)
    where("name LIKE ? OR description LIKE ? OR category LIKE ?", 
          "%#{query}%", "%#{query}%", "%#{query}%")
  end

  def self.by_price_range(min_price, max_price)
    where(price: min_price..max_price)
  end

  def self.average_price
    average(:price)
  end

  def self.total_value
    sum(:price)
  end

  def self.categories
    distinct.pluck(:category).sort
  end

  # Instance methods
  def formatted_price
    "$#{sprintf('%.2f', price)}"
  end

  def short_description
    description.length > 100 ? "#{description[0..97]}..." : description
  end

  def expensive?
    price > 100
  end

  def recent?
    created_at > 1.week.ago
  end

  def has_image?
    image_url.present?
  end

  def image_or_placeholder
    if has_image?
      image_url
    else
      "https://via.placeholder.com/300x200?text=No+Image"
    end
  end
end

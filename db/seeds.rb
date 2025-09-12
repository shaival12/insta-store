# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# Create sample products
products_data = [
  {
    name: "Wireless Bluetooth Headphones",
    description: "High-quality wireless headphones with noise cancellation and 30-hour battery life. Perfect for music lovers and professionals.",
    price: 199.99,
    category: "Electronics",
    image_url: "https://m.media-amazon.com/images/I/81FW+kJjYfL._AC_SY695_.jpg"
  },
  {
    name: "Organic Coffee Beans",
    description: "Premium organic coffee beans sourced from sustainable farms. Rich, full-bodied flavor with notes of chocolate and caramel.",
    price: 24.99,
    category: "Food & Beverage",
    image_url: "https://images.unsplash.com/photo-1559056199-641a0ac8b55e?w=500&h=300&fit=crop"
  },
  {
    name: "Yoga Mat Pro",
    description: "Non-slip yoga mat made from eco-friendly materials. Extra thick for comfort and durability during all types of workouts.",
    price: 79.99,
    category: "Sports & Fitness",
    image_url: "https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?w=500&h=300&fit=crop"
  },
  {
    name: "Smart Watch Series 8",
    description: "Advanced smartwatch with health monitoring, GPS, and water resistance. Track your fitness goals and stay connected.",
    price: 399.99,
    category: "Electronics",
    image_url: "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&h=300&fit=crop"
  },
  {
    name: "Artisan Ceramic Mug",
    description: "Handcrafted ceramic mug with unique glazing. Perfect for your morning coffee or tea. Dishwasher and microwave safe.",
    price: 18.50,
    category: "Home & Kitchen",
    image_url: "https://images.unsplash.com/photo-1578662996442-48f60103fc96?w=500&h=300&fit=crop&q=80"
  },
  {
    name: "Running Shoes",
    description: "Lightweight running shoes with responsive cushioning and breathable mesh upper. Designed for comfort and performance.",
    price: 129.99,
    category: "Sports & Fitness",
    image_url: "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&h=300&fit=crop"
  }
]

products_data.each do |product_attrs|
  Product.find_or_create_by!(name: product_attrs[:name]) do |product|
    product.description = product_attrs[:description]
    product.price = product_attrs[:price]
    product.category = product_attrs[:category]
    product.image_url = product_attrs[:image_url]
  end
end

puts "Created #{Product.count} products"

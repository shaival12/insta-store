# Demo script showing how to fetch and create products for Insta Store
# Run this with: rails runner lib/demo_products.rb

puts "=== Insta Store - Product Management Demo ==="
puts

# Fetch all products
puts "1. Fetching all products:"
products = Product.all
puts "Total products: #{products.count}"
products.each do |product|
  puts "  - #{product.name} (#{product.formatted_price})"
end
puts

# Fetch products by category
puts "2. Fetching products by category 'Electronics':"
electronics = Product.by_category('Electronics')
electronics.each do |product|
  puts "  - #{product.name} (#{product.formatted_price})"
end
puts

# Search products
puts "3. Searching for products containing 'wireless':"
search_results = Product.search('wireless')
search_results.each do |product|
  puts "  - #{product.name} (#{product.formatted_price})"
end
puts

# Fetch expensive products
puts "4. Fetching expensive products (> $100):"
expensive_products = Product.expensive
expensive_products.each do |product|
  puts "  - #{product.name} (#{product.formatted_price})"
end
puts

# Statistics
puts "5. Product statistics:"
puts "  - Average price: $#{sprintf('%.2f', Product.average_price)}"
puts "  - Total value: $#{sprintf('%.2f', Product.total_value)}"
puts "  - Categories: #{Product.categories.join(', ')}"
puts

# Create a new product
puts "6. Creating a new product:"
new_product = Product.create!(
  name: "Demo Product",
  description: "This is a demo product created programmatically to show how to create products in Ruby on Rails.",
  price: 49.99,
  category: "Demo"
)
puts "  Created: #{new_product.name} (#{new_product.formatted_price})"
puts

# Update the product
puts "7. Updating the demo product:"
new_product.update!(price: 39.99)
puts "  Updated price to: #{new_product.formatted_price}"
puts

# Delete the demo product
puts "8. Deleting the demo product:"
new_product.destroy!
puts "  Demo product deleted"
puts

puts "=== Demo Complete ==="

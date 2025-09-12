# Insta Store - E-commerce Application

A modern Ruby on Rails e-commerce application for managing products with images, built with Bootstrap for a responsive user interface.

## 🛍️ Features

- **Product Management**: Full CRUD operations for products
- **Image Support**: Product images with URL validation and fallback placeholders
- **Responsive Design**: Mobile-friendly Bootstrap interface
- **Search & Filtering**: Find products by name, description, or category
- **Price Management**: Track product pricing with formatted display
- **Category Organization**: Organize products by categories
- **Modern UI**: Clean, professional storefront design

## 🚀 Quick Start

### Prerequisites

- **Ruby**: 3.3.0 (managed by rbenv)
- **Rails**: 8.0.2.1
- **Database**: SQLite3 (default for development)
- **Node.js**: For JavaScript dependencies

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd my_app
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Setup the database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Visit the store**
   Open your browser and go to `http://localhost:3000`

## 📁 Project Structure

```
my_app/
├── app/
│   ├── controllers/
│   │   └── products_controller.rb    # Product management logic
│   ├── models/
│   │   └── product.rb                # Product model with validations
│   └── views/
│       ├── layouts/
│       │   └── application.html.erb  # Main layout with navigation
│       └── products/                 # Product views (index, show, new, edit)
├── config/
│   ├── application.rb                # App configuration
│   └── routes.rb                     # URL routing
├── db/
│   ├── migrate/                      # Database migrations
│   └── seeds.rb                      # Sample data
└── lib/
    └── demo_products.rb              # Demo script
```

## 🗄️ Database Schema

### Products Table
- `id` - Primary key
- `name` - Product name (required, 2-100 characters)
- `description` - Product description (required, 10-1000 characters)
- `price` - Product price (required, must be > 0)
- `category` - Product category (required, 2-50 characters)
- `image_url` - Product image URL (optional, must be valid URL)
- `created_at` - Creation timestamp
- `updated_at` - Last update timestamp

## 🎯 Usage

### Managing Products

**View all products**: Visit the homepage or `/products`

**Add a new product**: Click "Add New Product" or visit `/products/new`

**Edit a product**: Click "Edit" on any product card

**Delete a product**: Click "Delete" and confirm

**View product details**: Click on any product name or image

### Product Features

- **Image Handling**: Products can have images via URL or will show a placeholder
- **Price Formatting**: Prices are automatically formatted as currency
- **Search**: Use the search functionality to find products
- **Categories**: Filter products by category
- **Validation**: All fields are validated for proper data entry

## 🔧 Development

### Running Tests
```bash
rails test
```

### Database Console
```bash
rails console
```

### Demo Script
```bash
rails runner lib/demo_products.rb
```

### Code Quality
The application follows Rails conventions and includes:
- Model validations
- Strong parameters
- RESTful routing
- Responsive design
- Error handling

## 🌐 API Endpoints

| Method | Path | Action | Description |
|--------|------|--------|-------------|
| GET | `/` | index | Homepage with all products |
| GET | `/products` | index | List all products |
| GET | `/products/new` | new | New product form |
| POST | `/products` | create | Create new product |
| GET | `/products/:id` | show | Show product details |
| GET | `/products/:id/edit` | edit | Edit product form |
| PATCH/PUT | `/products/:id` | update | Update product |
| DELETE | `/products/:id` | destroy | Delete product |

## 🎨 Customization

### Adding New Product Fields
1. Create a migration: `rails generate migration AddFieldToProducts field:type`
2. Update the model validations in `app/models/product.rb`
3. Update the controller parameters in `app/controllers/products_controller.rb`
4. Update the views to include the new field

### Styling
The application uses Bootstrap 5.3.0. Customize the look by:
- Modifying `app/views/layouts/application.html.erb`
- Adding custom CSS in `app/assets/stylesheets/`
- Updating Bootstrap classes in the view files

## 🚀 Deployment

This application is configured for deployment with:
- **Kamal**: For containerized deployment
- **Production-ready**: Includes proper error handling and security

### Environment Variables
- `RAILS_ENV`: Set to `production` for production deployment
- `SECRET_KEY_BASE`: Required for production (generated automatically)

## 📝 Sample Data

The application comes with sample products including:
- Wireless Bluetooth Headphones
- Artisan Ceramic Mug
- Organic Cotton T-Shirt
- Stainless Steel Water Bottle
- Bamboo Phone Stand

Run `rails db:seed` to populate the database with sample data.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests if applicable
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🆘 Support

For questions or issues:
1. Check the Rails guides: https://guides.rubyonrails.org/
2. Review the application logs
3. Check the database console for data issues

---

**Happy Shopping! 🛒**

Built with ❤️ using Ruby on Rails
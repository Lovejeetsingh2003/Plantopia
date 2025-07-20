# Plantopia 🌿

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![NodeJS](https://img.shields.io/badge/node.js-6DA55F?style=for-the-badge&logo=node.js&logoColor=white)
![Express.js](https://img.shields.io/badge/express.js-%23404d59.svg?style=for-the-badge&logo=express&logoColor=%2361DAFB)
![MongoDB](https://img.shields.io/badge/MongoDB-%234ea94b.svg?style=for-the-badge&logo=mongodb&logoColor=white)

A full-featured, cross-platform mobile application for plant shopping, built with Flutter and powered by Node.js and MongoDB.

 <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_banner_1.jpg"/>

## 📋 Table of Contents
- [Overview](#overview)
- [Features](#features)
- [App Screenshots](#app-screenshots)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Project Structure](#project-structure)
- [Usage](#usage)
- [API Documentation](#api-documentation)
- [Future Roadmap](#future-roadmap)
- [Contributing](#contributing)
- [License](#license)

## Overview

Plantopia brings the joy of plant shopping to your fingertips. Designed for plant lovers and gardening enthusiasts, this app offers a seamless, modern, and aesthetic experience for browsing and purchasing a wide variety of indoor and outdoor plants.

The application features:
- An intuitive and visually appealing interface that mirrors a real-life shopping experience
- Clean and categorized layout for exploring curated plant collections
- Detailed product descriptions and images
- Seamless shopping cart management
- Secure user authentication
- Admin panel for product management

The backend is built as a RESTful API using Node.js and MongoDB, ensuring secure, scalable, and high-performance operations.

## Features

### 🛍️ User App
- Browse a wide variety of indoor and outdoor plants
- View detailed plant information (name, category, price, image)
- Add items to cart
- Top Picks and Recommended sections
- User authentication (Sign Up / Login)
- Cart management (add/remove items)
- Responsive and clean UI using Flutter

### 🧑‍💼 Admin App
- Add new plant products to the database
- Update existing plant details
- Delete plants from inventory
- Mobile-based admin panel (no need for web dashboard)

### ⚙️ Backend (API)
- RESTful APIs built with Node.js and Express
- Secure user login with JWT authentication
- Password hashing using Bcrypt
- Plant CRUD operations for Admin
- MongoDB database integration for storing plant and user data

## App Screenshots

### User App
<p align="center">
  <a href="[https://youtu.be/jIQ0Dx-4peE?si=C2k1tfuwqRKa-DL0](https://www.linkedin.com/posts/lovejeet-singh-3ba160279_plantopia-flutter-nodejs-activity-7263940422803103744-vqlE?utm_source=share&utm_medium=member_desktop&rcm=ACoAAEPVBD4BeyH-Wqxe3CigAaWgXxUuNj-oSOM)" target="_blank">
    <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_banner.jpg" width="500" />
  </a>
</p>


<p align="center">
<br>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_1.jpg" width="180" height="400" />
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_2.jpg" width="180" height="400" />
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_3.jpg" width="180"  height="400"/>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_4.jpg" width="180"  height="400"/>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_5.jpg" width="180"  height="400"/>
<br>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_6.jpg" width="180"  height="400"/>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_7.jpg" width="180"  height="400"/>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_8.jpg" width="180"  height="400"/>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_9.jpg" width="180"  height="400"/>
  <img src="https://github.com/Lovejeetsingh2003/Plantopia/blob/main/plantopia_10.jpg" width="180"  height="400"/>
</p>


## Tech Stack

### 📱 Frontend (User App & Admin App)
- Flutter (for building cross-platform mobile apps)
- Dart programming language
- HTTP package (for API calls)
- Provider (for state management)
- Shared Preferences (for storing user sessions)

### 🌐 Backend
- Node.js (server-side JavaScript)
- Express.js (web framework for APIs)
- MongoDB (NoSQL database)
- Mongoose (for MongoDB operations)
- JWT (for authentication)
- Bcrypt (for password hashing)
- dotenv (to manage environment variables)

### 🧪 Tools & Others
- Postman (for API testing)
- Git & GitHub (for version control)
- MongoDB Atlas (cloud-hosted database)
- VS Code (code editor)

## Installation

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Node.js (v14 or higher)
- npm or yarn
- MongoDB (local or Atlas connection)
- Android Studio / Xcode for emulators

### Backend Setup
1. Clone the repository
   ```bash
   git clone https://github.com/yourusername/plantopia.git
   cd plantopia/backend
   ```

2. Install dependencies
   ```bash
   npm install
   ```

3. Create a `.env` file in the backend directory with the following variables:
   ```
   PORT=3000
   MONGODB_URI=your_mongodb_connection_string
   JWT_SECRET=your_jwt_secret_key
   ```

4. Start the development server
   ```bash
   npm run dev
   # or with nodemon
   npm install -g nodemon
   nodemon server.js
   ```

### Flutter App Setup
1. Navigate to the app directory
   ```bash
   cd ../app
   ```

2. Get Flutter dependencies
   ```bash
   flutter pub get
   ```

3. Update the API base URL in `lib/config/api_config.dart` to point to your backend server

4. Run the app
   ```bash
   flutter run
   ```

## Project Structure

```
plantopia/
├── app/                  # Flutter application
│   ├── lib/
│   │   ├── config/       # App configuration
│   │   ├── models/       # Data models
│   │   ├── screens/      # UI screens
│   │   ├── services/     # API services
│   │   ├── utils/        # Utility functions
│   │   ├── widgets/      # Reusable widgets
│   │   └── main.dart     # Entry point
│   └── ...
├── admin/                # Admin Flutter application
│   ├── lib/
│   │   └── ...           # Similar structure to app
│   └── ...
└── backend/              # Node.js backend
    ├── controllers/      # API controllers
    ├── models/           # Database models
    ├── routes/           # API routes
    ├── middleware/       # Custom middleware
    ├── utils/            # Utility functions
    ├── server.js         # Entry point
    └── ...
```

## Usage

### User App
The user app allows customers to:
1. Browse plants by category
2. View detailed information about each plant
3. Add plants to their shopping cart
4. Manage their cart (add/remove items, update quantities)
5. Create an account or log in to an existing account

### Admin App
The admin app enables authorized users to:
1. Add new plants to the inventory
2. Update details of existing plants
3. Remove plants from the inventory
4. View basic inventory statistics

```dart
// Example of adding a plant to cart
void addToCart(Plant plant) {
  final cartService = Provider.of<CartService>(context, listen: false);
  cartService.addItem(plant);
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('${plant.name} added to cart')),
  );
}
```

## API Documentation

### Authentication Endpoints
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Login and receive JWT token

### Plant Endpoints
- `GET /api/plants` - Get all plants
- `GET /api/plants/:id` - Get a specific plant
- `GET /api/plants/category/:category` - Get plants by category
- `POST /api/plants` - Add a new plant (Admin only)
- `PUT /api/plants/:id` - Update a plant (Admin only)
- `DELETE /api/plants/:id` - Delete a plant (Admin only)

### Cart Endpoints
- `GET /api/cart` - Get user's cart
- `POST /api/cart` - Add item to cart
- `PUT /api/cart/:itemId` - Update cart item
- `DELETE /api/cart/:itemId` - Remove item from cart

## Future Roadmap

Plantopia is actively being developed with the following enhancements planned:

- 💳 Payment gateway integration (e.g., Razorpay, Stripe)
- 🧾 Order history and billing
- 🔔 Push notifications for new arrivals or offers
- 🧑‍🤝‍🧑 User profile and address management
- 🌐 Multi-language support
- 📊 Sales dashboard for admin analytics

## Contributing

We welcome contributions to Plantopia! Here's how you can help:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

Please make sure to update tests as appropriate and adhere to the existing coding style.

### Development Guidelines
- Follow the Flutter style guide for Dart code
- Use meaningful variable and function names
- Write comments for complex logic
- Create unit tests for new features

## License

This project is licensed under the MIT License - see below for details:

```
MIT License

Copyright (c) 2025 Lovejeet Singh

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation 

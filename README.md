# 🚌 Bus Ticketing System

A comprehensive mobile application for booking bus tickets, built with Flutter. This system allows users to seamlessly browse available buses, select seats, and purchase tickets using various payment methods including bKash and Nagad.

## ✨ Features

### 🔐 Authentication
- **Secure Login & Registration**: Users can create accounts or log in using Email/Password.
- **Social Login**: Integrated with **Google** and **Apple** for quick access.
- **Forgot Password**: Easy recovery flow for lost passwords.

### 🏠 Dashboard & Navigation
- **Interactive Dashboard**: View available bus schedules and routes.
- **Profile Management**: Manage user details and preferences.
- **Bottom Navigation**: Smooth navigation between Home, Tickets, and Profile.

### 🎫 Ticket Booking
- **Seat Selection**: Visual seat layout to choose your preferred spot.
- **Ticket Details**: Comprehensive view of trip details, including time, bus number, and boarding point.
- **Google Maps Integration**: View boarding and dropping points on the map.

### 💳 Payments
- **Multiple Payment Gateways**: Secure checkout using **bKash**, **Nagad**, and other local payment methods.
- **Backend Integration**: Robust backend API handling payment processing and order confirmation.

## 🛠️ Tech Stack

- **Frontend**: Flutter (Dart)
- **State Management**: Provider
- **Networking**: Dio
- **Maps**: Google Maps Flutter
- **Backend**: Firebase (Auth), Custom API
- **UI Components**: Font Awesome, Tabler Icons, Dotted Line

## 📸 Screenshots

| Login Screen | Dashboard | Seat Selection |
| :---: | :---: | :---: |
| ![Login Screen](assets/screenshots/login_dummy.png) | ![Dashboard](assets/screenshots/dashboard_dummy.png) | ![Seat Selection](assets/screenshots/seat_dummy.png) |

| Payment | Profile | Ticket Receipt |
| :---: | :---: | :---: |
| ![Payment](assets/screenshots/payment_dummy.png) | ![Profile](assets/screenshots/profile_dummy.png) | ![Receipt](assets/screenshots/receipt_dummy.png) |

> *Note: Screenshots are placeholders. Actual app visuals may vary.*

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.6.1 or higher)
- Dart SDK
- Android Studio / VS Code

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ticket_system.git
   cd ticket_system
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

## 📂 Project Structure

```
lib/
├── core/
│   ├── constant/
│   │   └── app_color.dart
│   ├── network/ 
│   ├── network/
│   └── utils/
├── feature/
│   ├── auth/           # Authentication (Login, Sign Up, Forgot Password)
│   ├── dashboard/      # Home screen and Ticket cards
│   ├── details/        # Ticket details, Seat selection, Payment flow
│   └── profile/        # User profile management
├── main.dart           # Application entry point
└── ...
```

## 🤝 Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## 📄 License

This project is licensed under the MIT License.

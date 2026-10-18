# Shopping App

A Flutter e-commerce app built with Clean Architecture, real API integration, and a full authentication flow.

## Features

- **Authentication:** login, signup, OTP email verification, token refresh, and logout
- **Brands and products** loaded from a real backend
- **Product listing** with pagination, search, filtering by brand, and favorites
- **Shimmer loading** placeholders
- **Full UI states** for loading, error, empty, and data on every screen
- **Responsive design** that adapts to any screen size
- **Localization** with easy_localization

## Architecture

Each feature is split into **data**, **domain**, and **presentation** layers:

```
lib/
├── main.dart
├── shopping_app.dart
├── core/
│   ├── constants/
│   ├── dependency_injection/   get_it
│   ├── network/                Dio + Retrofit
│   ├── routes/
│   ├── theme/
│   ├── utils/
│   └── widgets/
└── features/
    ├── auth/
    │   ├── data/               Login, signup, OTP, refresh token models + repository
    │   └── presentation/       Pages, Cubit, BLoC listeners
    └── home/
        ├── data/               Data sources, models, repositories
        ├── domain/             Repository interfaces
        └── presentation/       Pages, widgets, Cubit
```

## API

| Endpoint | Purpose |
|---|---|
| `GET /api/categories` | List brands |
| `GET /api/products` | List products (pagination and filters) |
| `GET /api/products/:id` | Product details |
| `POST /api/auth/login` | Login |
| `POST /api/auth/register` | Signup |
| `POST /api/auth/verify-email` | Verify OTP |
| `POST /api/auth/resend-otp` | Resend the code |
| `POST /api/auth/logout` | Logout |
| `POST /api/auth/refresh-token` | Get a new access token |

## Tech Stack

| Concern | Packages |
|---|---|
| State | flutter_bloc (Cubit) |
| DI | get_it |
| Networking | dio, retrofit, pretty_dio_logger |
| Models | freezed, json_serializable |
| Storage | shared_preferences |
| UI | flutter_screenutil, flutter_svg, shimmer_animation, flutter_native_splash |
| Utilities | easy_localization, intl, url_launcher |

## Getting Started

```bash
git clone https://github.com/Ahmed-Abdelnasser-Dev/shopping_app.git
cd shopping_app
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

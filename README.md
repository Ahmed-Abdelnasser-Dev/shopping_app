# 🛒 Shopping App

A clean-architecture Flutter app for shopping, featuring real API integration for products and brands, robust state management, authentication flows, shimmer UI loading animations, and modular architecture.

---

## ✨ Features
- Modular clean architecture: separate **data**, **domain/logic**, and **UI** layers
- Authentication (login, signup, logout, OTP, refresh token)
- Real API integration: fetch, search, and filter **brands** (`/api/categories`) and **products** (`/api/products`)
- Responsive UI (adapts to all devices) and modern design
- State management with Cubit/Bloc (can easily swap for Riverpod/Provider)
- Manageable dependency injection with GetIt
- Shimmer loading animation with `shimmer_animation`
- Error/loading/success UI flows for all screens
- Code generation (`freezed`, `json_serializable`) and type-safe models
- Pagination, product search, brand filtering, and favorites
- Simple extensibility for adding new screens or logic

---

## 📦 Dependencies

### State Management
- **flutter_bloc**: BLoC/Cubit pattern implementation

### Networking
- **dio**: Powerful HTTP client
- **pretty_dio_logger**: Logging for Dio requests
- **retrofit** (for codegen if needed)

### Dependency Injection
- **get_it**: Service locator for DI

### Code Generation & Modeling
- **freezed**: For unions/data classes
- **freezed_annotation**: Needed for `freezed` codegen
- **json_serializable**: JSON parsing code generation
- **json_annotation**: Needed for above
- **build_runner**: Codegen runner
- **retrofit_generator**: Retrofit code generation

### UI & Animation
- **shimmer_animation**: Beautiful shimmer loading effect
- **flutter_screenutil**: For responsive and adaptive layout
- **flutter_svg**: SVG asset support
- **flutter_native_splash**: Native splash screen config

### Utilities
- **intl**: Internationalization
- **url_launcher**: Open links from app
- **easy_localization**: Pluggable localization

### Storage
- **shared_preferences**: Key-value persistence

### Testing/Lints
- **flutter_test**: For widget/tests
- **flutter_lints**: Code style & linting

---

## 🗂️ Folder Structure

```
lib/
│
├── core/
├── features/
│   ├── auth/
│   │   ├── data/
│   │   ├── domain/
│   │   └── presentation/
│   └── home/
│       ├── data/
│       ├── domain/
│       └── presentation/
│
├── main.dart
└── shopping_app.dart
```

---

## 🚀 How to Run the App
1. **Clone the repository:**
   ```bash
   git clone <repo_url>
   cd shopping_app
   ```
2. **Get dependencies:**
   ```bash
   flutter pub get
   ```
3. **Generate code:**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
4. **Run the app:**
   ```bash
   flutter run
   ```

---

## 🌟 Features Implemented
- Authentication: Login, Signup, OTP verification, Refresh token, Logout
- Home page: Browse brands and products from the backend
- Product listing: Pagination, shimmer loading, search, and filter
- Brand listing: Shows all brands (categories) from the backend
- Full UI state handling: loading, error, empty, and data views
- Modular folders using clean architecture

---

## 🌐 Main API Endpoints Used
- `GET /api/categories` — list brands
- `GET /api/products` — list products (supports pagination, filtering)
- `GET /api/products/:id` — product details

### 🔑 Authentication Endpoints
- `POST   /api/auth/login` — login
- `POST   /api/auth/register` — signup
- `POST   /api/auth/verify-email` — opt/verify
- `POST   /api/auth/resend-otp` — resend verification code
- `POST   /api/auth/logout` — logout
- `POST   /api/auth/refresh-token` — get new token

---

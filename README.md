# Camera V1 - Flutter Security Camera App

A modern, high-performance security camera management application built with Flutter using Clean Architecture and BLoC pattern.

## 🚀 Features

- **Auth System**: Secure registration, login, and password management.
- **Onboarding**: Intuitive multi-step onboarding flow for new users.
- **Real-time Monitoring**: Connect and manage security cameras (Integrated with Go backend).
- **Location Services**: Geocoding and map integration for camera positioning.
- **Profile & Settings**: Comprehensive user profile management and app configuration.
- **Multi-language Support**: Built-in localization support.

## 🛠 Tech Stack

- **Framework**: [Flutter](https://flutter.dev) (SDK ^3.10.1)
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) & [injectable](https://pub.dev/packages/injectable)
- **Network**: [http](https://pub.dev/packages/http)
- **Architecture**: Feature-First Clean Architecture
- **Navigation**: Navigator 2.0 / Pinput
- **Utilities**: `equatable`, `dartz`, `geolocator`, `shared_preferences`, `intl`

## 📂 Project Structure

```text
lib/
├── core/               # App-wide constants, themes, and shared logic
├── features/           # Independent modules (auth, home, onboarding, etc.)
│   └── [feature]/
│       ├── data/       # Models, Data Sources, Repositories Impl
│       ├── domain/     # Entities, Use Cases, Repository Interfaces
│       └── presentation/# BLoC, Pages, Widgets
├── config/             # App initialization and DI setup
└── main.dart           # Entry point
```

## 🏗 Setup & Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd camera-v1
   ```

2. **Install dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate dependencies (Injectable)**:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**:
   ```bash
   flutter run
   ```

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

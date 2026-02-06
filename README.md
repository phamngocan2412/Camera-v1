# Camera V1 - Ứng Dụng Camera An Ninh

Ứng dụng di động đa nền tảng (iOS, Android, Web, Desktop) cho hệ thống camera an ninh, được xây dựng với Flutter và kiến trúc Clean Architecture.

## 🚀 Tính Năng

### Xác Thực Ngườ Dùng
- **Đăng nhập**: Xác thực JWT an toàn
- **Đăng ký**: Tạo tài khoản mới với xác minh OTP
- **Quên mật khẩu**: Khôi phục mật khẩu qua email/SMS OTP
- **Đổi mật khẩu**: Cập nhật mật khẩu khi đã đăng nhập
- **Xác minh OTP**: Xác thực 2 lớp qua mã OTP

### Quản Lý Ngườ Dùng
- **Hồ sơ**: Xem và cập nhật thông tin cá nhân
- **Cài đặt**: Tùy chỉnh ngôn ngữ và giao diện

### Trải Nghiệm Ngườ Dùng
- **Onboarding**: Hướng dẫn sử dụng khi lần đầu mở app
- **Splash Screen**: Màn hình khởi động đẹp mắt
- **Animation**: Hiệu ứng chuyển cảnh mượt mà
- **Đa ngôn ngữ**: Hỗ trợ tiếng Việt và tiếng Anh

## 🛠 Công Nghệ Sử Dụng

- **Framework**: [Flutter](https://flutter.dev) (SDK ^3.10.1)
- **Ngôn ngữ**: Dart
- **Kiến trúc**: Clean Architecture + BLoC Pattern
- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it) + [injectable](https://pub.dev/packages/injectable)
- **HTTP Client**: [http](https://pub.dev/packages/http)
- **Local Storage**: [shared_preferences](https://pub.dev/packages/shared_preferences)
- **Location**: [geolocator](https://pub.dev/packages/geolocator) + [geocoding](https://pub.dev/packages/geocoding)
- **Network Status**: [connectivity_plus](https://pub.dev/packages/connectivity_plus)
- **Localization**: [intl](https://pub.dev/packages/intl) + flutter_localizations
- **OTP Input**: [pinput](https://pub.dev/packages/pinput)
- **Country Picker**: [country_code_picker](https://pub.dev/packages/country_code_picker)

## 📂 Cấu Trúc Dự Án

```
lib/
├── config/                 # Cấu hình ứng dụng
│   └── routes/            # Định nghĩa routes
├── core/                  # Core module (dùng chung)
│   ├── constants/         # Hằng số (API, app)
│   ├── di/               # Dependency Injection
│   ├── errors/           # Xử lý lỗi (Failures, Exceptions)
│   ├── l10n/             # Đa ngôn ngữ
│   ├── network/          # Kiểm tra kết nối mạng
│   ├── presentation/     # Widgets và pages dùng chung
│   ├── theme/            # Theme và styling
│   └── usecases/         # Base usecase class
├── features/              # Các tính năng chính
│   ├── auth/             # Xác thực ngườ dùng
│   │   ├── data/         # Data layer (models, datasources, repositories)
│   │   ├── domain/       # Domain layer (entities, repositories, usecases)
│   │   └── presentation/ # Presentation layer (bloc, pages, widgets)
│   ├── home/             # Trang chủ
│   ├── onboarding/       # Hướng dẫn sử dụng
│   ├── profile/          # Hồ sơ ngườ dùng
│   └── settings/         # Cài đặt
└── main.dart             # Entry point
```

## 🏗 Cài Đặt Và Chạy

### Yêu Cầu

- Flutter SDK ^3.10.1
- Dart SDK
- Android Studio / Xcode (cho mobile)
- IDE: VS Code / Android Studio

### Bước Cài Đặt

1. **Clone repository**:
   ```bash
   git clone <repository-url>
   cd camera-v1
   ```

2. **Cài đặt dependencies**:
   ```bash
   flutter pub get
   ```

3. **Generate dependency injection**:
   ```bash
   flutter pub run build_runner build
   ```

4. **Chạy ứng dụng**:
   ```bash
   # Development
   flutter run

   # Với flavor cụ thể
   flutter run --flavor dev
   flutter run --flavor staging
   flutter run --flavor prod
   ```

### Build Production

```bash
# Android APK
flutter build apk --release

# Android App Bundle
flutter build appbundle --release

# iOS
flutter build ios --release

# Web
flutter build web --release

# Desktop (Windows/Linux/Mac)
flutter build windows
flutter build linux
flutter build macos
```

## ⚙️ Cấu Hình

### API Endpoint

Chỉnh sửa file `lib/core/constants/api_constants.dart`:

```dart
class ApiConstants {
  static const String baseUrl = 'http://localhost:8080/api/v1';
  // Hoặc production URL
  // static const String baseUrl = 'https://api.yourdomain.com/api/v1';
}
```

### Environment Variables

Tạo file `.env` ở thư mục gốc:

```env
API_BASE_URL=http://localhost:8080/api/v1
APP_NAME=Camera Security
```

## 📝 Coding Conventions

### Naming Conventions
- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Functions/Methods**: `camelCase`
- **Variables**: `camelCase`
- **Constants**: `SCREAMING_SNAKE_CASE`
- **Private Members**: `_prefix`

### Clean Architecture Layers
1. **Presentation**: UI + BLoC (State Management)
2. **Domain**: Entities + Use Cases + Repository Interfaces
3. **Data**: Models + Data Sources + Repository Implementations

### State Management Pattern (BLoC)
```dart
// Event
class LoginEvent extends AuthEvent {
  final String email;
  final String password;
}

// State
class AuthState {
  final bool isLoading;
  final User? user;
  final String? errorMessage;
}

// BLoC
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  // Handle events và emit states
}
```

## 🧪 Testing

```bash
# Chạy tất cả tests
flutter test

# Chạy test với coverage
flutter test --coverage

# Chạy test cụ thể
flutter test test/features/auth/
```

## 🌐 Đa Ngôn Ngữ

Ứng dụng hỗ trợ:
- 🇻🇳 Tiếng Việt (vi)
- 🇺🇸 Tiếng Anh (en)

Thêm ngôn ngữ mới trong `lib/core/l10n/app_localizations.dart`

## 📱 Screenshots

| Splash | Onboarding | Login | Register |
|--------|-----------|-------|----------|
| | | | |

| Home | Profile | Settings | Verification |
|------|---------|----------|-------------|
| | | | |

## 🤝 Đóng Góp

1. Fork repository
2. Tạo branch mới: `git checkout -b feature/amazing-feature`
3. Commit changes: `git commit -m 'Add amazing feature'`
4. Push lên branch: `git push origin feature/amazing-feature`
5. Tạo Pull Request

## 📄 License

Dự án này được cấp phép theo [MIT License](LICENSE).

## 📞 Liên Hệ

- **Author**: Your Name
- **Email**: your.email@example.com
- **Project Link**: [GitHub Repository](https://github.com/username/camera-v1)

## 🙏 Cảm Ơn

- [Flutter Team](https://flutter.dev)
- [Reso Coder](https://resocoder.com) - Clean Architecture tutorials
- [Flutter Bloc Library](https://bloclibrary.dev)

---

**Lưu ý**: Đảm bảo backend API (camera-be-v1) đang chạy trước khi test ứng dụng.

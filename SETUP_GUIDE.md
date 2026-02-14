# Lanka Smart Mart - Flutter App Setup Guide

## Project Structure Overview

The application follows clean architecture with the following structure:

```
lib/
├── main.dart                 # App entry point with SplashScreen as home
├── constants/
│   └── app_constants.dart    # All colors, typography, shadows, spacing
├── screens/
│   ├── splash_screen.dart    # Splash screen with 5-second loading
│   ├── login_screen.dart     # Login with email/phone and password
│   └── signup_screen.dart    # Sign up with form fields and terms checkbox
└── widgets/
    └── app_widgets.dart      # Reusable UI components (TextField, Button, SocialButton)

assets/
└── images/
    ├── splash_bg.jpg         # 412x917px background for splash screen
    └── logo.png              # Logo image for login/signup screens
```

## 📁 Asset Files Setup

### Required Images

You need to add two image files to the `assets/images/` directory:

1. **splash_bg.jpg** - Splash screen background
   - Dimensions: 412 x 917 px (mobile screen size)
   - Format: JPEG
   - Location: `assets/images/splash_bg.jpg`

2. **logo.png** - Logo for login and signup screens
   - Format: PNG (with transparency recommended)
   - Dimensions: ~60x60 px (suggested)
   - Location: `assets/images/logo.png`

### To Add Images

1. Create the `assets/images/` directory if it doesn't exist
2. Place your `splash_bg.jpg` and `logo.png` files in `assets/images/`
3. The `pubspec.yaml` is already configured to include these files
4. Run `flutter pub get` to update dependencies

## 🎨 Design System

### Colors (app_constants.dart)
- **Primary Green**: #08B84F (buttons, accents)
- **Primary Green Hover**: #108E0A (hover state)
- **Dark Green**: #1B5C1B (links, text emphasis)
- **Gradient Bottom**: #ADF1AA (login/signup gradient)

### Typography
- **Font**: Inter (system default - add to pubspec.yaml if using custom font)
- **Splash Screen**:
  - Title: Bold 36px
  - Loading Text: SemiBold 24px
  - Feature Text: Regular 16px
- **Login/Signup**:
  - Welcome Title: Bold 38px
  - Subtitle: Regular 18px
  - Button Text: Bold 16px
  - Checkbox Text: Regular 12px

### Shadows
- Input fields: Offset(0, 4), Blur 4, Opacity 25%
- Applied to all text fields and social buttons

## 🚀 Screen Flow

1. **SplashScreen** (starts here)
   - Displays for 5 seconds
   - Shows loading indicator with animation
   - Has feature row at bottom
   - Navigates to LoginScreen after 5s

2. **LoginScreen**
   - Email/Phone input field
   - Password input field
   - Continue button
   - Sign up link → navigates to SignupScreen
   - Social login buttons (Facebook, Google)

3. **SignupScreen**
   - Full Name field
   - Address field
   - Password field
   - Phone Number field
   - Terms checkbox with linked text
   - Sign Up button → navigates back to LoginScreen

## 📝 Code Structure Guide

### Main Components

#### Reusable Widgets (lib/widgets/app_widgets.dart)
- `AppTextField` - Styled input field with shadow and rounded corners
- `AppButton` - Styled button with hover effect support
- `SocialButton` - Social login button with logo placeholder

#### Constants (lib/constants/app_constants.dart)
- `AppColors` - All color definitions
- `AppTypography` - All text styles
- `AppShadows` - Shadow definitions
- `AppSpacing` - Padding and margin constants
- `AppGradients` - Gradient definitions

### Screen Implementation Pattern

All screens follow this pattern:
1. Use `SafeArea` to avoid system UI
2. Use `SingleChildScrollView` for scrollable content
3. Consistent `horizontalPadding` of 24dp
4. Gradient background for login/signup
5. Image background for splash

## 🔧 Building & Running

```bash
# Get dependencies
flutter pub get

# Run the app
flutter run

# Build for production
flutter build apk      # Android
flutter build ios      # iOS
flutter build web      # Web
flutter build windows  # Windows
```

## 📋 Production Checklist

- [ ] Add actual image files (splash_bg.jpg and logo.png)
- [ ] Test on multiple screen sizes
- [ ] Verify navigation flow (Splash → Login → Signup → Login)
- [ ] Test all button interactions
- [ ] Verify responsive sizing on different devices
- [ ] Check SafeArea on devices with notches/cutouts
- [ ] Add proper error handling in navigation
- [ ] Add form validation for input fields
- [ ] Implement actual login/signup API calls
- [ ] Add error states and snackbars for network errors
- [ ] Implement secure password storage
- [ ] Add loading states during API calls

## 🎯 Next Steps

1. Replace placeholder images with actual assets
2. Implement API integration for login/signup
3. Add form validation
4. Implement authentication flow
5. Add home/dashboard screen after successful login
6. Implement session management
7. Add password recovery flow
8. Implement social login integration

## 📚 Key Features

### SafeArea Usage
All screens use `SafeArea` to automatically handle system UI areas like status bars, notches, and navigation bars.

### Responsive Design
- Uses `MediaQuery` for responsive sizing
- Consistent padding across screens
- Flexible layouts that adapt to screen size

### Clean Architecture
- Separation of concerns with constants, widgets, and screens
- Reusable widget components
- Centralized styling system

### Production Readiness
- Const constructors for performance
- Proper state management with StatefulWidget
- Error handling with SnackBars
- Null safety enabled
- Material Design 3 support

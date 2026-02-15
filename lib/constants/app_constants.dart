import 'package:flutter/material.dart';

// ================ COLORS ================
class AppColors {
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color darkGrey = Color(0xFF666666);
  static const Color primaryGreen = Color(0xFF08B84F);
  static const Color primaryGreenHover = Color(0xFF108E0A);
  static const Color gradientTopGreen = Color(0xFFADF1AA);
  static const Color darkGreen = Color(0xFF1B5C1B);
}

// ================ TYPOGRAPHY ================
class AppTypography {
  // static const String fontFamily = 'Inter';

  // Splash Screen
  static const TextStyle splashTitle = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle splashLoadingText = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static const TextStyle splashFeatureText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
  );

  // Login/Signup Screen
  static const TextStyle welcomeTitle = TextStyle(
    fontSize: 38,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle subtitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
  );

  static const TextStyle signupTitle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static const TextStyle accountText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGrey,
  );

  static const TextStyle signupLinkText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.darkGreen,
  );

  static const TextStyle checkboxText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
  );

  static const TextStyle socialButtonText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
}

// ================ SHADOWS ================
class AppShadows {
  static const BoxShadow inputShadow = BoxShadow(
    offset: Offset(0, 4),
    blurRadius: 4,
    color: Color.fromRGBO(0, 0, 0, 0.25),
  );
}

// ================ SPACING ================
class AppSpacing {
  static const double horizontalPadding = 24;
  static const double verticalSpacing = 16;
  static const double smallSpacing = 8;
  static const double largeSpacing = 32;
}

// ================ GRADIENTS ================
class AppGradients {
  static const LinearGradient loginSignupGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.white,
      AppColors.gradientTopGreen,
    ],
  );
}

// ================ SCREEN SIZES ================
class AppScreenSizes {
  static const double mobileWidth = 412;
  static const double mobileHeight = 917;
}

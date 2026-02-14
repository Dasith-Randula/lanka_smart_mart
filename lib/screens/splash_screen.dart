import 'package:flutter/material.dart';
import 'package:test_flutter/constants/app_constants.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 5000),
      vsync: this,
    );

    // Start animation after 1ms
    Future.delayed(const Duration(milliseconds: 1), () {
      if (mounted) {
        _animationController.forward();
      }
    });

    // Navigate after 5000ms
    Future.delayed(const Duration(milliseconds: 5000), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/splash_bg.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              // Main content
              Column(
                children: [
                  // Top text section - centered upper-middle
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.horizontalPadding,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Everything you need,',
                              textAlign: TextAlign.center,
                              style: AppTypography.splashTitle,
                            ),
                            const SizedBox(height: AppSpacing.smallSpacing),
                            const Text(
                              'delivered to you.',
                              textAlign: TextAlign.center,
                              style: AppTypography.splashTitle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom section
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Loading indicator and text
                        SizedBox(
                          height: 80,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RotationTransition(
                                turns: _animationController,
                                child: const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.white,
                                  ),
                                  strokeWidth: 3,
                                ),
                              ),
                              const SizedBox(height: AppSpacing.smallSpacing),
                              const Text(
                                'Loading',
                                style: AppTypography.splashLoadingText,
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.largeSpacing),

                        // Feature row
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSpacing.horizontalPadding,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              _FeatureItem(text: 'Fast delivery'),
                              _FeatureItem(text: 'Best prices'),
                              _FeatureItem(text: 'Secure payment'),
                            ],
                          ),
                        ),

                        const SizedBox(height: AppSpacing.largeSpacing),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final String text;

  const _FeatureItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 29,
          height: 29,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: AppSpacing.smallSpacing),
        Text(
          text,
          textAlign: TextAlign.center,
          style: AppTypography.splashFeatureText,
        ),
      ],
    );
  }
}

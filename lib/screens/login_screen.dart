import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/constants/app_constants.dart';
import 'package:test_flutter/widgets/app_widgets.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleContinue() {
    // Navigate to home page (or next screen)
    // For now, this is a placeholder
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Continue tapped')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(gradient: AppGradients.loginSignupGradient),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.horizontalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Logo at top left
                  const SizedBox(height: 24),
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.darkGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Welcome section
                  const Text(
                    'Welcome 👋',
                    style: AppTypography.welcomeTitle,
                  ),
                  const SizedBox(height: AppSpacing.smallSpacing),
                  const Text(
                    'Enter email or phone number to continue',
                    style: AppTypography.subtitle,
                  ),
                  const SizedBox(height: 40),

                  // Email/Phone input
                  AppTextField(
                    controller: _emailController,
                    hint: 'Email or phone number',
                  ),
                  const SizedBox(height: AppSpacing.verticalSpacing),

                  // Password input
                  AppTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: 32),

                  // Continue button
                  AppButton(
                    text: 'CONTINUE',
                    onPressed: _handleContinue,
                    hoverColor: AppColors.primaryGreenHover,
                  ),
                  const SizedBox(height: 32),

                  // Sign up link
                  _buildSignupLink(),
                  const SizedBox(height: 32),

                  // Social section
                  const Center(
                    child: Text(
                      'or continue with',
                      style: AppTypography.accountText,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Social buttons
                  SocialButton(
                    label: 'Facebook',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Facebook login tapped')),
                      );
                    },
                  ),
                  const SizedBox(height: AppSpacing.verticalSpacing),
                  SocialButton(
                    label: 'Google',
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Google login tapped')),
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignupLink() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: 'Have an account? ',
          style: AppTypography.accountText,
          children: [
            TextSpan(
              text: 'Sign up',
              style: AppTypography.signupLinkText,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SignupScreen(),
                    ),
                  );
                },
            ),
          ],
        ),
      ),
    );
  }
}

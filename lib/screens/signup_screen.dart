import 'package:flutter/material.dart';
import 'package:test_flutter/constants/app_constants.dart';
import 'package:test_flutter/widgets/app_widgets.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController _fullNameController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  late TextEditingController _phoneController;

  bool _termsAgreed = false;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    if (!_termsAgreed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please agree to Terms of service')),
      );
      return;
    }

    // Navigate back to login screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
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

                  // Title
                  const Text(
                    'Sign up continue !',
                    style: AppTypography.signupTitle,
                  ),
                  const SizedBox(height: 32),

                  // Full Name field
                  AppTextField(
                    controller: _fullNameController,
                    hint: 'Full Name',
                  ),
                  const SizedBox(height: AppSpacing.verticalSpacing),

                  // Address field
                  AppTextField(
                    controller: _addressController,
                    hint: 'Enter Address',
                  ),
                  const SizedBox(height: AppSpacing.verticalSpacing),

                  // Password field
                  AppTextField(
                    controller: _passwordController,
                    hint: 'Password',
                    obscureText: true,
                  ),
                  const SizedBox(height: AppSpacing.verticalSpacing),

                  // Phone field
                  AppTextField(
                    controller: _phoneController,
                    hint: 'Phone Number',
                  ),
                  const SizedBox(height: 24),

                  // Checkbox and terms
                  _buildCheckboxSection(),
                  const SizedBox(height: 32),

                  // Sign up button
                  AppButton(
                    text: 'SIGN UP',
                    onPressed: _handleSignUp,
                    hoverColor: AppColors.primaryGreenHover,
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

  Widget _buildCheckboxSection() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: _termsAgreed,
            onChanged: (value) {
              setState(() {
                _termsAgreed = value ?? false;
              });
            },
            activeColor: AppColors.primaryGreen,
            side: const BorderSide(
              color: AppColors.darkGrey,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: RichText(
            text: const TextSpan(
              text:
                  'By processing to create your account, you are agree to our ',
              style: AppTypography.checkboxText,
              children: [
                TextSpan(
                  text: 'Terms of service',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGreen,
                    decoration: TextDecoration.underline,
                  ),
                ),
                TextSpan(
                  text: ' and ',
                  style: AppTypography.checkboxText,
                ),
                TextSpan(
                  text: 'privacy Policy',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.darkGreen,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

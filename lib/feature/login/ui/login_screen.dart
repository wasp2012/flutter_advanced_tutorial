import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/helpers/spacing.dart';
import 'package:flutter_advanced_tutorial/core/theming/styles.dart';
import 'package:flutter_advanced_tutorial/core/widgets/app_text_button.dart';
import 'package:flutter_advanced_tutorial/core/widgets/app_text_form_field.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/already_have_account_text.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObsecureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font14GrayRegular,
              ),
              verticalSpace(36),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    const AppTextFormField(hintText: 'Email'),
                    verticalSpace(18),
                    AppTextFormField(
                      hintText: 'Password',
                      isObscureText: isObsecureText,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isObsecureText = !isObsecureText;
                          });
                        },
                        child: Icon(isObsecureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    verticalSpace(24),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forget Password',
                        style: TextStyles.font13BlueRegular,
                      ),
                    ),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Login',
                      textStyle: TextStyles.font16WhiteMedium,
                      onPressed: () {},
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const AlreadyHaveAccountText()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

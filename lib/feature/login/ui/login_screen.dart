import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/helpers/spacing.dart';
import 'package:flutter_advanced_tutorial/core/theming/styles.dart';
import 'package:flutter_advanced_tutorial/core/widgets/app_text_button.dart';
import 'package:flutter_advanced_tutorial/feature/login/data/models/login_request_body.dart';
import 'package:flutter_advanced_tutorial/feature/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/LoginBlocListener.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/already_have_account_text.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/email_and_password.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
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
                Column(
                  children: [
                    const EmailAndPassword(),
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
                      onPressed: () {
                        validateThenDoLogin(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(60),
                    const AlreadyHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates(LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/helpers/spacing.dart';
import 'package:flutter_advanced_tutorial/core/theming/styles.dart';
import 'package:flutter_advanced_tutorial/core/widgets/app_text_button.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter_advanced_tutorial/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:flutter_advanced_tutorial/feature/sign_up/ui/widget/already_have_account_text.dart';
import 'package:flutter_advanced_tutorial/feature/sign_up/ui/widget/sign_up_bloc_listener.dart';
import 'package:flutter_advanced_tutorial/feature/sign_up/ui/widget/sign_up_form.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({ Key? key }) : super(key: key);

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
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignupForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignupBlocListener(),
                    
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }  void validateThenDoSignup(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/helpers/app_regex.dart';
import 'package:flutter_advanced_tutorial/core/helpers/spacing.dart';
import 'package:flutter_advanced_tutorial/core/widgets/app_text_form_field.dart';
import 'package:flutter_advanced_tutorial/feature/login/logic/cubit/login_cubit.dart';
import 'package:flutter_advanced_tutorial/feature/login/ui/widgets/password_validation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinimumLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    setupPasswordControllerLitener();
  }

  void setupPasswordControllerLitener() {
    passwordController.addListener(
      () {
        setState(
          () {
            hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
            hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
            hasSpecialCharacter =
                AppRegex.hasSpecialCharacter(passwordController.text);
            hasNumber = AppRegex.hasNumber(passwordController.text);
            hasMinimumLength = AppRegex.hasMinLength(passwordController.text);
          },
        );
      },
    );
  }

  // @override
  // void dispose() {
  //   passwordController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18),
          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            hintText: 'Password',
            isObscureText: isObsecureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(
                  () {
                    isObsecureText = !isObsecureText;
                  },
                );
              },
              child: Icon(
                  isObsecureText ? Icons.visibility_off : Icons.visibility),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
          ),
          verticalSpace(24),
          PasswordValidations(
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCaracters: hasSpecialCharacter,
            hasNumber: hasNumber,
            hasMinimumLength: hasMinimumLength,
          ),
        ],
      ),
    );
  }
}

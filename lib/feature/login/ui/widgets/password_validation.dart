import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/helpers/spacing.dart';
import 'package:flutter_advanced_tutorial/core/theming/colors.dart';
import 'package:flutter_advanced_tutorial/core/theming/styles.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {Key? key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasSpecialCaracters,
      required this.hasNumber,
      required this.hasMinimumLength})
      : super(key: key);
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCaracters;
  final bool hasNumber;
  final bool hasMinimumLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At least 1 lowercase letter', hasLowerCase),
        verticalSpace(2),
        buildValidationRow('At least 1 uppercase letter', hasUpperCase),
        verticalSpace(2),
        buildValidationRow('At least 1 special character', hasSpecialCaracters),
        verticalSpace(2),
        buildValidationRow('At least 1 number ', hasNumber),
        verticalSpace(2),
        buildValidationRow('At least 8 characters long ', hasMinimumLength),
        verticalSpace(2),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 2.5,
          backgroundColor: ColorsManager.gray,
        ),
        horizontalSpace(6),
        Text(
          text,
          style: TextStyles.font13DarkBlueRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? ColorsManager.gray : ColorsManager.darkBlue,
          ),
        ),
      ],
    );
  }
}

// 
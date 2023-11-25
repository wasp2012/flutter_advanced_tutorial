import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/helpers/extensions.dart';
import 'package:flutter_advanced_tutorial/core/routing/routes.dart';
import 'package:flutter_advanced_tutorial/core/theming/colors.dart';
import 'package:flutter_advanced_tutorial/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorsManagter.mainBlue),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: MaterialStateProperty.all(
          const Size(
            double.infinity,
            52,
          ),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
        ),
      ),
      child: Text(
        'Get Started',
        style: TextStyles.font16WhiteSemiBold,
      ),
    );
  }
}

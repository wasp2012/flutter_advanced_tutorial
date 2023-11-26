import 'package:flutter/material.dart';
import 'package:flutter_advanced_tutorial/core/theming/styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class DocLogoAndName extends StatelessWidget {
  const DocLogoAndName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/doc_logo.svg'),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'DocDoc',
          style: TextStyles.font24Black700Weight 
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/assets_manager.dart';
import 'package:test_app/core/text_manager.dart';

import '../colors_manager.dart';
class CustomTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;

  const CustomTextFormFiled({
    super.key,
    required this.controller,this.onChanged
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      textInputAction: TextInputAction.search,
      cursorColor: Colors.white,
      style: GoogleFonts.inter(fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white),
      maxLines: 1,
      controller: controller,
      decoration: InputDecoration(
        hintText:  TextManager.search,
        contentPadding: REdgeInsets.symmetric(vertical: 20),
        prefixIcon: Padding(
          padding: REdgeInsets.all(16),
          child: SvgPicture.asset(SvgIcons.search,
          width: 24.w,
            fit: BoxFit.scaleDown,),
        ),
        suffixIcon: controller.text.isNotEmpty
            ? IconButton(
          icon: Icon(Icons.close, size: 24.w,color: ColorsManager.white,),
          onPressed: () {
            controller.clear();
          },
        )
            : null,
               ),
    );
  }
}



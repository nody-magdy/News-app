import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/models/category.dart';

class CategoryItem extends StatelessWidget {
   CategoryItem({super.key, required this.category});
CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(24.r),
        child: Image.asset(category.imagePath));
  }
}

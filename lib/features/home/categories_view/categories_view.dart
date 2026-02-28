import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/features/home/categories_view/category.dart';
import 'package:test_app/models/category.dart';

class CategoriesView extends StatelessWidget {
 CategoriesView({super.key, required this.onCategoryItemClicked});
  void Function(CategoryModel) onCategoryItemClicked;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  REdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You", style: Theme.of(context).textTheme.headlineLarge
            ,),
          SizedBox(height: 16.h,),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index)=> InkWell(
                    onTap: (){
                      onCategoryItemClicked(CategoryModel.categories[index]);
                    },
                    child: CategoryItem(category: CategoryModel.categories[index])),
                separatorBuilder: (context, index)=> SizedBox(height: 16.h,),
                itemCount: CategoryModel.categories.length),
          )
        ],
      ),
    );
  }
}

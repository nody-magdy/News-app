import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/assets_manager.dart';
import 'package:test_app/core/colors_manager.dart';
import 'package:test_app/core/text_manager.dart';
import 'package:test_app/features/home/categories_view/categories_view.dart';
import 'package:test_app/features/home/home_drawer/home_drawer.dart';
import 'package:test_app/features/home/sources_view/sources_view.dart';
import 'package:test_app/models/category.dart';
import '../../core/routes_manager.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
   late  Widget homeView ;
    CategoryModel? selectedCategory;
   late String currentTitle;
   @override
  void initState() {
    super.initState();
    currentTitle = TextManager.home;
    selectedCategory = null;
    homeView = CategoriesView(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(goToHome: goToHome),
      appBar: AppBar(
        backgroundColor: ColorsManager.black,
        foregroundColor: ColorsManager.white,
        title: Text(currentTitle,),
      actions: [
        IconButton(onPressed: (){
          Navigator.pushNamed(
              context,
              RoutesManager.searchScreen,
              );
        }, icon: SvgPicture.asset(SvgIcons.search))
      ],),
      body: homeView,
    );
  }


   void goToHome() {
     selectedCategory =null ;
     currentTitle = TextManager.home;
    homeView = CategoriesView(onCategoryItemClicked: onCategoryItemClicked);
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryItemClicked(CategoryModel category) {
     selectedCategory =category;
     currentTitle = category.title;
    homeView = SourcesView(category: category);
    setState(() {});
  }
}

import 'package:flutter/material.dart';
import 'package:test_app/features/home/categories_view/categories_view.dart';
import 'package:test_app/features/home/home_drawer/home_drawer.dart';
import 'package:test_app/features/home/sources_view/sources_view.dart';
import 'package:test_app/models/category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   late  Widget homeView ;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeView = CategoriesView(
      onCategoryItemClicked: onCategoryItemClicked,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: HomeDrawer(goToHome: goToHome),
      appBar: AppBar(title: Text("Home")),
      body: homeView,
    );
  }

  void goToHome() {
    homeView = CategoriesView(onCategoryItemClicked: onCategoryItemClicked);
    Navigator.pop(context);
    setState(() {});
  }

  void onCategoryItemClicked(CategoryModel category) {
    homeView = SourcesView(category:  category,);
    setState(() {});
  }
}

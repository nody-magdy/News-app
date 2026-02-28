import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:test_app/features/search_Screen/search_view_model.dart';
import '../../core/widget/custom_text_form_filed.dart';
import '../../core/widget/news_card.dart';
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}
class _SearchScreenState extends State<SearchScreen> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
                CustomTextFormFiled(
                  controller: _searchController,
                  onChanged: (value) {
                    context.read<SearchViewModel>().searchArticles(value);
                  },

                ),

              SizedBox(height: 16),
              Expanded(
                child: Builder(
                  builder: (_) {
                    if (viewModel.isLoading) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if (viewModel.errorMessage != null) {
                      return Center(child: Text(viewModel.errorMessage!));
                    }

                    if (viewModel.articles.isEmpty &&
                        _searchController.text.isNotEmpty) {
                      return Center(child: Text("No Results"));
                    }

                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      separatorBuilder: (context, index) => SizedBox(height: 16.h,),
                      itemCount: viewModel.articles.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: viewModel.articles[index],
                        );
                      },
                    );
                  }
                    ),
              ),
                    ]),
                    ),
                    ),

    );
  }
}

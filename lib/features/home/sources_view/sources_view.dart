import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:test_app/apis/api_service.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/apis/models/sources_response/Source.dart';
import 'package:test_app/core/colors_manager.dart';
import 'package:test_app/data/data_sources/artilces_api_data_source.dart';
import 'package:test_app/data/data_sources/source_api_data_source.dart';
import 'package:test_app/data/repositories/artilces_repo_impl.dart';
import 'package:test_app/data/repositories/sources_repo_impl.dart';
import 'package:test_app/di/service_locator.dart';
import 'package:test_app/features/home/sources_view/articles_view_model.dart';
import 'package:test_app/features/home/sources_view/sources_view_model.dart';
import 'package:test_app/models/category.dart';

import 'article_item.dart';

class SourcesView extends StatefulWidget {
  SourcesView({super.key, required this.category});

  CategoryModel category;

  @override
  State<SourcesView> createState() => _SourcesViewState();
}

class _SourcesViewState extends State<SourcesView> {
  late SourcesViewModel sourcesViewModel;
  late ArticlesViewModel articlesViewModel;

  void fetchData() async {
    sourcesViewModel = serviceLocator.get<SourcesViewModel>();
    articlesViewModel = serviceLocator.get<ArticlesViewModel>();
    await sourcesViewModel.fetchSources(widget.category);
    articlesViewModel.fetchArticles(
      (sourcesViewModel.state as SourcesSuccessState).sources[0],
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: sourcesViewModel),
        ChangeNotifierProvider.value(value: articlesViewModel),
      ],
      child: Column(
        children: [
          Consumer<SourcesViewModel>(
            builder: (context, sourceViewModel, child) {
              switch (sourceViewModel.state) {
                case SourcesSuccessState():
                  {
                    var state = (sourceViewModel.state as SourcesSuccessState);
                    List<Source> sources = state.sources;
                    return DefaultTabController(
                      length: sources.length,
                      child: TabBar(
                        onTap: (index) {
                          articlesViewModel.fetchArticles(state.sources[index]);
                        },
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        dividerColor: Colors.transparent,
                        indicatorColor: ColorsManager.white,
                        labelStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                          color: ColorsManager.white,
                        ),
                        unselectedLabelStyle: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontSize: 14.sp,
                          color: ColorsManager.white,
                        ),
                        tabs: sources
                            .map((source) => Tab(text: source.name))
                            .toList(),
                      ),
                    );
                  }

                case SourcesLoadingState():
                  {
                    return Center(child: CircularProgressIndicator());
                  }
                case SourcesErrorState():
                  var state = (sourceViewModel.state as SourcesErrorState);
                  return Center(
                    child: Text(
                      state.serverError?.message ?? '',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
              }
            },
          ),
          Consumer<ArticlesViewModel>(
            builder: (context, articlesViewModel, child) {
              if (articlesViewModel.isLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (articlesViewModel.errorMessage != null) {
                return Center(child: Text("Error"));
              }
              List<Article> articles = articlesViewModel.articles;
              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) =>
                      ArticleItem(article: articles[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: articles.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

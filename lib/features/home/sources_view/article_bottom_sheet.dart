import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/core/colors_manager.dart';
import 'package:test_app/core/text_manager.dart';
import '../../../core/routes_manager.dart';
class ArticleBottomSheet extends StatelessWidget {
  final Article article;
  const ArticleBottomSheet({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.all(16),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsManager.white,
          borderRadius: BorderRadius.circular(16.r),
          ),
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.all(8.0),
            child: Column(

              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.r),
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? '',
                    height: 200.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        CircularProgressIndicator(value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                SizedBox(height: 8.h,),
                Text(article.description ?? '',
                  style: Theme.of(context).textTheme.headlineSmall,),
                SizedBox(height: 8.h,),
                SizedBox(
                   width: double.infinity,
                    height: 56.h,
                    child:
                    ElevatedButton(onPressed: (){
                      Navigator.pushNamed(
                        context,
                        RoutesManager.articleDetailsScreen,
                        arguments: article
                      );
                    }, child: Text(TextManager.viewFullArticel,))),

              ],
            ),
          ),
        )
      ),
    );
  }
}
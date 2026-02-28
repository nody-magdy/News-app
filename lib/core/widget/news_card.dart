import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_app/core/colors_manager.dart';
import '../../apis/models/articles_response/Article.dart';
class NewsCard extends StatelessWidget {
  final Article article;
  const NewsCard({super.key,required this.article});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(left: 16,right: 16),
      child: Container(
        width: 361.w,
        decoration: BoxDecoration(
          border: BoxBorder.all(
            color: ColorsManager.white,
            width: 1.w
          ),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
        Padding(
          padding: REdgeInsets.all(8.0),
          child: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: CachedNetworkImage(
            imageUrl: article.urlToImage ?? '',
            width: 345.w,
            height: 220.h,
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
                ),
        ),
            SizedBox(height:10.h,),
            Padding(
              padding: REdgeInsets.only(left: 8,right: 8),
              child: Text(article.description ?? '',style: Theme.of(context).textTheme.bodyMedium,),
            ),
            SizedBox(height:10.h,),
            Padding(
              padding: REdgeInsets.only(left: 8 , right: 8,bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Expanded(
                child: Text(
                "By : ${article.author ?? "Unknown"}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
              ),
              Expanded(
                child: Text(
                  article.publishedAt ?? "",
                  style: Theme.of(context).textTheme.displaySmall
                  ),
              ),
                ],
              ),
            )
      ],
        ),
      ),

    );
  }
}

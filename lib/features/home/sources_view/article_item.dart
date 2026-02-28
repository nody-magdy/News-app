import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/apis/models/articles_response/Article.dart';
import 'package:test_app/core/colors_manager.dart';
class ArticleItem extends StatelessWidget {
Article article ;
 ArticleItem({required this.article});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: ColorsManager.white, width: 2, ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Column(
        children: [
          CachedNetworkImage(
            imageUrl: article.urlToImage ?? '',
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
          SizedBox(height: 10.h,),
          Text(article.title ?? '', style: GoogleFonts.inter(fontWeight: FontWeight.w700,
              color: ColorsManager.white, fontSize: 16.sp),),
          SizedBox(height: 10.h,),
          Row(
            children: [
              Expanded(child: Text(article.author ?? '', style: GoogleFonts.inter(fontWeight: FontWeight.w500,
                  color: ColorsManager.grey, fontSize: 12.sp))),
              Expanded(child: Text(article.publishedAt ?? '',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w500,
                  color: ColorsManager.grey, fontSize: 12.sp)))
            ],
          )

        ],
      ),
    );
  }
}

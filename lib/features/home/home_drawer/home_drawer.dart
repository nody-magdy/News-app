import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/assets_manager.dart';
import '../../../core/colors_manager.dart';
import '../../../core/routes_manager.dart';
import '../../../core/text_manager.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key,required this.goToHome});
  final void Function()goToHome;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            decoration: BoxDecoration(
                color: ColorsManager.white
            ),
            child: Text(TextManager.newsApp,
                style: Theme.of(context).textTheme.headlineMedium),

          ),
          Padding(
            padding: REdgeInsets.only(left:16,top: 16),
            child:InkWell(
                onTap: () {
                  goToHome();
                },
              child: Row(
                children: [
                  SvgPicture.asset(SvgIcons.general),
                  SizedBox(width: 6.h,),
                  Text(TextManager.goToHome,style: Theme.of(context).textTheme.bodySmall,),
                ],

              ),
            ),

          ),

          Divider(
            height: 48.h,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: REdgeInsets.only(left: 16),
            child: Row(
              children: [
                SvgPicture.asset(SvgIcons.themeIcon),
                SizedBox(width: 6.h,),
                Text(TextManager.theme,style: Theme.of(context).textTheme.titleSmall,),
              ],
            ),
          ),
          SizedBox(height: 8.h,),
          Padding(
            padding: REdgeInsets.only(left: 16,right: 16),
            child: DropdownButtonFormField<String>(
                isExpanded: true,
                dropdownColor: ColorsManager.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                        color: ColorsManager.black
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                        color: ColorsManager.white
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                        color: ColorsManager.white
                    ),),

                ),
                items:[ DropdownMenuItem(
                  value: "light",
                  child: Text("Light",style: Theme.of(context).textTheme.labelSmall,),
                ),
                  DropdownMenuItem(
                      value: "dark",
                      child: Text("Dark",style: Theme.of(context).textTheme.labelSmall,)),
                ],

                onChanged: (_){}),
          ),
          Divider(
            height: 48.h,
            indent: 16,
            endIndent: 16,
          ),
          Padding(
            padding: REdgeInsets.only(left: 16),
            child:Row(
              children: [
                SvgPicture.asset(SvgIcons.language),
                SizedBox(width: 6.h,),
                Text(TextManager.lang,style: Theme.of(context).textTheme.titleSmall,)
              ],

            ),

          ),
          SizedBox(height: 8.h,),
          Padding(
            padding: REdgeInsets.only(left: 16,right: 16),
            child: DropdownButtonFormField<String>(
                isExpanded: true,
                dropdownColor: ColorsManager.black,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                        color: ColorsManager.white
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                        color: ColorsManager.white
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.r),
                    borderSide: BorderSide(
                        color: ColorsManager.white
                    ),),

                ),
                items:[ DropdownMenuItem(
                  value: "ar",
                  child: Text("Arabic",style: Theme.of(context).textTheme.labelSmall,),
                ),
                  DropdownMenuItem(
                      value: "en",
                      child: Text("English",style: Theme.of(context).textTheme.labelSmall,)),
                ],

                onChanged: (_){}),
          ),


        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_app/core/colors_manager.dart';

class HomeDrawer extends StatelessWidget {
   HomeDrawer({super.key, required this.goToHome});
void Function() goToHome;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsManager.black,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
              height: 166.h,
              color: ColorsManager.white,
              child: Text("News App",style: GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.bold, color: ColorsManager.black),)),
          SizedBox(height: 16,),
          InkWell(
            onTap: (){
              goToHome();
            },
            child: Row(
              children: [
                Icon(Icons.home, color: Colors.white,),
                SizedBox(width: 8,),
                Text("Go To Home", style:  GoogleFonts.inter(fontSize: 24.sp, fontWeight: FontWeight.bold, color: ColorsManager.white)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

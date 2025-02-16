
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeaderBar extends StatefulWidget implements PreferredSizeWidget {

  final String title;
  final Color backgroundColor;
  final bool darkMode;

  HeaderBar(this.title, {this.backgroundColor=Colors.blue,this.darkMode = false});

  @override
  State<StatefulWidget> createState() => new HeaderBarState();

  @override
  Size get preferredSize => new Size.fromHeight(56.h);

}

class HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    ///设置状态栏和导航栏主题风格
    SystemChrome.setSystemUIOverlayStyle(widget.darkMode?SystemUiOverlayStyle.dark:SystemUiOverlayStyle.light);
    return Container(
      padding: EdgeInsets.only(top: ScreenUtil().statusBarHeight,),
      color: widget.backgroundColor,
      alignment: Alignment.centerLeft,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white,),
              onPressed: () => Get.back(),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              widget.title,
              style: TextStyle(color: Colors.white, fontSize: 18.sp),
            ),
          ),
        ],
      ),
    );
  }
}

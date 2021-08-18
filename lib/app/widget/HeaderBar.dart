import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../index.dart';

class HeaderBar extends StatefulWidget implements PreferredSizeWidget {
  String title;
  Color? backgroundColor = Colors.blue;
  bool? darkMode = true;
  HeaderBar(this.title, {this.backgroundColor,this.darkMode});

  @override
  State<StatefulWidget> createState() => new HeaderBarState();

  @override
  Size get preferredSize => new Size.fromHeight(FontSize.size_56);

}

class HeaderBarState extends State<HeaderBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top,),
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
                style: TextStyle(color: Colors.white, fontSize: FontSize.size_18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

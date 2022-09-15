
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/intl/intl.dart';
import 'package:tin_flutter/app/res/images.dart';
import 'package:tin_flutter/ui/demo/mine/mine_logic.dart';

class MinePage extends StatefulWidget {
  MinePage({Key? key}) : super(key: key);

  @override
  _MineState createState() => _MineState();
}

class _MineState extends State<MinePage> {

  final logic = Get.find<MineLogic>();
  final state = Get.find<MineLogic>().state;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl().other),
      ),
      body: Center(
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: Axis.vertical,
          children: [
            Image.asset(Images.ic_launcher),
            Text(Intl().other)
          ],
        ),
      ),
    );
  }





}
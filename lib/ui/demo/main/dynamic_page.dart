import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/intl/intr.dart';
import 'package:tin_flutter/app/res/dimens.dart';

import 'main_logic.dart';
import 'main_state.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicState createState() => _DynamicState();

}

class _DynamicState extends State<DynamicPage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;

  final List<String> entries = <String>['A', 'B', 'C', 'D','E','F','G','H','I','J'];
  final List<int> colorCodes = <int>[900,800,700,600, 500, 400, 300, 200, 100,50];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(Intr().activity),
      ),
      body: Obx( ()=> ListView.builder(
          padding: EdgeInsets.all(Dimens.d_8.r),
          itemCount: state.count.value,
          itemBuilder:(BuildContext context, int index) {
            return Container(
              height: Dimens.d_30.h,
              color: Colors.amber[colorCodes[index%10]],
              child: Center(child: Text('Entry ${entries[index%10]}')),
            );
          }
      )),
    );
  }
}

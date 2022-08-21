
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/intl/translation.dart';
import 'package:tin_flutter/app/res/dimens.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'count_logic.dart';
import 'count_state.dart';

class CountPage extends StatefulWidget {
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  final logic = Get.find<CountLogic>();
  final CountState state = Get.find<CountLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Tr().count),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Obx(
          () => Text('${state.count.value}',
              style: TextStyle(fontSize: Dimens.d_30.sp)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<CountLogic>();
    super.dispose();
  }
}

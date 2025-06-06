
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/res/intl.dart';
import 'storage_logic.dart';
import 'storage_state.dart';

class StoragePage extends StatefulWidget {
  @override
  _StoragePageState createState() => _StoragePageState();
}

class _StoragePageState extends State<StoragePage> {
  final logic = Get.find<StorageLogic>();
  final StorageState state = Get.find<StorageLogic>().state;

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Intl().sayHello),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Obx(
              () => Text(
                  '${state.localIndex.value}',
                  style: TextStyle(fontSize: 30.sp)
              ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          logic.increase();
        },
      ),
    );
    }

  @override
  void dispose() {
    Get.delete<StorageLogic>();
    super.dispose();
  }
}
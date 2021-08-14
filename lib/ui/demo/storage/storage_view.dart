import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/AppData.dart';
import 'package:tin_flutter/generated/l10n.dart';

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
        title: Text(S.of(context).storage),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Center(
        child: Obx(
              () => Text('${AppData.queryLocaleIndex()}', style: TextStyle(fontSize: 30.0)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_box),
        onPressed: () {
          AppData.saveLocaleIndex(Random().nextInt(1000));
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'connect_logic.dart';
import 'connect_state.dart';

class ConnectPage extends StatefulWidget {
  @override
  _ConnectPageState createState() => _ConnectPageState();
}

class _ConnectPageState extends State<ConnectPage> {
  final logic = Get.find<ConnectLogic>();
  final ConnectState state = Get.find<ConnectLogic>().state;

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('connect'.tr),
        automaticallyImplyLeading: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.start,
            children: [
              TextButton(
                child: Text('getx_get'.tr),
                onPressed: () => {
                  logic.createGet()
                },
              ),
              TextButton(
                child: Text('getx_post'.tr),
                onPressed: () => {
                  logic.createPost()
                },
              ),
            ],
          ),
          Obx(()=> Text('${state.result}'),)
        ],
      ),
    );
    }

  @override
  void dispose() {
    Get.delete<ConnectLogic>();
    super.dispose();
  }
}
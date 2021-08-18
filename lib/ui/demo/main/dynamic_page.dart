import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/generated/l10n.dart';

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
        title: Text(S.of(context).activity),
      ),
      body: Obx( ()=> ListView.builder(
          padding: EdgeInsets.all(FontSize.size_8),
          itemCount: state.count.value,
          itemBuilder:(BuildContext context, int index) {
            return Container(
              height: FontSize.size_50,
              color: Colors.amber[colorCodes[index%10]],
              child: Center(child: Text('Entry ${entries[index%10]}')),
            );
          }
      )),
    );
  }
}

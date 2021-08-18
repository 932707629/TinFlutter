import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/widget/HeaderBar.dart';
import 'package:tin_flutter/generated/l10n.dart';

import 'rx_dart_logic.dart';
import 'rx_dart_state.dart';

class RxDartPage extends StatefulWidget {
  @override
  _RxDartPageState createState() => _RxDartPageState();
}

class _RxDartPageState extends State<RxDartPage> {
  final logic = Get.find<RxDartLogic>();
  final RxDartState state = Get.find<RxDartLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderBar(
        S.of(context).rx_dart,
        backgroundColor: Colors.amberAccent,
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RxDartLogic>();
    super.dispose();
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_logic.dart';
import 'loading_state.dart';

class LoadingPage extends StatefulWidget {
  @override
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final logic = Get.find<LoadingLogic>();
  final LoadingState state = Get.find<LoadingLogic>().state;

  @override
    Widget build(BuildContext context) {
      return Scaffold();
    }

  @override
  void dispose() {
    Get.delete<LoadingLogic>();
    super.dispose();
  }
}
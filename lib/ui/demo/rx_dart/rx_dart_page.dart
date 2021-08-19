
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Rx;
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/app/network/AppConnect.dart';
import 'package:tin_flutter/app/widget/HeaderBar.dart';
import 'package:tin_flutter/generated/l10n.dart';
import 'package:rxdart/rxdart.dart';
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
      body: Wrap(
        spacing: Numbers.size_4,
        children: [
          TextButton(
            onPressed: () => {
              Stream.fromIterable(['1', '2', '3'])
                  .map((event) => event + '0')
                  .listen((event) {
                logger.i('下游收到的$event');
              })
            },
            child: Text("Map"),
          ),
          TextButton(
            onPressed: () => {
              Stream.fromIterable(['1', '2', '3'])
                  .expand((element) => [element,'4','5'])
                  .listen((event) {
                logger.i('下游收到的$event');
              }),
            },
            child: Text("Expand"),
          ),
          TextButton(
            onPressed: () => {
              Rx.merge([
                Stream.fromIterable(['1', '2', '3'])
              ,Stream.fromIterable(['4', '5', '6'])
              ,Stream.fromIterable(['7', '8', '9'])
              ]).listen((event) {
                logger.i('下游收到的$event');
              }),
            },
            child: Text("Merge"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RxDartLogic>();
    Get.delete<AppConnect>();
    super.dispose();
  }
}

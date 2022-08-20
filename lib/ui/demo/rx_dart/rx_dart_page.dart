
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Rx;
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/app/network/app_connect.dart';
import 'package:tin_flutter/app/widget/header_bar.dart';
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
  CompositeSubscription subscription=CompositeSubscription();

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
              }).addTo(subscription)
            },
            child: Text("Map"),
          ),
          TextButton(
            onPressed: () => {
              Stream.fromIterable(['1', '2', '3'])
                  .expand((element) => [element,'4','5'])
                  .listen((event) {
                logger.i('下游收到的$event');
              }).addTo(subscription),
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
              }).addTo(subscription),
            },
            child: Text("Merge"),
          ),
          TextButton(
            onPressed: () => {
              Rx.concat([
                Stream.fromIterable(['1', '2', '3'])
                ,Stream.fromIterable(['4', '5', '6'])
                ,Stream.fromIterable(['7', '8', '9'])
              ]).listen((event) {
                logger.i('下游收到的$event');
              }).addTo(subscription),
            },
            child: Text("Concat"),
          ),
          TextButton(
            onPressed: () => {
              Stream.fromIterable(['1','2','3'])
              .every((element) => element == '4')
              .asStream().listen((event) {
                logger.i('下游收到的$event');
              }).addTo(subscription)
            },
            child: Text("Every"),
          ),
          TextButton(
            onPressed: () => {
              Rx.timer('hi', Duration(seconds: 10))
              .listen((event) {
                logger.i('下游收到的$event');
              }).addTo(subscription)
            },
            child: Text("Timer"),
          ),
          TextButton(
            onPressed: () => {
              Stream.periodic(Duration(seconds: 1))
                  .listen((event) {
                logger.i('下游收到的$event');
              }).addTo(subscription)
            },
            child: Text("Periodic"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<RxDartLogic>();
    Get.delete<AppConnect>();
    subscription.dispose();
    super.dispose();
  }



}

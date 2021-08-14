import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/generated/l10n.dart';

import 'multiplex_logic.dart';
import 'multiplex_state.dart';

class MultiplexPage extends StatefulWidget {
  @override
  _MultiplexPageState createState() => _MultiplexPageState();
}

class _MultiplexPageState extends State<MultiplexPage>
    with SingleTickerProviderStateMixin {
  final logic = Get.find<MultiplexLogic>();
  final MultiplexState state = Get.find<MultiplexLogic>().state;

//  EasyRefreshController _controller = EasyRefreshController();
  // 条目总数
  int _count = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EasyRefresh.builder(
        builder: (context, physics, header, footer) {
          return CustomScrollView(
            physics: physics,
            slivers: [
              SliverAppBar(
                title: Text("多布局"),
                pinned: true,
              ),
              header as Widget,
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 150,
                    child: PageView(children: getBannerWidget()),
                  ),
                  Container(
                    height: 150,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: buildGradView(context),
                  ),
                ]),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return GestureDetector(
                    onTap: () {
                      showToast(S.of(context).sayHello(index));
                    },
                    child: Card(
                      child: new Container(
                        height: 60,
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.centerLeft,
                        child: new Text("Item $index"),
                      ),
                    ),
                  );
                }, childCount: _count),
              ),
              footer as Widget,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              ///此state对象当前在树中
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1), () {
            if (mounted) {
              setState(() {
                _count += 20;
              });
            }
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    Get.delete<MultiplexLogic>();
    super.dispose();
  }

  /// 获取头部banner数据
  List<Widget> getBannerWidget() {
    List<MaterialAccentColor> colors = [
      Colors.redAccent,
      Colors.blueAccent,
      Colors.greenAccent,
      Colors.yellowAccent
    ];
    List<Widget> widgets = [];
    colors.forEach((element) {
      widgets.add(
        Container(
          color: element,
          margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        ),
      );
    });
    return widgets;
  }

  ///构建横纵列表
  Widget buildGradView(BuildContext context) {
    List<List<Widget>> widgets = [];
    widgets.add([
      Icon(Icons.ac_unit),
      Text(S.of(context).ac_unit),
    ]);
    widgets.add([
      Icon(Icons.access_alarm),
      Text(S.of(context).access_alarm),
    ]);
    widgets.add([
      Icon(Icons.accessibility),
      Text(S.of(context).accessibility),
    ]);
    widgets.add([
      Icon(Icons.account_balance),
      Text(S.of(context).account_balance),
    ]);
    widgets.add([
      Icon(Icons.account_balance_wallet),
      Text(S.of(context).account_balance_wallet),
    ]);
    widgets.add([
      Icon(Icons.add_a_photo),
      Text(S.of(context).add_a_photo),
    ]);
    widgets.add([
      Icon(Icons.add_moderator),
      Text(S.of(context).add_moderator),
    ]);
    widgets.add([
      Icon(Icons.add_shopping_cart),
      Text(S.of(context).add_shopping_cart),
    ]);

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            showToast(S.of(context).sayHello(index));
          },
          child: Column(
            children: widgets[index],
          ),
        );
      },
      itemCount: widgets.length,
    );
  }
}

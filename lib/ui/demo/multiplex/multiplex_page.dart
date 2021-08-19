import 'dart:async';
import 'dart:math';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
                    height: Numbers.size_150.h,
                    child: PageView(children: getBannerWidget()),
                  ),
                  SizedBox(
                    height: Numbers.size_150.h,
                    child: buildGradView(context),
                  ),
                ]),
              ),
              Obx( ()=> SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return GestureDetector(
                        onTap: () {
                          showToast(S.of(context).sayHello(index));
                        },
                        child: Card(
                          child: new Container(
                            height: Numbers.size_60.h,
                            padding: EdgeInsets.only(left: Numbers.size_20.r),
                            alignment: Alignment.center,
                            child: new Text("Item $index",textAlign: TextAlign.center,),
                          ),
                        ),
                      );
                    }, childCount: state.count.value),
                  )
              ),
              footer as Widget,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(microseconds: Numbers.int_100), () {
            if (mounted) {
              ///此state对象当前在树中
              state.count.value=20;
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(microseconds: Numbers.int_100), () {
            if (mounted) {
              logic.increase();
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
    List<ActionItem> items=[
      ActionItem(Icons.ac_unit, S.of(context).ac_unit),
      ActionItem(Icons.access_alarm, S.of(context).access_alarm),
      ActionItem(Icons.accessibility, S.of(context).accessibility),
      ActionItem(Icons.account_balance, S.of(context).account_balance),
      ActionItem(Icons.account_balance_wallet, S.of(context).account_balance_wallet),
      ActionItem(Icons.add_a_photo, S.of(context).add_a_photo),
      ActionItem(Icons.add_moderator, S.of(context).add_moderator),
      ActionItem(Icons.add_shopping_cart, S.of(context).add_shopping_cart),
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Numbers.int_4,
        childAspectRatio: Numbers.size_1_7,
      ),
      itemBuilder: (context, index) {
        var action = items[index];
        return GestureDetector(
          onTap: () {
            showToast(S.of(context).sayHello(index));
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(action.iconData),
              Text(action.title)
            ],
          )
        );
      },
      itemCount: items.length,
    );
  }
}

class ActionItem {
  final String title;
  final IconData iconData;
  const ActionItem(this.iconData,this.title);
}

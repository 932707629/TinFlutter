import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/global.dart';
import 'package:tin_flutter/app/res/intl.dart';
import 'package:tin_flutter/generated/gen/colors.gen.dart';
import '../../../generated/gen/assets.gen.dart';
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
                title: Text(Intl().multiple),
                pinned: true,
              ),
              header as Widget,
              SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(
                    height: 150.h,
                    child: PageView(children: getBannerWidget()),
                  ),
                  buildGridView(context),
                ]),
              ),
              Obx( ()=> SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return GestureDetector(
                        onTap: () {
                          showToast(Intl().sayHello);
                        },
                        child: Card(
                          child: new Container(
                            height: 60.h,
                            padding: EdgeInsets.only(left: 20.r),
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
          await Future.delayed(Duration(microseconds: 100), () {
            if (mounted) {
              ///此state对象当前在树中
              state.count.value=20;
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(microseconds: 100), () {
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
          margin: EdgeInsets.symmetric(horizontal: 15.r, vertical: 10.r),
        ),
      );
    });
    return widgets;
  }

  ///构建横纵列表
  Widget buildGridView(BuildContext context) {
    List<ActionItem> items=[
      ActionItem(Icons.ac_unit, Intl().ac_unit),
      ActionItem(Icons.access_alarm, Intl().access_alarm),
      ActionItem(Icons.accessibility, Intl().accessibility),
      ActionItem(Icons.account_balance, Intl().account_balance),
      ActionItem(Icons.account_balance_wallet, Intl().account_balance_wallet),
      ActionItem(Icons.add_a_photo, Intl().add_a_photo),
      ActionItem(Icons.add_moderator, Intl().add_moderator),
      ActionItem(Icons.add_shopping_cart, Intl().add_shopping_cart),
    ];
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1.7,
      ),
      itemBuilder: (context, index) {
        var action = items[index];
        return GestureDetector(
          onTap: () {
            showToast(Intl().sayHello);
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

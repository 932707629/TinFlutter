import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/global.dart';
import 'package:tin_flutter/app/intl/translation.dart';
import 'package:tin_flutter/app/res/dimens.dart';
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
                    height: Dimens.d_150.h,
                    child: PageView(children: getBannerWidget()),
                  ),
                  SizedBox(
                    height: Dimens.d_150.h,
                    child: buildGradView(context),
                  ),
                ]),
              ),
              Obx( ()=> SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return GestureDetector(
                        onTap: () {
                          showToast(Tr().sayHello);
                        },
                        child: Card(
                          child: new Container(
                            height: Dimens.d_60.h,
                            padding: EdgeInsets.only(left: Dimens.d_20.r),
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
          await Future.delayed(Duration(microseconds: Dimens.i_100), () {
            if (mounted) {
              ///此state对象当前在树中
              state.count.value=20;
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(microseconds: Dimens.i_100), () {
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
          margin: EdgeInsets.symmetric(horizontal: Dimens.d_15.r, vertical: Dimens.d_10.r),
        ),
      );
    });
    return widgets;
  }

  ///构建横纵列表
  Widget buildGradView(BuildContext context) {
    List<ActionItem> items=[
      ActionItem(Icons.ac_unit, Tr().ac_unit),
      ActionItem(Icons.access_alarm, Tr().access_alarm),
      ActionItem(Icons.accessibility, Tr().accessibility),
      ActionItem(Icons.account_balance, Tr().account_balance),
      ActionItem(Icons.account_balance_wallet, Tr().account_balance_wallet),
      ActionItem(Icons.add_a_photo, Tr().add_a_photo),
      ActionItem(Icons.add_moderator, Tr().add_moderator),
      ActionItem(Icons.add_shopping_cart, Tr().add_shopping_cart),
    ];
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: Dimens.i_4,
        childAspectRatio: Dimens.d_1_7,
      ),
      itemBuilder: (context, index) {
        var action = items[index];
        return GestureDetector(
          onTap: () {
            showToast(Tr().sayHello);
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

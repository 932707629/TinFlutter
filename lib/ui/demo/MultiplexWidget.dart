import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/bean/EventTaskBean.dart';

/// 遇到的问题
/// 1.sliverOverlapAbsorberHandleFor是个悬浮tab用的 没有悬浮tab不用设置
class MultiplexWidget extends StatefulWidget {
  @override
  _MultiplexWidgetState createState() => _MultiplexWidgetState();
}

class _MultiplexWidgetState extends State<MultiplexWidget>
    with SingleTickerProviderStateMixin {
//  EasyRefreshController _controller = EasyRefreshController();
  // 条目总数
  int _count = 20;
  StreamSubscription<EventTaskBean> subscription;

  @override
  void initState() {
    super.initState();
    subscription = behaviorBus.on<EventTaskBean>().listen((event) {
      print("收到消息了${event.value}");
      showToast("收到消息了${event.value}");
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    super.dispose();
  }

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
              header,
              SliverList(
                  delegate: SliverChildListDelegate([
                    SizedBox(
                      height: 150,
                      child: PageView(children: getBannerWidget()),
                    ),
                    Container(
                      height: 150,
                      margin: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                      child: buildGradView(),
                    )
                  ])),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return GestureDetector(
                      onTap: (){
                        showToast("点击item$index");
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
                  }, childCount: _count)),
              footer,
            ],
          );
        },
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1),(){
            if(mounted){///此state对象当前在树中
              setState(() {
                _count = 20;
              });
            }
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 1),(){
            if(mounted){
              setState(() {
                _count += 20;
              });
            }
          });
        },
      ),
    );
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
  Widget buildGradView() {
    List<List<Widget>> widgets=[];
    widgets.add([Icon(Icons.ac_unit), Text("雪花"),]);
    widgets.add([Icon(Icons.access_alarm), Text("闹钟"),]);
    widgets.add([Icon(Icons.accessibility), Text("健康"),]);
    widgets.add([Icon(Icons.account_balance), Text("酒店"),]);
    widgets.add([Icon(Icons.account_balance_wallet), Text("钱包"),]);
    widgets.add([Icon(Icons.add_a_photo), Text("摄影"),]);
    widgets.add([Icon(Icons.add_moderator), Text("安全"),]);
    widgets.add([Icon(Icons.add_shopping_cart), Text("购物"),]);

    return GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 4,
      childAspectRatio: 1.5,
    ), itemBuilder:(context,index){
      return GestureDetector(
        onTap: (){
          showToast("点击item$index");
        },
        child: Column(
          children: widgets[index],
        ),
      );
    },itemCount: widgets.length,);
  }




}

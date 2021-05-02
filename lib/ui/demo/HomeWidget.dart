
import 'package:flutter/material.dart';
import 'package:tin_flutter/app/Routes.dart';
import 'package:tin_flutter/app/index.dart';
import 'package:tin_flutter/bean/EventTaskBean.dart';


class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body:Column(
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            alignment: WrapAlignment.center,
            children: [
              TextButton(
                child: Text("多布局"),
                onPressed: ()=>{
                  behaviorBus.fire(EventTaskBean(0, "你好,欢迎使用EventBus")),
                  Navigator.pushNamed(context, Routes.multiplexWidget)
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}





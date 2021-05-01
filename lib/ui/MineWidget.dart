import 'package:flutter/material.dart';

class MineWidget extends StatefulWidget {
  MineWidget({Key key}) : super(key: key);

  @override
  _MineWidgetState createState() {
    return _MineWidgetState();
  }
}

class _MineWidgetState extends State<MineWidget> {
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
        title: Text("我的"),
      ),
      body: Center(
        child: Text("我的里了"),
      ),
    );
  }
}
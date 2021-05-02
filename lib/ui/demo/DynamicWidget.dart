import 'package:flutter/material.dart';



class DynamicWidget extends StatefulWidget {
  DynamicWidget({Key key}) : super(key: key);

  @override
  _DynamicWidgetState createState() {
    return _DynamicWidgetState();
  }
}

class _DynamicWidgetState extends State<DynamicWidget> {
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
        title: Text("动态"),
      ),
      body: Center(
        child: Text("动态里了"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tin_flutter/generated/l10n.dart';

class DynamicPage extends StatefulWidget {
  DynamicPage({Key? key}) : super(key: key);

  @override
  _DynamicState createState() => _DynamicState();

}

class _DynamicState extends State<DynamicPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).activity),
      ),
      body: Center(
        child: Text(S.of(context).activity),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:tin_flutter/ui/DynamicWidget.dart';
import 'package:tin_flutter/ui/HomeWidget.dart';
import 'package:tin_flutter/ui/MineWidget.dart';

class MainPage extends StatefulWidget{
  final String title;

  MainPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage> {
  double _selectedIndex = 0;
  PageController _pageController;
  List<Widget> pages=[HomeWidget(), DynamicWidget(), MineWidget(),];
  List<String> tabs=["首页","动态","我的"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(
      initialPage: pages.length,
      keepPage: true,
      viewportFraction: 1,
    );
    _pageController.addListener(() {
      setState(() {
        _selectedIndex = _pageController.page;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
        //
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        // title: Text(widget.title),
      // ),
      body: PageView(
        children: pages,//这个就类似于viewpage
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: tabs[0]),
          BottomNavigationBarItem(icon: Icon(Icons.dynamic_form), label: tabs[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: tabs[2]),
        ],
        currentIndex: _selectedIndex.toInt(),
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index.toDouble();
      _pageController.jumpToPage(index);
    });
  }
}


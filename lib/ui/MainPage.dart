
import 'package:flutter/material.dart';
import 'file:///D:/Flutterworkspace/TinFlutter/lib/ui/demo/DynamicWidget.dart';
import 'file:///D:/Flutterworkspace/TinFlutter/lib/ui/demo/HomeWidget.dart';
import 'file:///D:/Flutterworkspace/TinFlutter/lib/ui/demo/MineWidget.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tin_flutter/app/index.dart';

class MainPage extends StatefulWidget{

  MainPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MainPageState();
  }

}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  PageController _pageController;
  List<Widget> pages=[HomeWidget(), DynamicWidget(), MineWidget(),];
  List<String> tabs=["首页","动态","我的"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(
//      initialPage: pages.length,
//      keepPage: true,
//      viewportFraction: 1,
    );

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      EasyRefresh.defaultHeader=MaterialHeader();
      EasyRefresh.defaultFooter=MaterialFooter();
      checkPermission();
    });

  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        onPageChanged: (index){
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: tabs[0]),
          BottomNavigationBarItem(icon: Icon(Icons.dynamic_form), label: tabs[1]),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: tabs[2]),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _pageController.animateToPage(index, duration: Duration(milliseconds: 10),  curve: Curves.linear);
    });
  }
}

Future<void> checkPermission() async {
  ///android权限申请需要在AndroidManifest.xml里添加对应的权限声明
  ///iOS
  // You can request multiple permissions at once.
  Map<Permission, PermissionStatus> statuses = await [
    Permission.phone,
    Permission.storage,
  ].request();
  statuses.forEach((key, value) {
    if(value.isDenied){///被拒绝了
      showToast("权限已被拒绝");
      return;
    }
  });
}


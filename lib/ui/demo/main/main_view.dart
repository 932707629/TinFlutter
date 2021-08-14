
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/generated/l10n.dart';

import 'dynamic_view.dart';
import 'home_view.dart';
import 'mine_view.dart';
import 'main_logic.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;
  int _selectedIndex = 0;
  PageController? _pageController;
  List<Widget> pages = [HomePage(), DynamicPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    _pageController = PageController();

    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      EasyRefresh.defaultHeader = MaterialHeader();
      EasyRefresh.defaultFooter = MaterialFooter();
      logic.checkPermission(context);
    });
    // List<String> tabs = [S.current.home, S.current.activity, S.current.other];
    return Scaffold(
      body: PageView(
        children: pages, //这个就类似于viewpage
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: S.of(context).home),
          BottomNavigationBarItem(
              icon: Icon(Icons.dynamic_form), label: S.of(context).activity),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervisor_account), label: S.of(context).other),
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
      _pageController?.animateToPage(index,
          duration: Duration(milliseconds: 10), curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    _pageController?.dispose();
    Get.delete<MainLogic>();
    super.dispose();
  }




}

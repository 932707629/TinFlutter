
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tin_flutter/app/res/intl.dart';
import '../dynamic/dynamic_page.dart';
import '../home/home_page.dart';
import '../mine/mine_page.dart';
import 'main_logic.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;
  PageController? _pageConIntloller;
  List<Widget> pages = [HomePage(), DynamicPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    _pageConIntloller = PageController();

    return Scaffold(
      body: PageView(
        children: pages, //这个就类似于viewpage
        controller: _pageConIntloller,
        onPageChanged: (index) {
          state.selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: Obx( ()=>
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: Intl().home),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dynamic_form), label: Intl().activity
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account), label: Intl().other
              ),
            ],
            currentIndex: state.selectedIndex.value,
            fixedColor: Colors.blue,
            type: BottomNavigationBarType.fixed,
            onTap: _onItemTapped,
          )
      ),
    );
  }

  void _onItemTapped(int index) {
    _pageConIntloller?.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageConIntloller?.dispose();
    Get.delete<MainLogic>();
    super.dispose();
  }




}

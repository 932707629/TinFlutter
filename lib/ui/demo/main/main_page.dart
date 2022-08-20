
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'dynamic_page.dart';
import 'home_page.dart';
import 'mine_page.dart';
import 'main_logic.dart';
import 'main_state.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final logic = Get.find<MainLogic>();
  final MainState state = Get.find<MainLogic>().state;
  PageController? _pageController;
  List<Widget> pages = [HomePage(), DynamicPage(), MinePage()];

  @override
  Widget build(BuildContext context) {
    _pageController = PageController();

    // SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
    //   EasyRefresh.defaultHeader = MaterialHeader();
    //   EasyRefresh.defaultFooter = MaterialFooter();
    // });
    // List<String> tabs = [S.current.home, S.current.activity, S.current.other];
    return Scaffold(
      body: PageView(
        children: pages, //这个就类似于viewpage
        controller: _pageController,
        onPageChanged: (index) {
          state.selectedIndex.value = index;
        },
      ),
      bottomNavigationBar: Obx( ()=>
          BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'.tr),
              BottomNavigationBarItem(
                  icon: Icon(Icons.dynamic_form), label: 'activity'.tr
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.supervisor_account), label: 'other'.tr
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
    _pageController?.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController?.dispose();
    Get.delete<MainLogic>();
    super.dispose();
  }




}

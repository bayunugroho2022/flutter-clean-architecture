
import 'package:clean_architecture/presentation/main/home_view.dart';
import 'package:clean_architecture/presentation/main/notification_view.dart';
import 'package:clean_architecture/presentation/main/search_view.dart';
import 'package:clean_architecture/presentation/main/setting_view.dart';
import 'package:clean_architecture/presentation/resources/color_manager.dart';
import 'package:clean_architecture/presentation/resources/string_manager.dart';
import 'package:clean_architecture/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  List<Widget> views = [
    const HomeView(),
    const SearchView(),
    const NotificationView(),
    const SettingView()
  ];

  List<String> title = [
    AppStrings.home,
    AppStrings.search,
    AppStrings.notifcation,
    AppStrings.setting,
  ];

  var _title = AppStrings.home;
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title,),),
      body: views[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorManager.black, spreadRadius: AppSize.s1_5)
          ],
        ),
        child: BottomNavigationBar(
          selectedItemColor: ColorManager.primary,
          unselectedItemColor: ColorManager.grey,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: AppStrings.home),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: AppStrings.search),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: AppStrings.notifcation),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: AppStrings.setting),
          ],
          onTap: onTap,
        ),
      ),
    );
  }

  onTap(int index){
    setState(() {
      _currentIndex = index;
      _title = title[index];
    });
  }
}

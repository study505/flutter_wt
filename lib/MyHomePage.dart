import 'package:flutter/material.dart';
import 'package:flutter_wt/FirstPage.dart';
import 'package:flutter_wt/SecondPage.dart';
import 'package:flutter_wt/utils/ImageUtils.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _pageList;
  var _pageTitles;
  var _pageIcons;
  var _pageActionIcons;
  int _currentIndex = 0;

  final _pageController = new PageController();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    _pageList = [FirstPage(), SecondPage(), FirstPage(), SecondPage()];
    _pageTitles = ["主页", "通讯录", "发现", "我的"];
    _pageIcons = [
      ImageUtils.loadAssetImage("main/icon_home_n", width: 24.0, height: 24.0),
      ImageUtils.loadAssetImage("main/icon_hot_n", width: 24.0, height: 24.0),
      ImageUtils.loadAssetImage("main/icon_mine_n", width: 24.0, height: 24.0),
      ImageUtils.loadAssetImage("main/icon_setting_n", width: 24.0, height: 24.0),
    ];
    _pageActionIcons = [
      ImageUtils.loadAssetImage("main/icon_home_s", width: 24.0, height: 24.0),
      ImageUtils.loadAssetImage("main/icon_hot_s", width: 24.0, height: 24.0),
      ImageUtils.loadAssetImage("main/icon_mine_s", width: 24.0, height: 24.0),
      ImageUtils.loadAssetImage("main/icon_setting_s", width: 24.0, height: 24.0),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: List.generate(
            _pageTitles.length,
            (i) => BottomNavigationBarItem(
                icon: _pageIcons[i],
                title: _buildTabText(i),
                activeIcon: _pageActionIcons[i])),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) => _pageController.jumpToPage(index),
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChange,
        children: _pageList,
        physics: NeverScrollableScrollPhysics(),//禁止滑动
      ),
    );
  }

  Widget _buildTabText(int index) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0),
      child: Text(_pageTitles[index]),
    );
  }

  void _onPageChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Image _buildTabIcon(int index) {
    if (index == _currentIndex) {
      return _pageIcons[index][1];
    }
    return _pageIcons[index][0];
  }
}

import 'package:bhubweatherapp/core/constants/export_files.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LandingPage extends StatefulWidget {
  dynamic currentTab;
  late RouteArgument routeArgument;
  Widget currentPage = WeatherView();
  LandingPage({
    this.currentTab,
  }) {
    if (currentTab != null) {
      if (currentTab is RouteArgument) {
        routeArgument = currentTab;
        currentTab = int.parse(currentTab.id);
      }
    } else {
      currentTab = 0;
    }
  }
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.currentPage,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.green,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 22,
        elevation: 8,
        backgroundColor: Colors.lightGreen,
        selectedIconTheme: IconThemeData(size: 28),
        unselectedLabelStyle: TextStyle(
          fontFamily: Str.APP_FONT,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
        ),
        selectedLabelStyle: TextStyle(
          fontFamily: Str.APP_FONT,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
        ),
        currentIndex: widget.currentTab,
        onTap: (int i) {
          this._selectTab(i);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wb_sunny,
              size: 30.0,
            ),
            label: 'Weather',
            
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.explore,
              size: 30.0,
            ),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.bookmark_add,
              size: 30.0,
            ),
            label: 'Saved',
          ),
        ],
      ),
    );
  }

  initState() {
    super.initState();
    _selectTab(widget.currentTab);
  }

  @override
  void didUpdateWidget(LandingPage oldWidget) {
    _selectTab(oldWidget.currentTab);
    super.didUpdateWidget(oldWidget);
  }

  void _selectTab(int tabItem) {
    setState(() {
      widget.currentTab = tabItem;
      switch (tabItem) {
        case 0:
          widget.currentPage = WeatherView();
          break;
        case 1:
          widget.currentPage = ExploreView();
          break;
        case 2:
          widget.currentPage = SavedPage();
          break;
      }
    });
  }

  
}

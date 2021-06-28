import 'package:flutter/material.dart';
import 'package:weatherapp/views/tabs/alert_tab.dart';
import 'package:weatherapp/views/tabs/weekly_tab.dart';
import 'package:weatherapp/views/tabs/home_tab.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    void _onNavTap(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    List<Widget> _tabs = [
      HomeTab(),
      WeeklyWeather(),
      AlertTab(),
    ];

    return Scaffold(
      body: _tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).accentColor == Colors.white
            ? Colors.white
            : Colors.grey[200],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_view_day),
            label: 'Weekly',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_important),
            label: 'Alerts',
          )
        ],
        onTap: _onNavTap,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.black,
        showUnselectedLabels: false,
      ),
    );
  }
}

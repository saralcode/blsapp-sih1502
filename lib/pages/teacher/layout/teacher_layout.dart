import 'package:bls/pages/teacher/pages/home/teacher_home_page.dart';
import 'package:bls/pages/teacher/pages/notification/teacher_notification_page.dart';
import 'package:bls/pages/teacher/pages/analytics/teacher_analytics_page.dart';
import 'package:bls/pages/teacher/pages/profile/teacher_profile_page.dart';
import 'package:bls/pages/teacher/pages/search/teacher_search_page.dart';
import 'package:flutter/material.dart';

class TeacherLayout extends StatefulWidget {
  const TeacherLayout({super.key});

  @override
  TeacherLayoutState createState() => TeacherLayoutState();
}

class TeacherLayoutState extends State<TeacherLayout> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    TeacherHomePage(),
    TeacherSearchPage(),
    TeacherAnalyticsPage(),
    TeacherNotificationPage(),
    TeacherProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.indigo,
        currentIndex: _currentIndex,
        iconSize: 28,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_graph),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

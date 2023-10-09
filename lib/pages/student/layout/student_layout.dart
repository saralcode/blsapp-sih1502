import 'package:bls/pages/student/pages/home/student_home_page.dart';
import 'package:bls/pages/student/pages/notification/student_notification_page.dart';
import 'package:bls/pages/student/pages/shorts/student_shorts_page.dart';
import 'package:bls/pages/student/pages/profile/student_profile_page.dart';
import 'package:bls/pages/student/pages/search/student_search_page.dart';
import 'package:flutter/material.dart';

class StudentLayout extends StatefulWidget {
  const StudentLayout({super.key});

  @override
  StudentLayoutState createState() => StudentLayoutState();
}

class StudentLayoutState extends State<StudentLayout> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    StudentHomePage(),
    StudentSearchPage(),
    StudentShortsPage(),
    StudentNotificationPage(),
    StudentProfilePage()
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
            icon: Icon(Icons.movie_filter),
            label: 'Shorts',
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

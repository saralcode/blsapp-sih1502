import 'package:bls/pages/organization/pages/home/organization_home_page.dart';
import 'package:bls/pages/organization/pages/notification/organization_notification_page.dart';
import 'package:bls/pages/organization/pages/profile/organization_profile_page.dart';
import 'package:bls/pages/organization/pages/search/organization_search_page.dart';
import 'package:bls/pages/organization/pages/study/organization_study_page.dart';
import 'package:flutter/material.dart';

class OrganizationLayout extends StatefulWidget {
  const OrganizationLayout({super.key});

  @override
  OrganizationLayoutState createState() => OrganizationLayoutState();
}

class OrganizationLayoutState extends State<OrganizationLayout> {
  int _currentIndex = 0;
  final List<Widget> _pages = const [
    OrganizationHomePage(),
    OrganizationSearchPage(),
    OrganizationStudyPage(),
    OrganizationNotificationPage(),
    OrganizationProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.blueGrey.shade800,
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
            icon: Icon(Icons.local_library),
            label: 'Study',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'User',
          ),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Screen"),
    );
  }
}

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Search Screen"),
    );
  }
}

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("User Profile Screen"),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Settings Screen"),
    );
  }
}

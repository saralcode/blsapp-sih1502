import 'package:flutter/material.dart';

class OrganizationProfilePage extends StatefulWidget {
  const OrganizationProfilePage({super.key});

  @override
  State<OrganizationProfilePage> createState() =>
      _OrganizationProfilePageState();
}

class _OrganizationProfilePageState extends State<OrganizationProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Text("Profile page"),
    );
  }
}

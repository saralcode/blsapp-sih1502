import 'package:flutter/material.dart';

class OrganizationNotificationPage extends StatefulWidget {
  const OrganizationNotificationPage({super.key});

  @override
  State<OrganizationNotificationPage> createState() =>
      _OrganizationNotificationPageState();
}

class _OrganizationNotificationPageState
    extends State<OrganizationNotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
      ),
      body: Text("Notification page"),
    );
  }
}

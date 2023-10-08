import 'package:flutter/material.dart';

class OrganizationAnalyticsPage extends StatefulWidget {
  const OrganizationAnalyticsPage({super.key});

  @override
  State<OrganizationAnalyticsPage> createState() =>
      _OrganizationAnalyticsPageState();
}

class _OrganizationAnalyticsPageState extends State<OrganizationAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: const Text("Analytics page"),
    );
  }
}

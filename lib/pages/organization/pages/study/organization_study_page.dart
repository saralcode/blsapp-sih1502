import 'package:flutter/material.dart';

class OrganizationStudyPage extends StatefulWidget {
  const OrganizationStudyPage({super.key});

  @override
  State<OrganizationStudyPage> createState() => _OrganizationStudyPageState();
}

class _OrganizationStudyPageState extends State<OrganizationStudyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Study"),
      ),
      body: Text("Study page"),
    );
  }
}

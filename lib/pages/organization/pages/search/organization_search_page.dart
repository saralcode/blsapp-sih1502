import 'package:flutter/material.dart';

class OrganizationSearchPage extends StatefulWidget {
  const OrganizationSearchPage({super.key});

  @override
  State<OrganizationSearchPage> createState() => _OrganizationSearchPageState();
}

class _OrganizationSearchPageState extends State<OrganizationSearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Text("Search page"),
    );
  }
}

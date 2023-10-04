import 'package:bls/pages/auth/login_page.dart';
import 'package:bls/pages/organization/layout/organization_bottom_navigation.dart';
import 'package:bls/pages/reels/reels_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blended Learning System"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          FloatingActionButton.extended(
              onPressed: () {
                Get.to(() => const ReelsPage());
              },
              label: const Text("Show Reels")),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
              heroTag: "login",
              onPressed: () {
                Get.to(() => const LoginPage());
              },
              label: const Text("Login")),
          const SizedBox(
            height: 20,
          ),
          FloatingActionButton.extended(
              heroTag: "Organization",
              onPressed: () {
                Get.offAll(() => const OrganizationLayout());
              },
              label: const Text("Organization")),
        ],
      ),
    );
  }
}

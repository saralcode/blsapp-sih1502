import 'package:bls/pages/organization/pages/analytics/org_analytics_data.dart';
import 'package:flutter/material.dart';

class TeacherAnalyticsPage extends StatefulWidget {
  const TeacherAnalyticsPage({super.key});

  @override
  State<TeacherAnalyticsPage> createState() => _TeacherAnalyticsPageState();
}

class _TeacherAnalyticsPageState extends State<TeacherAnalyticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Analytics"),
      ),
      body: ListView(
        children: [
          GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: orgStudents.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 4 / 3),
              itemBuilder: (context, index) {
                AnalyticsCount analyticsCount = orgStudents.elementAt(index);
                return showAnalyticsCount(analyticsCount);
              })
        ],
      ),
    );
  }
}

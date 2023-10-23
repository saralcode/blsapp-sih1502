import 'package:bls/pages/organization/pages/analytics/org_analytics_data.dart';
import 'package:flutter/material.dart';

class OrgStudentAnalytics extends StatefulWidget {
  const OrgStudentAnalytics({super.key});

  @override
  State<OrgStudentAnalytics> createState() => _OrgStudentAnalyticsState();
}

class _OrgStudentAnalyticsState extends State<OrgStudentAnalytics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Analytics"),
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

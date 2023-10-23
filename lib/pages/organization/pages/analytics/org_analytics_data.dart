import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:flutter/material.dart';

class AnalyticsCount {
  String text;
  String total;
  AnalyticsCount({required this.text, required this.total});
}

List<AnalyticsCount> orgAnalyticsCount = [
  AnalyticsCount(text: "Classes", total: "5"),
  AnalyticsCount(text: "Teachers", total: "25"),
  AnalyticsCount(text: "Students", total: "300"),
  AnalyticsCount(text: "Subjects", total: "30"),
  AnalyticsCount(text: "Topics", total: "450"),
];

List<AnalyticsCount> orgStudents = [
  AnalyticsCount(text: "Practice Set Completed", total: "20/50"),
  AnalyticsCount(text: "Shorts Watched", total: "25/500"),
  AnalyticsCount(text: "Assignment Submitted", total: "9/10"),
  AnalyticsCount(text: "Doubt Asked", total: "25"),
  AnalyticsCount(text: "Topics Completed", total: "201/550"),
  AnalyticsCount(text: "Chapters Completed", total: "4/10"),
];

Widget showAnalyticsCount(AnalyticsCount data) {
  return InkWell(
    onTap: () {},
    child: Card(
      color: generateRandomColor(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            data.total,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
    ),
  );
}

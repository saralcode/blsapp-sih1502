import 'package:bls/pages/organization/pages/home/courses_or_classes/courses_or_classes_page.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentNotificationPage extends StatefulWidget {
  const StudentNotificationPage({super.key});

  @override
  State<StudentNotificationPage> createState() =>
      _StudentNotificationPageState();
}

class Notification {
  int id;
  String title;
  String description;
  String link;
  DateTime date;

  Notification(this.id, this.title, this.description, this.link, this.date);
}

class _StudentNotificationPageState extends State<StudentNotificationPage> {
  final List<Notification> notifications = List.generate(20, (index) {
    return Notification(
      index + 1,
      "Notification ${index + 1}",
      "Description for Notification ${index + 1}",
      "/notifications/$index",
      DateTime.now(),
    );
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  reverse: true,
                  itemCount: notifications.length,
                  itemBuilder: (context, index) {
                    Notification notification = notifications[index];
                    return Card(
                      child: ExpansionTile(
                        tilePadding: EdgeInsets.zero,
                        title: ListTile(
                          onTap: () {},
                          leading: Container(
                            decoration: BoxDecoration(
                                color: generateRandomColor(),
                                borderRadius: BorderRadius.circular(20)),
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: Text(
                              "${notification.id}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textScaleFactor: 1.2,
                            ),
                          ),
                          title: Text(notification.title),
                          subtitle: Text(DateFormat("EEEE, d MMMM y, hh:mm a")
                              .format(notification.date)),
                        ),
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(notification.description),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

import 'package:flutter/material.dart';

import '../../widget/my_appBar.dart';

class ReportsScreen extends StatelessWidget {
  final int totalTeachers = 50;
  final int totalStudents = 200;
  final int totalCourses = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            MyAppBar(
              backArrow: true,
              title: "Notifications",
              name: "",
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DashboardCard(
                    title: 'Teachers',
                    count: totalTeachers,
                    icon: Icons.school,
                  ),
                  DashboardCard(
                    title: 'Students',
                    count: totalStudents,
                    icon: Icons.person,
                  ),
                  DashboardCard(
                    title: 'Courses',
                    count: totalCourses,
                    icon: Icons.book,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final int count;
  final IconData icon;

  const DashboardCard({
    required this.title,
    required this.count,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Container(
        width: 200,
        height: 150,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              size: 40,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 20),
            ),
            Text(
              count.toString(),
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

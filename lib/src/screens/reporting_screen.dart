import 'package:flutter/material.dart';
import 'package:muzuli_app/widgets/report_table.dart';

class ReportingScreen extends StatelessWidget {
  const ReportingScreen({super.key});

  static const sample = [
    {'name': 'Amina Hassan', 'location': 'Nairobi', 'email': 'amina@example.com', 'problem': 'Discrimination at workplace', 'date': '2024-04-15', 'resolved': 'Yes'},
    {'name': 'Mohamed Ali', 'location': 'Dadaab', 'email': 'mohamed@example.com', 'problem': 'Family assault', 'date': '2024-04-10', 'resolved': 'No'},
    {'name': 'Sarah Odhiambo', 'location': 'Kisumu', 'email': 'sarah@example.com', 'problem': 'Denied healthcare access', 'date': '2024-04-12', 'resolved': 'Yes'},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Public Reporting', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          ReportTable(entries: sample),
          SizedBox(height: 12),
          Text('You can submit a public report (visible to others) or a private report (only to administrators).'),
        ],
      ),
    );
  }
}

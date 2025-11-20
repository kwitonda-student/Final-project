import 'package:flutter/material.dart';

class ReportTable extends StatelessWidget {
  final List<Map<String, String>> entries;

  ReportTable({required this.entries});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(columns: [
        DataColumn(label: Text('Name')),
        DataColumn(label: Text('Location')),
        DataColumn(label: Text('Email')),
        DataColumn(label: Text('Problem')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Resolved')),
      ], rows: entries.map((e) {
        return DataRow(cells: [
          DataCell(Text(e['name'] ?? '')),
          DataCell(Text(e['location'] ?? '')),
          DataCell(Text(e['email'] ?? '')),
          DataCell(Text(e['problem'] ?? '')),
          DataCell(Text(e['date'] ?? '')),
          DataCell(Text(e['resolved'] ?? '')),
        ]);
      }).toList()),
    );
  }
}

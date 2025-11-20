import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white70,
      padding: EdgeInsets.symmetric(vertical: 12),
      alignment: Alignment.center,
      child: Text('Muzuli app @2015', style: TextStyle(fontSize: 14, color: Colors.black54)),
    );
  }
}

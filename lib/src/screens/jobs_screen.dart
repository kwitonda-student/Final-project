import 'package:flutter/material.dart';

class JobsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding: EdgeInsets.all(16),
      child: Text('Jobs listed here. Example job shown on Home tab is also accessible.', textAlign: TextAlign.center),
    ));
  }
}

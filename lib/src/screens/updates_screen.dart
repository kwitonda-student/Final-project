import 'package:flutter/material.dart';

class UpdatesScreen extends StatelessWidget {
  const UpdatesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('Updates'),
              subtitle: Text('The deadline for new registrations of Ariens is 13/09/2020 for more information contact 072344...'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mission = '''
Mission:
To empower vulnerable communities in Kenya by providing accessible, accurate, and multilingual legal information, fostering dignity, safety, and justice for all.
''';
    final values = '''
Values:
We believe every individual deserves to understand their rights and access justice without fear or barriers.
We are committed to safeguarding privacy and promoting anonymous reporting to protect the most vulnerable.
Inclusivity drives our efforts—serving refugees, migrants, and marginalized Kenyans with compassion and respect.
Transparency and accuracy guide our content, ensuring trust and reliability in every interaction.
Ultimately, we aspire to build a more equitable, informed, and resilient Kenya where no voice goes unheard.
''';

    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Mission and Values', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 12),
          Text(mission),
          SizedBox(height: 8),
          Text(values),
        ],
      ),
    );
  }
}

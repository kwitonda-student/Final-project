import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import '../widgets/header.dart';
import '../widgets/footer.dart';
import 'jobs_screen.dart';
import 'updates_screen.dart';
import 'about_screen.dart';
import 'help_screen.dart';
import 'reporting_screen.dart';
import 'private_report_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  final UserProfile profile;
  HomeScreen({required this.profile});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _idx = 0;
  final pages = <Widget>[];

  @override
  void initState() {
    super.initState();
  }

  void _onSearch() {
    showDialog(context: context, builder: (_) {
      final ctl = TextEditingController();
      return AlertDialog(
        title: Text('Search in Muzuli'),
        content: TextField(controller: ctl, decoration: InputDecoration(hintText: 'Search...')),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('Close'))],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageWidgets = [
      _homeTab(),
      JobsScreen(),
      UpdatesScreen(),
      AboutScreen(),
      HelpScreen(),
      ReportingScreen(),
      PrivateReportScreen(),
    ];

    return Scaffold(
      appBar: AppHeader(onSearch: _onSearch),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://images.pexels.com/photos/6932294/pexels-photo-6932294.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.85), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: [
            Expanded(child: pageWidgets[_idx]),
            AppFooter(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _idx,
        type: BottomNavigationBarType.fixed,
        onTap: (i) {
          setState(() => _idx = i);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Help'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () async {
          final url = Uri.parse('https://deepai.org/chat');
          if (await canLaunchUrl(url)) launchUrl(url);
        },
      ),
    );
  }

  Widget _homeTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Card(
            child: ListTile(
              title: Text('Official Post', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Posts only for officials'),
            ),
          ),
          SizedBox(height: 12),
          Card(
            child: ListTile(
              title: Text('Position: advertiser and anonymous company'),
              subtitle: Text('Our client, an on-demand Courier Service that delivers products ordered through their mobile app seeks to recruit a MFC Picker  Location: Nairobi. Send CV to hsjia@gmail.com'),
            ),
          ),
        ],
      ),
    );
  }
}

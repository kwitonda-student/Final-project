import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearch;
  final Widget? trailing;

  AppHeader({required this.onSearch, this.trailing});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black54),
            onPressed: onSearch,
          ),
          Expanded(child: Container()),
          GestureDetector(
            onTap: () async {
              // Keep minimal: open UNHCR link in new tab
              final url = Uri.parse('https://www.unhcr.org/careers-unhcr');
              if (await canLaunchUrl(url)) launchUrl(url);
            },
            child: Text('Muzuli app', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold, fontSize: 20)),
          ),
          SizedBox(width: 16),
        ],
      ),
    );
  }
}

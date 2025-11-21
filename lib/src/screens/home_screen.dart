import 'package:flutter/material.dart';
import '../models/user_profile.dart';
import 'package:muzuli_app/widgets/header.dart';
import 'package:muzuli_app/widgets/footer.dart';
import 'updates_screen.dart';
import 'about_screen.dart';
import 'reporting_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  final UserProfile profile;
  const HomeScreen({super.key, required this.profile});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _idx = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onSearch() {
    showDialog(context: context, builder: (_) {
      final ctl = TextEditingController();
      return AlertDialog(
        title: const Text('Search in Career'),
        content: TextField(controller: ctl, decoration: const InputDecoration(hintText: 'Search...')),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Close'))],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageWidgets = [
      _homeTab(),
       AboutScreen(),
       ReportingScreen(),
       UpdatesScreen(),
    ];

    return Scaffold(
      appBar: AppHeader(onSearch: _onSearch, onReporting: () => setState(() => _idx = 2)),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.background,
              Theme.of(context).colorScheme.background.withOpacity(0.95),
            ],
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
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        backgroundColor: Theme.of(context).colorScheme.surface,
        elevation: 8,
        onTap: (i) {
          setState(() => _idx = i);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
          BottomNavigationBarItem(icon: Icon(Icons.report), label: 'Reports'),
          BottomNavigationBarItem(icon: Icon(Icons.update), label: 'Updates'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.chat),
        onPressed: () async {
          final url = Uri.parse('https://chat.muzuliapp.com/');
          if (await canLaunchUrl(url)) launchUrl(url);
        },
      ),
    );
  }

  Widget _homeTab() {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Hero Section
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.primary,
                  Theme.of(context).colorScheme.secondary,
                ],
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome to Muzuliapp',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Know your rights, claim your rights.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.white.withOpacity(0.9),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          // Featured Content
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rights that you can claim',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.business,
                            color: Theme.of(context).colorScheme.primary,
                            size: 32,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rights and fundamental freedoms',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Everyone is entitled to all the rights and freedoms set forth in this Declaration, without distinction of any kind. This includes rights such as the right to life, liberty, and security of person. ', 
                                
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: IconButton(
                            onPressed: () {
                              // Navigate to messages screen
                            },
                            icon: Icon(
                              Icons.chat,
                              color: Theme.of(context).colorScheme.secondary,
                              size: 32,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Equality and freedom from discrimination',
                                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                ' Every person is equal before the law and has the right to equal protection and equal benefit of the law',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

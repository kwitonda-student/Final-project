import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AppHeader extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onSearch;
  final VoidCallback? onReporting;
  final Widget? trailing;

  const AppHeader({super.key, required this.onSearch, this.onReporting, this.trailing});

  @override
  Size get preferredSize => Size.fromHeight(70);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.1),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(Icons.business_center, color: Theme.of(context).colorScheme.primary, size: 24),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () async {
                // Open kenyalaw link
                final url = Uri.parse('https://new.kenyalaw.org/akn/ke/act/2010/constitution/eng@2010-09-03');
                if (await canLaunchUrl(url)) launchUrl(url);
              },
              child: Text(
                'Constitution of Kenya link',
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
          onPressed: onSearch,
          tooltip: 'Search',
        ),
        if (onReporting != null)
          IconButton(
            icon: Icon(Icons.report, color: Theme.of(context).colorScheme.primary),
            onPressed: onReporting,
            tooltip: 'Report',
          ),
      ],
    );
  }
}

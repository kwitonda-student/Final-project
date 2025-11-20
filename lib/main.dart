import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'src/screens/login_screen.dart';
import 'package:provider/provider.dart';
import 'widgets/theme_switcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  runApp(MuzuliApp());
}

class MuzuliApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(builder: (context, theme, _) {
        return MaterialApp(
          title: 'Muzuli app',
          theme: theme.isLight ? ThemeData.light() : ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
            scaffoldBackgroundColor: Colors.grey[100],
          ),
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

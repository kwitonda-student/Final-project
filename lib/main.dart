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
  const MuzuliApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Consumer<ThemeNotifier>(builder: (context, theme, _) {
        return MaterialApp(
          title: 'Career',
          theme: theme.isLight ? ThemeData(
            primaryColor: const Color(0xFF1E3A8A), // Deep blue
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1E3A8A),
              secondary: Color(0xFF3B82F6),
              surface: Colors.white,
              onPrimary: Colors.white,
              onSecondary: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFFF8FAFC),
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: IconThemeData(color: Color(0xFF1E3A8A)),
              titleTextStyle: TextStyle(color: Color(0xFF1E3A8A), fontSize: 20, fontWeight: FontWeight.bold),
            ),
            cardTheme: const CardThemeData(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              shadowColor: Color(0x1F000000),
            ),
            textTheme: const TextTheme(
              headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF1E3A8A)),
              titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Color(0xFF374151)),
              bodyLarge: TextStyle(fontSize: 16, color: Color(0xFF6B7280)),
            ),
          ) : ThemeData(
            colorScheme: const ColorScheme.dark(
              primary: Color(0xFF3B82F6),
              secondary: Color(0xFF60A5FA),
              surface: Color(0xFF1F2937),
              onPrimary: Colors.white,
              onSecondary: Colors.white,
              onSurface: Colors.white,
            ),
            scaffoldBackgroundColor: const Color(0xFF111827),
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xFF1F2937),
              elevation: 0,
            ),
            cardTheme: const CardThemeData(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              shadowColor: Color(0x4D000000),
            ),
          ),
          home: LoginScreen(),
          debugShowCheckedModeBanner: false,
        );
      }),
    );
  }
}

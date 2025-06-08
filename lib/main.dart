import 'package:alpha_twelve_app/screens/tabs/tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

// choosing a color scheme for light mode
var kColorScheme = ColorScheme.fromSeed(
  seedColor: Colors.white,
  surface: Colors.white,
  onSurface: Colors.black,
  primary: const Color.fromRGBO(96, 181, 255, 1),
  onPrimary: Colors.white,
  primaryContainer: const Color.fromRGBO(246, 245, 248, 1),
  onPrimaryContainer: const Color.fromRGBO(51, 65, 85, 1),
);

// choosing a color scheme for dark mode
var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Colors.black,
  surface: const Color.fromRGBO(51, 65, 85, 1),
  onSurface: Colors.white,
  primary: const Color.fromRGBO(96, 181, 255, 1),
  onPrimary: Colors.white,
  primaryContainer: const Color.fromRGBO(35, 35, 35, 1),
  onPrimaryContainer: Colors.white,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((fn) {});

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alpha Twelve App',
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        textTheme: GoogleFonts.ibmPlexSansTextTheme(ThemeData.dark().textTheme),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        textTheme: GoogleFonts.ibmPlexSansTextTheme(
          ThemeData.light().textTheme,
        ),
      ),
      themeMode: ThemeMode.light,
      home: const TabsScreen(),
    );
  }
}

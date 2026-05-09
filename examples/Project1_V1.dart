import "package:flutter/material.dart";
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import "theme/app_theme.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeStyle = ThemeMode.light;
  Locale _locale = const Locale('en');

  void onThemePressed() {
    setState(() {
      _themeStyle = _themeStyle == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  void onLanguagePressed() {
    setState(() {
      _locale = _locale.languageCode == 'en'
          ? const Locale('fa')
          : const Locale('en');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeStyle,
      locale: _locale,
      title: "MyApp",
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('fa'), // Farsi
      ],
      home: MyAppHome(
        onThemePressed: onThemePressed,
        onLanguagePressed: onLanguagePressed,
        locale: _locale,
      ),
    );
  }
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({
    super.key,
    required this.onThemePressed,
    required this.onLanguagePressed,
    required this.locale,
  });

  final VoidCallback onThemePressed;
  final VoidCallback onLanguagePressed;
  final Locale locale;

  @override
  State<MyAppHome> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.helloWorld),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Icon(Icons.chat_bubble_outline),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: Switch(
              value: isDark,
              onChanged: (bool newValue) {
                widget.onThemePressed();
              },
            ),
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: widget.onLanguagePressed,
          child: Text(
            widget.locale.languageCode == 'en'
                ? 'Switch to Persian'
                : 'Switch to English',
          ),
        ),
      ),
    );
  }
}
r

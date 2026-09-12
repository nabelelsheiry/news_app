import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news/core/provider/app_provider.dart';
import 'package:news/core/theme/app_theme.dart';
import 'package:news/data/repository/data_sources/local_data_sources/local_data_sources.dart';
import 'package:news/features/screens/home/home_screen.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  Hive.initFlutter();
  Hive.registerAdapter( SourceDmAdapter());
  runApp(ChangeNotifierProvider(
    create: (context) => AppProvider(),
    child: const MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();

    return MaterialApp(
      key: ValueKey(provider.appTheme),

      themeMode: provider.appTheme == "Dark"
          ? ThemeMode.dark
          : ThemeMode.light,

      theme: AppTheme.theme,
      darkTheme: AppTheme.darkTheme,

      locale: Locale(provider.appLocal),

      debugShowCheckedModeBanner: false,

      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],

      home: const HomeScreen(),
    );
  }
}
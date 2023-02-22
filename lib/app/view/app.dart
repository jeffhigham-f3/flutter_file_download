import 'package:flutter/material.dart';
import 'package:flutter_download_demo/download/download.dart';
import 'package:flutter_download_demo/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.amber.shade600,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: Colors.amber.shade800,
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const DownloadPage(),
    );
  }
}

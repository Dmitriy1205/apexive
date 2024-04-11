import 'package:apexive/core/providers.dart';
import 'package:apexive/core/theme/themes.dart';
import 'package:apexive/presentation/screens/timesheets.dart';
import 'package:apexive/presentation/widgets/background.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Providers(
      child: MaterialApp(
        theme: AppTheme.defaultTheme,
        debugShowCheckedModeBanner: false,
        home: const Background(
          child: TimersheetsScreen(),
        ),
      ),
    );
  }
}

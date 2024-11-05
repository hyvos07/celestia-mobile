import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/themes/_themes.dart';
import 'features/main/presentation/pages/_pages.dart';
import 'services/navigations/_navigations.dart';

final nav = NavigationService();

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Celestia',
      theme: AppTheme.lightTheme(),
      debugShowCheckedModeBanner: false,
      navigatorKey: nav.navigatorKey,
      home: Scaffold(
        body: MyHomePage(),
      ),
    );
  }
}

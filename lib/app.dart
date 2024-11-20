import 'package:celestia_mobile/features/auth/presentation/pages/_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

import 'core/themes/_themes.dart';
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

    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Celestia',
        theme: AppTheme.lightTheme(),
        debugShowCheckedModeBanner: false,
        navigatorKey: nav.navigatorKey,
        home: const Scaffold(
          body: LoginPage(),
        ),
      ),
    );
  }
}

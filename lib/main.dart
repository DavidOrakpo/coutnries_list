import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:coutnries_list/core/stateManagement/countries_state.dart';
import 'package:coutnries_list/presentation/views/Home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

import 'core/services/connectivity/connectivity.dart';
import 'core/stateManagement/dark_theme_provider.dart';
import 'core/themes/styles.dart';
import 'core/utility/routes/routes_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();
  bool isBackground = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    themeChangeProvider.darkTheme = isDarkMode;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    isBackground = state == AppLifecycleState.resumed;
    if (isBackground) {
      getCurrentAppTheme();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => themeChangeProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => CountriesState(),
        ),
      ],
      builder: (context, child) {
        return MaterialApp(
          title: 'Countries List',
          debugShowCheckedModeBanner: false,
          initialRoute: "/",
          onGenerateRoute: RouteGenerator.GenerateRoute,
          theme: Styles.themeData(
              context.watch<DarkThemeProvider>().darkTheme, context),
          home: HomePage(),
        );
      },
    );
  }
}

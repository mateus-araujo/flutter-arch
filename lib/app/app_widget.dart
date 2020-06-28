import 'package:arch/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Modular.get<AppController>().themeSwitch,
        builder: (context, isDark, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                brightness: isDark ? Brightness.dark : Brightness.light),
            initialRoute: '/',
            onGenerateRoute: Modular.generateRoute,
            navigatorKey: Modular.navigatorKey,
          );
        });
  }
}

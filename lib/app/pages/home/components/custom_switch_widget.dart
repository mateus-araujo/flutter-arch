import 'package:arch/app/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomSwitchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: Modular.get<AppController>().themeSwitch,
        builder: (context, isDark, child) {
          return Switch(
            value: isDark,
            onChanged:
                Modular.get<AppController>().changeThemeViewModel.changeTheme,
          );
        });
  }
}

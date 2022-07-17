import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xypnos_training/provider/theme_provider.dart';
import 'package:xypnos_training/constants.dart';

class ChangeThemeButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Switch.adaptive(
      activeColor: kPrimaryColor,
      inactiveTrackColor: Colors.grey,
      value: themeProvider.isDarkMode,
      onChanged: (value) {
        final provider = Provider.of<ThemeProvider>(context, listen: false);
        provider.toggleTheme(value);
      },
    );
  }
}

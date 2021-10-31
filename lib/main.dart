import 'package:clean_arch_with_flutter/app_module_di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'custom_theme.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return ModularApp(
      module: AppModuleDI(),
      child: MaterialApp(
        theme: customTheme,
        initialRoute: '/',
      ).modular()
    );
  }
}
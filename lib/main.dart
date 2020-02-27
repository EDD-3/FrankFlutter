import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/features/gates/presentation/pages/gates_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await di.init().then((_) => SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) => runApp(MyApp())));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noticias',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: GatesPage(),
    );
  }
}
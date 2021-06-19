import 'package:flutter/material.dart';
import 'package:puby/pages/root_pages/app.dart';
import 'puby_page.dart';

void main() {
  Global.init(() {
    runApp(MyApp());
  });
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {'/': (_) => App()},
      debugShowCheckedModeBanner: false,
    );
  }
}

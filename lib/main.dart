import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/pages/details_page.dart';
import 'package:rick_and_morty_flutter/pages/home_page.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case HomePage.routeId:
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => const HomePage(),
            );
          case DetailsPage.routeId:
            int characterId = settings.arguments as int;
            return MaterialPageRoute(
              settings: settings,
              builder: (context) => DetailsPage(characterId: characterId),
            );
          default:
            return null;
        }
      },
    );
  }
}

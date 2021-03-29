import 'package:flutter/material.dart';

import 'screens/FutureBuilderScreen.dart';
import 'screens/TextStyleScreen.dart';
import 'screens/FloatingActionButtonScreen.dart';

void main() {
  runApp(MyApp());
}

class Screen {
  final String title;
  final Widget widget;
  final String route;

  Screen(this.title, this.widget, this.route);
}

class Screens {
  final List<Screen> list = [
    Screen("TextStyleScreen", TextStyleScreen(), "/textStyleScreen"),
    Screen("FloatingActionButtonScreen", FloatingActionButtonScreen(), "/floatingActionButtonScreen"),
    Screen("FutureBuilderScreen", FutureBuilderScreen(), "/futureBuilderScreen")
  ];

  // final int length = list.length;

  Map<String, WidgetBuilder> getRoutes(BuildContext context) {
    Map<String, WidgetBuilder> routes = {};
    list.forEach((element) {
      routes[element.route] = (context) => element.widget;
    });
    return routes;
  }
}

class MyApp extends StatelessWidget {
  Screens _screens = Screens();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: _screens.getRoutes(context),
      home: MyHomePage(title: 'Flutter Demo Home Page', screens: _screens),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title, this.screens}) : super(key: key);

  final String title;
  final Screens screens;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(
            child: ListView.separated(
          itemCount: screens.list.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text("${screens.list[index].title}"),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    screens.list[index].route,
                  );
                },
              ),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
        )));
  }
}

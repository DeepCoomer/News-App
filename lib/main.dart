import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mynewsapp/Screens/business_news.dart';
import 'package:mynewsapp/Screens/covid_news.dart';
import 'package:mynewsapp/Screens/home_page.dart';
import 'package:mynewsapp/Screens/india_news.dart';
import 'package:mynewsapp/Screens/science_news.dart';
import 'package:mynewsapp/Screens/setting_page.dart';
import 'package:mynewsapp/Utils/config.dart';
import 'package:mynewsapp/Utils/routes.dart';

import 'Utils/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      print('Changes');
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 3)),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Splash(),
            themeMode: currentTheme.currentTheme(),
            darkTheme: MyTheme.darkTheme(context),
            theme: MyTheme.lightTheme(context),
          );
        } else {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'News App',
            home: HomePage(),
            themeMode: currentTheme.currentTheme(),
            darkTheme: MyTheme.darkTheme(context),
            theme: MyTheme.lightTheme(context),
            initialRoute: MyRoutes.homeroute,
            routes: {
              MyRoutes.homeroute: (contex) => HomePage(),
              MyRoutes.indiaroute: (context) => IndiaNews(),
              MyRoutes.scienceroute: (context) => ScienceNews(),
              MyRoutes.covidroute: (context) => CovidNews(),
              MyRoutes.businessroute: (context) => BusinessNews(),
              MyRoutes.settingroute: (context) => SettingPage()
            },
          );
        }
      },
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              CupertinoIcons.news_solid,
              size: 90,
            ),
          ),
          Text(
            'News App',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 140,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Made By Deep Coomer',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

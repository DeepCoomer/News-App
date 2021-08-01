import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mynewsapp/Models/news_model.dart';
import 'package:mynewsapp/Widgets/app_header.dart';
import 'package:mynewsapp/Widgets/covid_drawer.dart';
import 'package:mynewsapp/Widgets/news_data.dart';

class CovidNews extends StatefulWidget {

  @override
  _CovidNewsState createState() => _CovidNewsState();
}

class _CovidNewsState extends State<CovidNews> {
   String urlToImage = "";
  List<Articles> newslist = [];
  News newsFromJson(String str) => News.fromJson(json.decode(str));

  Future<List<Articles>?> fetchNews() async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=in&category=health&apiKey=d65ec3df76b0482bade20e7c2b295d08";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      News news = newsFromJson(response.body);
      return news.articles;
    } else {
      throw Exception('Failed to load Article');
    }
  }

  void getData() async {
    newslist = (await fetchNews())!;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'News App',
        ),
        textTheme: Theme.of(context).textTheme,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        child: Column(
          children: [
            AppHeader(),
            if (newslist.isNotEmpty)
              Expanded(child: Data(newslist))
            else
              Center(
                child: CircularProgressIndicator(),
              )
          ],
        ),
      ),
      drawer: CovidDrawer(),
    );
  }
}


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mynewsapp/Models/news_model.dart';
import 'package:mynewsapp/Widgets/app_header.dart';
import 'package:http/http.dart' as http;
import 'package:mynewsapp/Widgets/india_drawer.dart';
import 'package:mynewsapp/Widgets/news_data.dart';

class IndiaNews extends StatefulWidget {
  const IndiaNews({ Key? key }) : super(key: key);

  @override
  _IndiaNewsState createState() => _IndiaNewsState();
}

class _IndiaNewsState extends State<IndiaNews> {
 String urlToImage = "";
  List<Articles> newslist = [];
  News newsFromJson(String str) => News.fromJson(json.decode(str));

  Future<List<Articles>?> fetchNews() async {
    var url =
        "https://newsapi.org/v2/top-headlines?country=in&apiKey=d65ec3df76b0482bade20e7c2b295d08";

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
      drawer: IndiaDrawer(),
    );
  }
}


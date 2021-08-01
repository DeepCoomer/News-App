import 'package:flutter/material.dart';
import 'package:mynewsapp/Models/news_model.dart';
import 'package:mynewsapp/Screens/browser.dart';

class Data extends StatefulWidget {
  final List<Articles> newslist;

  Data(this.newslist);

  @override
  _DataState createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.newslist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Browser(
                              url: widget.newslist[index].url.toString()))),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(14.0),
                              child: widget.newslist[index].urlToImage == null
                                  ? Image.asset('assets/images/news.webp')
                                  : Image.network(widget
                                      .newslist[index].urlToImage
                                      .toString()),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                '${widget.newslist[index].title}',
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: widget.newslist[index].description == null
                                  ? Text('')
                                  : Text(
                                      '${widget.newslist[index].description}',
                                      style: TextStyle(fontSize: 18),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 12, bottom: 12, left: 15, right: 15),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      '${widget.newslist[index].source!.name}'),
                                  Text('${widget.newslist[index].publishedAt}')
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

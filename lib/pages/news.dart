import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_restapi/models/newsinfo.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  final int index;
  final int a;
  final Article article;
  const NewsPage(
      {Key? key, required this.a, required this.article, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: false,
      child: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: Colors.grey,
          ),
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Card(
                child: Hero(
                  tag: 'tag$index',
                  child: Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    height: 300,
                  ),
                ),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24)),
              ),
              Container(
                color: Colors.grey,
                height: 8,
              ),
              Card(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      color: Colors.white,
                    ),
                    Column(children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          article.title,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          article.description,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          article.content,
                          style: const TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.normal,
                              decoration: TextDecoration.none),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: InkWell(
                          child: const Text(
                            "Open In Browser",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 24,
                                fontWeight: FontWeight.normal,
                                decoration: TextDecoration.underline),
                            textAlign: TextAlign.center,
                          ),
                          onTap: () => launch(article.url),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ]),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news_app_restapi/models/newsinfo.dart';
import 'package:news_app_restapi/pages/news.dart';
import 'package:news_app_restapi/services/api_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsModel> _newsModel;
  @override
  void initState() {
    _newsModel = ApiManager.getNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("News App"),
      ),
      body: FutureBuilder<NewsModel>(
        future: _newsModel,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data!.articles[index];
                  return Container(
                    height: 100,
                    margin: const EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => (NewsPage(a: index,article: article,index: index,))));
                      },
                      child: Row(
                        children: [
                          Card(
                            child: AspectRatio(
                                aspectRatio: 1.5,
                                child: Hero(
                                  tag: 'tag$index',
                                  child: Image.network(
                                    article.urlToImage,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24)),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Flexible(
                            child: Column(
                              children: [
                                Text(
                                  article.title,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  article.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

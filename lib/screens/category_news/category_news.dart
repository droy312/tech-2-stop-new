import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:tech_two_stop/common_widgets/article_card.dart';
import 'package:tech_two_stop/helper/news_article_api.dart';
import 'package:tech_two_stop/helper/resources.dart';
import 'package:tech_two_stop/models/article_model.dart';
import 'package:tech_two_stop/screens/news/article_view.dart';

class CategoryNews extends StatefulWidget {
  CategoryNews({this.categoryId, this.categoryName});
  final int categoryId;
  final String categoryName;
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  Resources r = new Resources();
  bool _loading = true;
  List<ArticleModel> articles = new List<ArticleModel>();

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    CategoryNewsArticle news = CategoryNewsArticle();
    await news.getCategoryNews(widget.categoryId);
    articles = news.categoryNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: r.bgColor,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
        backgroundColor: r.bgColor,
        elevation: 0.0,
        title: Text(
          '${widget.categoryName}',
          style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontFamily: r.f4),
        ),
      ),
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 16.0),
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (context, index) => ArticleCard(
                          imageUrl: articles[index].imageUrl,
                          title: articles[index].title,
                          description: articles[index].description,
                          url: articles[index].url,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:tech_two_stop/common_widgets/article_card.dart';
import 'package:tech_two_stop/common_widgets/category_tile.dart';
import 'package:tech_two_stop/helper/category_data.dart';
import 'package:tech_two_stop/helper/news_article_api.dart';
import 'package:tech_two_stop/models/article_model.dart';
// import 'package:tech_2_stop_new/models/catagory_btn.dart';
// import 'package:tech_2_stop_new/models/news_articles.dart';
// import 'package:tech_2_stop_new/helper/resources.dart';
// import 'package:tech_2_stop_new/screens/news/news.dart';

import 'package:tech_two_stop/models/category_model.dart';
import 'package:tech_two_stop/helper/resources.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Resources r = new Resources();
  List<CategoryModel> categories = new List<CategoryModel>();
  bool _loading = true;

  List<ArticleModel> articles = new List<ArticleModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getArticles();
  }

  getArticles() async {
    NewsArticle news = NewsArticle();
    await news.getArticles();
    articles = news.articles;
    setState(() {
      _loading = false;
    });
  }

  // ------------- USING -------------------

  Widget topBar() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Builder(
            builder: (context) => IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.menu, color: r.black),
            ),
          ),
          r.customLogo,
          Icon(null),
        ],
      ),
    );
  }

  Widget listTile({String title, IconData icon}) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[800]),
      title: Text(title, style: r.style(Colors.grey[800], 16, r.f4)),
      onTap: () {},
    );
  }

  Widget drawerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(0, 5), blurRadius: 10),
            ],
            color: r.bgColor,
          ),
          height: 80,
          alignment: Alignment.center,
          child: r.customLogo,
        ),
        Expanded(
          child: ListView(
            children: <Widget>[
              listTile(icon: Icons.home, title: 'Home'),
              listTile(icon: Icons.people, title: 'About us'),
              listTile(icon: Icons.message, title: 'Contact Us'),
              listTile(icon: Icons.help, title: 'Solve your Tech queries'),
              listTile(icon: Icons.assessment, title: 'Product decider'),
              listTile(icon: Icons.security, title: 'Privacy policy'),
            ],
          ),
        ),
      ],
    );
  }

  Widget headerText(String text) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(text, style: r.style(r.black, 25, r.f4, isBold: true)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: r.bgColor,
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: r.bgColor,
        elevation: 0.0,
        automaticallyImplyLeading: false,
        title: topBar(),
      ),
      drawer: SafeArea(
        child: Drawer(child: drawerWidget()),
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            setState(() {
              _loading = true;
            });
            NewsArticle news = NewsArticle();
            await news.getArticles();
            articles = news.articles;
            setState(() {
              _loading = false;
            });
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10),
                Container(
                  height: 70.0,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        categoryId: categories[index].id,
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
                      );
                    },
                  ),
                ),
                headerText('Discover Latest Tech News'),
                _loading
                    ? Container(
                      height: MediaQuery.of(context).size.height - 300.0,
                      width: MediaQuery.of(context).size.width,
                        child: Center(child: CircularProgressIndicator()),
                      )
                    : Container(
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
      ),
    );
  }
}

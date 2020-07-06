import 'package:flutter/material.dart';
import 'package:tech_2_stop_new/models/catagory_btn.dart';
import 'package:tech_2_stop_new/models/news_articles.dart';
import 'package:tech_2_stop_new/helper/resources.dart';
import 'package:tech_2_stop_new/screens/home/home.dart';

class NewsPage extends StatefulWidget {
  final NewsArticles newsArticles;

  NewsPage({Key key, this.newsArticles}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Resources r = new Resources();

  List<CatagoryBtn> catagoryList = [
    CatagoryBtn(catagory: 'Home', widget: HomePage()),
    CatagoryBtn(catagory: 'Reviews', widget: null),
    CatagoryBtn(catagory: 'How To\'s', widget: null),
    CatagoryBtn(catagory: 'Tech and Trends', widget: null),
    CatagoryBtn(catagory: 'SmartPhones', widget: null),
    CatagoryBtn(catagory: 'Apps', widget: null),
    CatagoryBtn(catagory: 'Android', widget: null),
    CatagoryBtn(catagory: 'Mac', widget: null),
    CatagoryBtn(catagory: 'iOS', widget: null),
    CatagoryBtn(catagory: 'Accessories', widget: null),
    CatagoryBtn(catagory: 'Smart Devices', widget: null),
    CatagoryBtn(catagory: 'Home appliances', widget: null),
    CatagoryBtn(catagory: 'Tech Startups', widget: null),
    CatagoryBtn(catagory: 'Audio Gears', widget: null),
    CatagoryBtn(catagory: 'Tips and Tricks', widget: null),
    CatagoryBtn(catagory: 'Computer Peripherals', widget: null),
    CatagoryBtn(catagory: 'Product Decider', widget: null),
    CatagoryBtn(catagory: 'Solve Your Tech Queries', widget: null),
    CatagoryBtn(catagory: 'Laptops', widget: null),
    CatagoryBtn(catagory: 'Queation Hub', widget: null),
    CatagoryBtn(catagory: 'Cameras', widget: null),
    CatagoryBtn(catagory: 'Games', widget: null),
    CatagoryBtn(catagory: 'Contuct Us', widget: null),
    CatagoryBtn(catagory: 'About Us', widget: null),
    CatagoryBtn(catagory: 'Privacy Policy', widget: null),
    CatagoryBtn(catagory: 'Hindi', widget: null),
  ];

  Size ds = Size(0.0, 0.0);

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

  Widget listTile(BuildContext context, int index) {
    return FlatButton(
      onPressed: () {
        if (catagoryList[index].widget != null) {
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => catagoryList[index].widget),
          );
        } else {
          print('Error: widget is NULL');
        }
      },
      child: ListTile(
        title: Text(catagoryList[index].catagory,
            style: r.style(r.black, 18, r.f4)),
      ),
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
              listTile(context, 0),
              listTile(context, 23),
              listTile(context, 22),
              listTile(context, 17),
              listTile(context, 16),
              listTile(context, 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget headerText(String text) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Text(text, style: r.style(r.black, 32, r.f4, isBold: true)),
    );
  }

  Widget headerImage(String image) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 0, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        child: Image.asset(widget.newsArticles.image, fit: BoxFit.fitWidth),
      ),
    );
  }

  Widget authorWidget(String author) {
    return Container(
      margin: EdgeInsets.only(left: 20, bottom: 10),
      child: Text('By ' + author, style: r.style(Colors.grey, 14, r.f2)),
    );
  }

  Widget articleWidget(String article) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Text(article,
          style: r
              .style(Color.fromRGBO(40, 40, 40, 1), 18, r.f2)
              .copyWith(height: 1.8)),
    );
  }

  //!---------------------
  bool isPressed = false;

  Widget catagoryBtn(int index) {
    double leftMargin = index == 0 ? 20 : 0;
    double rightMargin = index == catagoryList.length - 1 ? 20 : 10;
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(left: leftMargin, right: rightMargin),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isPressed ? Colors.grey[600] : Colors.grey[100],
          border: Border.all(
              color: isPressed ? Colors.grey[600] : Colors.grey[300],
              width: .8),
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        alignment: Alignment.center,
        child: Text(catagoryList[index].catagory,
            style: r.style(isPressed ? r.bgColor : r.black, 12, r.f4)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    ds = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: r.bgColor,
      drawer: SafeArea(
        child: Drawer(child: drawerWidget()),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            topBar(),
            SizedBox(height: 10),
            Container(
              height: 30,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: catagoryList.length,
                itemBuilder: (context, index) => catagoryBtn(index),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  headerText(widget.newsArticles.title),
                  headerImage(widget.newsArticles.image),
                  authorWidget(widget.newsArticles.author),
                  articleWidget(widget.newsArticles.article),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tech_2_stop_new/models/catagory_btn.dart';
import 'package:tech_2_stop_new/models/news_articles.dart';
import 'package:tech_2_stop_new/helper/resources.dart';
import 'package:tech_2_stop_new/screens/news/news.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List<NewsArticles> newsCardList = [
    NewsArticles(
        title: 'Android 11 Bubbles Coming to Google Messages Really Soon',
        image: 'images/img1.jpg'),
    NewsArticles(
        title: 'Android 11 Beta bids farewell to 4GB Cap on Video Recordings',
        image: 'images/img2.jpg'),
    NewsArticles(
        title:
            'How To discover nearest coronavirus testing facilities in India utilizing Google Services',
        image: 'images/img3.jpg'),
  ];

  static String textTest =
      'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.' +
          'The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.';

  List<NewsArticles> newsArticlesList = [
    NewsArticles(
      title: 'Android 11 Bubbles Coming to Google Messages Really Soon',
      image: 'images/img1.jpg',
      author: 'Amitesh',
      article: textTest,
    ),
    NewsArticles(
      title: 'Android 11 Beta bids farewell to 4GB Cap on Video Recordings',
      image: 'images/img2.jpg',
      author: 'Amitesh',
      article: textTest,
    ),
    NewsArticles(
      title:
          'How To discover nearest coronavirus testing facilities in India utilizing Google Services',
      image: 'images/img3.jpg',
      author: 'Amitesh',
      article: textTest,
    ),
  ];

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

  Widget newsCardWidget(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                NewsPage(newsArticles: newsArticlesList[index]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        decoration: BoxDecoration(
          color: r.newsCardColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          //border: Border.all(color: Colors.grey, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: .5)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: Image.asset(newsCardList[index].image,
                    fit: BoxFit.fitWidth),
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: Text(newsCardList[index].title,
                  style: r.style(r.black, 18, r.f2).copyWith(height: 1.4)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            headerText('Discover Latest Tech News'),
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: newsCardList.length,
                itemBuilder: (context, index) => newsCardWidget(context, index),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

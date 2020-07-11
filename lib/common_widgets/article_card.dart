import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/style.dart';
import 'package:tech_two_stop/helper/resources.dart';
import 'package:tech_two_stop/screens/news/article_view.dart';

class ArticleCard extends StatelessWidget {
  Resources r = new Resources();

  final String imageUrl;
  final String title;
  final String description;
  final String url;

  ArticleCard({this.imageUrl, this.title, this.description, this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ArticleView(articleUrl: url)));
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
              width: double.maxFinite,
              decoration: BoxDecoration(
                border:
                    Border(bottom: BorderSide(color: Colors.grey, width: .5)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  image: imageUrl,
                  placeholder: 'images/loading.gif',
                  alignment: Alignment.center,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Html(
                data: title,
                style: {
                  "html": Style.fromTextStyle(TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontFamily: r.f2,
                    fontWeight: FontWeight.w600,
                  ))
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10.0, bottom: 15.0),
              child: Html(
                data: description,
                style: {
                  "html": Style.fromTextStyle(TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[800],
                    fontFamily: r.f2,
                    fontWeight: FontWeight.normal,
                  ))
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

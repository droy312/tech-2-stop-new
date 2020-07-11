import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tech_two_stop/helper/resources.dart';
import 'package:tech_two_stop/screens/category_news/category_news.dart';

class CategoryTile extends StatelessWidget {
  Resources r = new Resources();
  CategoryTile({this.categoryId, this.imageUrl, this.categoryName});
  final int categoryId;
  final String imageUrl;
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CategoryNews(
                  categoryId: categoryId,
                  categoryName: categoryName,
                )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16.0),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(6.0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 60.0,
                width: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: 60.0,
              width: 120.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                color: Colors.black38,
              ),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  fontFamily: r.f4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
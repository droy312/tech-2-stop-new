import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tech_two_stop/helper/resources.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {
  ArticleView({@required this.articleUrl});
  final String articleUrl;
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  Resources r = new Resources();
  final Completer<WebViewController> _completer =
      Completer<WebViewController>();

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  num _stackToView = 1;

  void _handleLoad(String value) {
    setState(() {
      _stackToView = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: r.bgColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: r.bgColor,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 22.0),
              onPressed: () {
                Navigator.of(context).pop();
              }),
          title: r.customLogo,
          actions: <Widget>[
            Opacity(
              opacity: 0,
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {},
              ),
            ),
          ],
        ),
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: IndexedStack(
              index: _stackToView,
              children: <Widget>[
                Expanded(
                  child: WebView(
                    initialUrl: widget.articleUrl,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: _handleLoad,
                    onWebViewCreated: ((WebViewController webViewController) {
                      _completer.complete(webViewController);
                    }),
                    javascriptChannels: <JavascriptChannel>[
                      _toasterJavascriptChannel(context),
                    ].toSet(),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterfsdenc21/model/news.dart';
import 'package:webview_flutter/webview_flutter.dart';

/*
class NewsDetails extends StatefulWidget {

  News news;

  NewsDetails({Key? key, required this.news}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.news.title),
        ),
        body: WebView(
          initialUrl: widget.news.url,
        )
    );
  }
}

 */

class NewsDetails extends StatefulWidget {


  NewsDetails({Key? key}) : super(key: key);

  @override
  _NewsDetailsState createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {

  @override
  void initState() {
    super.initState();

    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    // Read the arguments from the Named Route
    var news = ModalRoute.of(context)!.settings.arguments as News;

    return Scaffold(
        appBar: AppBar(
          title: Text(news.title),
        ),
        body: WebView(
          initialUrl: news.url,
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
        )
    );
  }
}

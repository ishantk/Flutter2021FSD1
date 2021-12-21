import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:webview_flutter/webview_flutter.dart';

// Network operation: It can take more time than usual
Future<String> fetchNewsFromWebService() async{

  String apiKey = "31c21508fad64116acd229c10ac11e84";
  String url = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey="+apiKey;

    var response = await http.get(Uri.parse(url));
    // http.post(url, {}); if we wish to send data to server

    return response.body; // Returning JSON DATA
}

class NewsPage extends StatelessWidget {

  const NewsPage({Key? key}) : super(key: key);

  // user defined function
  Widget parseResponseFromWebService(String responseText, BuildContext context){

    var jsonData = convert.jsonDecode(responseText);

    // Extract list of articles from the newsapi response
    List articles = jsonData['articles'];

    List<Widget> widgets = [];

    articles.forEach((element) {
      widgets.add(element['urlToImage'] != null ?  Image.network(element['urlToImage']) : Container() );
      widgets.add(Divider());
      widgets.add(ListTile(
        title: Text(element['title']),
        subtitle: Text(element['publishedAt']),
        onTap: (){
          var route = MaterialPageRoute(builder: (context) => NewsInWebView(url: element['url']),);
          Navigator.push(context, route);
        },
      ));
      widgets.add(SizedBox(height: 6,));
    });


    return ListView(
      padding: EdgeInsets.all(8),
      children: widgets
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Latest Business News"),
      ),
      body: FutureBuilder(
        future: fetchNewsFromWebService(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return parseResponseFromWebService(snapshot.data.toString(), context);
          }else{
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 2,),
                  Text("Please Wait....")
                ],
              ),
            );
          }
        },
      )
    );
  }
}

class NewsInWebView extends StatelessWidget{

  String url;

  NewsInWebView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("News"),
        ),
        body: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (int progress) {
            print('WebView is loading (progress : $progress%)');
          },
        )
    );
  }
}


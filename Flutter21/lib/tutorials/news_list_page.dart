import 'package:flutter/material.dart';
import 'package:flutterfsdenc21/model/news.dart';
import 'package:flutterfsdenc21/tutorials/news_details.dart';

class NewsListPage extends StatelessWidget {
  const NewsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News List"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ListTile(
            leading: Icon(Icons.web, color: Colors.teal,),
            title: Text("Zee News", style: TextStyle(color: Colors.teal),),
            subtitle: Text("news from zee channel"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

              var newsReference = News("Zee News", "https://zeenews.india.com/");

              // Through Material Routing | Explicit Routing
              /*var route = MaterialPageRoute(
                builder: (context) => NewsDetails(news: newsReference),
              );
              Navigator.push(context, route);*/

              // Passing Data to another Screen/Page with named route |  | Implicit Routing
              Navigator.pushNamed(context, "/newsdetails", arguments: newsReference);

            },
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.teal,),
            title: Text("CNN", style: TextStyle(color: Colors.teal),),
            subtitle: Text("news from cnn channel"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.teal,),
            title: Text("Aaj Tak", style: TextStyle(color: Colors.teal),),
            subtitle: Text("news from aaj tak channel"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.teal,),
            title: Text("Republic", style: TextStyle(color: Colors.teal),),
            subtitle: Text("news from republic channel"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          ),
          ListTile(
            leading: Icon(Icons.web, color: Colors.teal,),
            title: Text("NDTV", style: TextStyle(color: Colors.teal),),
            subtitle: Text("news from ndtv channel"),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: (){

            },
          )
        ],
      ),
    );
  }
}

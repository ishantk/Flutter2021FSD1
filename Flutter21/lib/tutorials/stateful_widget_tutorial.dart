import 'package:flutter/material.dart';

class QuotesPage extends StatefulWidget {

  const QuotesPage({Key? key}) : super(key: key);

  @override
  _QuotesPageState createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {

  var quotes = ["Be Exceptional !!",
    "Search the candle rather than cursing the darkness",
    "Work Hard, Be Successful",
    "Have faith in you"
  ];

  var index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuotesPage"),
      ),
      body: Container(
        color: Colors.black,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(quotes[index], style: TextStyle(color: Colors.amber),),
            SizedBox(height: 64,),
            ElevatedButton(onPressed: (){
              // setState function will refresh the UI
              // i.e. build method will be re-executed to give a new widget
              setState(() {
                index++;

                if(index == quotes.length){
                  index = 0;
                }

              });

            }, child: Text("Next")),
            SizedBox(height: 8,),
            ElevatedButton(onPressed: (){
              setState(() {
                index--;
                if(index < 0){
                  index = quotes.length-1;
                }
              });
            }, child: Text("Previous")),
          ],
        ),
      ),
    );
  }
}

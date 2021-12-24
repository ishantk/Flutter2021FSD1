import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfsdenc21/auth/login_page.dart';
import 'package:flutterfsdenc21/auth/register_page.dart';
import 'package:flutterfsdenc21/auth/splash_page.dart';
import 'package:flutterfsdenc21/tutorials/bottom_navbar.dart';
import 'package:flutterfsdenc21/tutorials/constants.dart';
import 'package:flutterfsdenc21/tutorials/navigation_drawer.dart';
import 'package:flutterfsdenc21/tutorials/news_details.dart';
import 'package:flutterfsdenc21/tutorials/news_list_page.dart';
import 'package:flutterfsdenc21/tutorials/news_page.dart';
import 'package:flutterfsdenc21/tutorials/page_one.dart';
import 'package:flutterfsdenc21/tutorials/page_two.dart';
import 'package:flutterfsdenc21/tutorials/stateful_widget_tutorial.dart';
import 'package:flutterfsdenc21/tutorials/tab_navigation.dart';

/*
  Firebase Integration
  Documentation Link: https://firebase.google.com/docs/flutter/setup?platform=android
 */

// void main() {
//
//   //runApp(const MyApp());
//
//   const app = MyApp();
//   runApp(app);
//
// }

//void main() => runApp(const MyApp());
//void main() => runApp(const TabBarPage());

void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // This ensures that all the widets in your app required for the main screen are initialized
  // Before the app runs, we must initialize firebase module :)
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  // key is with which we can identify our widget
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      //home: QuotesPage(),
      //home: PageOne()
      initialRoute: "/splash",
      routes: {
        '/': (context) => PageOne(),
        pageTwoRoute : (context) => PageTwo(),
        '/newslist': (context) => NewsListPage(),
        '/newsdetails': (context) => NewsDetails(),
        "/drawer":  (context) => NavigationDrawerPage(),
        "/bottom":  (context) => BottomNavigationPage(),
        "/newsapi":  (context) => NewsPage(),
        "/splash":   (context) => SplashPage(),
        "/login":   (context) => LoginPage(),
        "/register":   (context) => RegisterPage(),
        "/home":   (context) => HomePage(),
      },
    );
  }
}

/*class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.all(12),
      //margin: EdgeInsets.fromLTRB(10, 0, 12, 0),
      //margin: EdgeInsets.all(12),
      color: Colors.black12,
      child: Center(
        child: Text("Welcome to Home"),
      ),
    );
  }
}*/

/*
    <html>
      <title></title>
      <body>
        <div style="color:$fff">
          <center>
            <p>Welcome to Home</p>
          </center>
        </div>
      </body>
    <html>
 */

/*class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foodie"),),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Text("Welcome to Home", style: TextStyle(color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}*/

/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foodie"),),
      body: Container(
        color: Colors.white70,
        child: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.ac_unit, size: 32, color: Colors.green,),
            Icon(Icons.ac_unit, size: 32, color: Colors.red,),
            Icon(Icons.ac_unit, size: 32, color: Colors.yellow,),
          ],
        ),
        )


      ),
    );
  }
}*/

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Foodie"),),
      body: Container(
          color: Colors.white70,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Welcome to Foodie App"),
                Icon(Icons.ac_unit, size: 32, color: Colors.green,),
                Text("Please Signup Here"),
                Icon(Icons.ac_unit, size: 32, color: Colors.red,),
                Icon(Icons.ac_unit, size: 32, color: Colors.yellow,),
                OutlinedButton(onPressed: (){
                  print("Button Clicked");
                }, child: Text("REGISTER"))
              ],
            ),
          )


      ),
    );
  }
}




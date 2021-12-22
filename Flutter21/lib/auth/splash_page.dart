import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {

  const SplashPage({Key? key}) : super(key: key);


  navigateToLogin(BuildContext context) async{
    Future.delayed(
      Duration(seconds: 3), (){
       //Navigator.pushNamed(context, "/login");
        Navigator.pushReplacementNamed(context, "/login");
      }
    );
  }

  @override
  Widget build(BuildContext context) {

    navigateToLogin(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("food.png"),
            SizedBox(height: 12,),
            Text("Foodie", style: TextStyle(color: Colors.teal, fontSize: 24),),
            Divider(),
            SizedBox(height: 6,),
            Text("Fresh Food Delivered in No Time", style: TextStyle(color: Colors.blueGrey, fontSize: 18),),
          ],
        ),
      ),
    );
  }
}

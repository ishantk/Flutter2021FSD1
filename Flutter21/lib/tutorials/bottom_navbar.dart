import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {

  int index = 0;
  var textList = ["Welcome to Home", "Welcome to Profile", "Welcome to Settings"];
  var widgetList = [
    Center(child: Text("This is Tab1", style: TextStyle(color: Colors.red),),),
    ListView(
      children: [
        ListTile(
          title: Text("Payment Settings"),
          subtitle: Text("UPI, LinkedBankAccounts etc.."),
          leading:  Icon(Icons.coffee),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){

          },
        ),
        Container(
          color: Colors.black12,
          height: 1,
        ),
        ListTile(
          title: Text("Orders & Bookings"),
          subtitle: Text("UPI, LinkedBankAccounts etc.."),
          leading:  Icon(Icons.coffee),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: (){

          },
        ),
      ],
    ),
    Text("This is Tab3", style: TextStyle(color: Colors.purple),),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom NavBar"),
      ),
      body: Center(
        child: widgetList[index]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.tealAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle),
              label: "Profile",
              backgroundColor: Colors.tealAccent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
              backgroundColor: Colors.tealAccent
          ),
        ],
        currentIndex: index,
        selectedItemColor: Colors.teal,
        onTap: (int idx){
          setState(() {
            index = idx;
          });
        },
      ),
    );
  }
}

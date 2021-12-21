import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Tabs"),
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.card_giftcard),
                  child: Text("Home"),
                ),
                Tab(
                  icon: Icon(Icons.supervised_user_circle),
                  child: Text("Profile"),
                ),
                Tab(
                  icon: Icon(Icons.add_shopping_cart),
                  child: Text("Cart"),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
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
            ],
          ),
        ),
      ),
    );
  }
}

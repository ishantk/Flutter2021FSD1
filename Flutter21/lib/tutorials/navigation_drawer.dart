import 'package:flutter/material.dart';

class NavigationDrawerPage extends StatelessWidget {
  const NavigationDrawerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Drawer Demo"),
        actions: [
          Icon(Icons.add),
          Icon(Icons.delete),
        ],
      ),
      body: Center(
        child: Text("Hello, Welcome to Drawer Demo"),
      ),
      drawer: Drawer(
        child: Container(
          padding: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
        ),
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text("John Watson"),
              ),
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
              ListTile(
                title: Text("Digi Locker"),
                subtitle: Text("UPI, LinkedBankAccounts etc.."),
                leading:  Icon(Icons.coffee),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("Profile Settings"),
                subtitle: Text("UPI, LinkedBankAccounts etc.."),
                leading:  Icon(Icons.coffee),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){

                },
              ),
              ListTile(
                title: Text("Help Support"),
                subtitle: Text("UPI, LinkedBankAccounts etc.."),
                leading:  Icon(Icons.coffee),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

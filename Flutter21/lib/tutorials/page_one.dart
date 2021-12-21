import 'package:flutter/material.dart';
import 'package:flutterfsdenc21/tutorials/constants.dart';
import 'package:flutterfsdenc21/tutorials/page_two.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(pageOneTitle),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                pageOneTitle,
                style: TextStyle(color: Colors.white),
              ),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    //var route = MaterialPageRoute(builder: (context) => PageTwo());
                    //Navigator.push(context, route);

                    //Navigator.push(context,
                    //    MaterialPageRoute(builder: (context) => PageTwo()));

                    Navigator.pushNamed(context, pageTwoRoute);

                  },
                  child: const Text("Navigate to Page Two"))
            ],
          ),
        ));
  }
}

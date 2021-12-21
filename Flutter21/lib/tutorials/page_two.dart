import 'package:flutter/material.dart';
import 'package:flutterfsdenc21/tutorials/constants.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(pageTwoTitle),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.deepPurple,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(pageTwoTitle, style: TextStyle(color: Colors.white),),
              const SizedBox(
                height: 24,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, child: const Text("Navigate Back"))
            ],
          ),
        ));
  }
}

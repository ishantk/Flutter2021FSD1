import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool showLoader = false;

  // Key for the Form
  final _formKey = GlobalKey<FormState>();

  // Controller for the TextFormFields
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void loginUser() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text.trim(),
          password: passwordController.text.trim());
      print("User signed In Successfully: " +
          userCredential.user!.uid.toString());


      // Navigate to the Home Page :)
      if(userCredential.user!.uid.isNotEmpty){
        Navigator.pushNamed(context, "/home");
      }

    } on FirebaseAuthException catch(e){
      print("Exception is: "+e.message.toString());
      print("Exception Code: "+e.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoader ? Center(child: CircularProgressIndicator(),) : Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("food.png", fit: BoxFit.fill,),
                SizedBox(height: 4,),
                Text("Login with Your Details"),
                SizedBox(height: 12,),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  autofocus: false,
                  enabled: true,
                  validator: (value){

                    // validate the value here :)
                    if(value!.isEmpty){ // value! -> null check
                      return "Email cannot be empty";
                    }else if(value.trim().length == 0){
                      return "Email cannot be empty";
                    }

                    // add more email validations

                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    alignLabelWithHint: true,
                    labelText: "Email ID",
                    labelStyle: TextStyle(color: Colors.green),
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.black)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.red)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    contentPadding:
                    new EdgeInsets.all(8),
                  ),
                ),
                SizedBox(height: 4,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  autofocus: false,
                  enabled: true,
                  obscureText: true,
                  validator: (value){
                    // validate the value here :)
                    if(value!.isEmpty){ // value! -> null check
                      return "Password cannot be empty";
                    }else if(value.trim().length <= 5){
                      return "Password should be more than 6";
                    }

                    return null;
                  },
                  decoration: InputDecoration(
                    filled: true,
                    alignLabelWithHint: true,
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.green),
                    fillColor: Colors.transparent,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.black)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.red)),
                    disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    border: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide(
                            width: 1,
                            style: BorderStyle.solid,
                            color: Colors.grey)),
                    contentPadding: EdgeInsets.all(8)
                  ),
                ),
                SizedBox(height: 4,),
                OutlinedButton(
                    onPressed: (){
                      if(_formKey.currentState!.validate()){ // ! for null safety check of dart

                        setState(() {
                          showLoader = true;
                          loginUser();
                        });

                      }else{
                        // Validation Failed
                      }
                    },
                    child: Text("Login")
                ),
                SizedBox(height: 4,),
                InkWell(
                  child: Text("New User? Register Here"),
                  onTap: (){
                      Navigator.pushNamed(context, "/register");
                  },
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}

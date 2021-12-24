import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // Key for the Form
  final _formKey = GlobalKey<FormState>();
  bool showLoader = false;

  // Controller for the TextFormFields
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  void registerUser() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailController.text.trim(),
          password: passwordController.text.trim());
     
      print("User Created in Auth Module of Firebase: " +
          userCredential.user!.uid.toString());

      // Add the user details in database :)
      FirebaseFirestore.instance.collection("users").doc(userCredential.user!.uid).set(
          {
            "name": nameController.text.trim(),
            "email":  emailController.text.trim(),
            // more details for the user if any
          }).then((value) => Navigator.pushNamed(context, "/home"));
        
      
      // Navigate to the Home Page :)
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
                  Image.asset("food.png", fit: BoxFit.fill, height: 32, width: 32,),
                  SizedBox(height: 4,),
                  Text("Register with Your Details"),
                  SizedBox(height: 12,),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    autofocus: false,
                    enabled: true,
                    validator: (value){

                      // validate the value here :)
                      if(value!.isEmpty){ // value! -> null check
                        return "Name cannot be empty";
                      }else if(value.trim().length == 0){
                        return "Name cannot be empty";
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      alignLabelWithHint: true,
                      labelText: "Full Name",
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
                      contentPadding:
                      new EdgeInsets.all(8),
                    ),
                  ),
                  SizedBox(height: 4,),
                  OutlinedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){ // ! for null safety check of dart

                          setState(() {
                            showLoader = true;
                            registerUser();
                          });

                        }else{
                          // Validation Failed
                        }
                      },
                      child: Text("Register")
                  ),
                  SizedBox(height: 4,),
                  InkWell(
                    child: Text("Already Registered? Login Here"),
                    onTap: (){
                      Navigator.pop(context);
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

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  // Key for the Form
  final _formKey = GlobalKey<FormState>();

  // Controller for the TextFormFields
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
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
                  ),
                  SizedBox(height: 4,),
                  OutlinedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){ // ! for null safety check of dart
                          // Login is successfull :)
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

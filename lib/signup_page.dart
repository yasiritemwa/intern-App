import 'package:flutter/material.dart';

import 'WelcomePage.dart';

class SignupPage extends StatelessWidget {
  final _formkey =GlobalKey <FormState>();

 final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordlcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("sign Up" , style: TextStyle(color: Colors.white , fontSize: 25)),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
        toolbarHeight: 50,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [

              //Username
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  labelText: "Username",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Username";
                  }
                },
              ),
              SizedBox(height: 10,),

              //Email
              TextFormField(decoration: InputDecoration(
                hintText: "Enter Email",
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Email";
                  }
                  if(!value.contains("@")){
                    return "Enter Email";
                  }
                },
              ),
              SizedBox(height: 10,),

              //Password
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Password",
                  border: OutlineInputBorder(

                  ),
                  
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  }
                  return null;
                },

              ),
              SizedBox(height: 10,),
              //Confirm password
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter Password",
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(

                  ),
                ),

                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter Password";
                  }
                  if(value.length < 8) {
                    return "Password must be at leat 8 characteres";
                  }
                    final hasLetter = RegExp(r'[a-zA-Z]').hasMatch(value);
                    final hasNumber = RegExp(r'[0-9]').hasMatch(value);
                    if(!hasLetter || !hasNumber) {
                      return "must contain both letters and numbers";
                    }
                    return null;

                  }

              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                }
              }, child: Text("Submit")),


            ],

          ),
        ),

      ),
    );
  }
}
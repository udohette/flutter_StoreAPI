import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Services/apiServices.dart';

import '../main.dart';
import 'homeScreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  TextEditingController username = TextEditingController(text: "mor_2314");
  TextEditingController password = TextEditingController(text: "83r5^_");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fake Store API Integration'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: BoxDecoration(
          // image: DecorationImage(image:
          // //NetworkImage("https://images.unsplash.com/photo-1594488518065-832318c2405b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80"),
          // AssetImage("assets/images/shooping.jpg"),
          //     fit: BoxFit.fill),
        ),
        margin: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            TextField(
              controller: username,
              decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.password)),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide(color: Colors.white, width: 4),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.blueAccent),
                    onPressed: () async{
                      final  getToken = await APIService().login(username.text, password.text);
                      if(getToken['token']!= null){
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success! Your Token Id is $getToken['token['token']"),backgroundColor: Colors.green,));
                        Future.delayed(Duration(seconds: 2));
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));

                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed! To Login Please Chekc your Credentials"),backgroundColor: Colors.red,));
                      }
                    },
                    child: Text('Login'),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        side: BorderSide(color: Colors.white, width: 4),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        shadowColor: Colors.black),
                    onPressed: () {},
                    child: Text('Sign up'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

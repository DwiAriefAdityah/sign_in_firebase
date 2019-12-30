import 'package:flutter/material.dart';
import 'package:sign_in_firebase/ui/home.dart';
import 'package:sign_in_firebase/utils/firebase_auth.dart';
import 'package:sign_in_firebase/utils/sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: "");
    _passwordController = TextEditingController(text: "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 150.0,),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "Enter your Email",
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter your Password",
                ),
              ),
              SizedBox(height: 10.0,),
              Row(
                children: <Widget>[
                  RaisedButton(
                    child: Text("Login"),
                    onPressed: ()async{
                      if(_emailController.text.isEmpty || _passwordController.text.isEmpty){
                        print("Email dan Password kosong");
                        return;
                      }
                      
                      bool res = await AuthProvider().signInWithEmail(_emailController.text, _passwordController.text);
                      if(!res){ 
                        print("Login Failed"); 
                      }else{
                        print("Berhasil");
                      }
                    }
                  ),
                  
                  Container(
                    padding: EdgeInsets.only(left: 20.0),
                  ),

                  RaisedButton(
                    child: Text("Login With Google"),
                    onPressed: () async{
                      signInWithGoogle() .whenComplete(
                        (){
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context){
                                return HomePage();
                              }
                            )
                          );
                        }
                      );
                      // bool res = await AuthProvider().LoginWithGoogle();
                      // if (!res)
                      //  print("Error login with google");
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:djiguya_service_app/net/fireflutter.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({required this.toggleView});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Register"),
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
              onPressed: () {
                widget.toggleView();
              },
              icon: Icon(Icons.login),
              label: Text("Sign In"))
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(color: Colors.grey),
          child: Form(
            key: _formkey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val!.isEmpty ? 'Enter an email' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  decoration: InputDecoration(
                      hintText: "somethin@email.com",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) =>
                      val!.length < 5 ? 'Enter a password 5+ chars long' : null,
                  onChanged: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      labelText: "Password",
                      labelStyle: TextStyle(
                        color: Colors.white,
                      )),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formkey.currentState!.validate()) {
                        dynamic shouldNavigate =
                            await _auth.register(email, password);
                        if (shouldNavigate == null) {
                          setState(() {
                            error = 'Please supply a valid email';
                          });
                        }
                      }
                    },
                    child: Text("Register"),
                  ),
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )),
    );
  }
}

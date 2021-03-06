import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin:EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child:Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton()
          ]
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'youremail@email.com'
      ),
      validator: (String value) {
        if (!value.contains('@')) {
          return 'A valid email please';
        }
      }
    );
  }

  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Password'
      ),
      validator: (String value) {
        if (value.length < 4) {
          return 'A value password please';
        }
      }
    );
  }

  Widget submitButton() {
    return RaisedButton(
      textColor: Colors.white,
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        formKey.currentState.validate();
      },
    );
  }
}
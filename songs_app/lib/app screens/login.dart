import 'package:flutter/material.dart';
import './register.dart';

class Login extends StatelessWidget {

  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
        title: Text(
          'BLINK',
          style: TextStyle(
            fontSize: 25,
            fontFamily: 'Velhos Tempos',
          ),
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),

      body: ListView(
        children: <Widget>[

          Container(
            child: Column(
              children: <Widget>[

                Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Icon(
                    Icons.account_circle,
                    size: 120,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 20),
                  child: Text(
                    'LOG IN',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'TooneyNoodle',
                      color: Colors.deepPurple
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 30),
                  child: TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.justify,
                    cursorRadius: Radius.circular(5),
                    cursorColor: Colors.grey,
                    autocorrect: true,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                      labelText: 'Email',
                      hintText: 'example@example.com',
                    ),
                  ),
                ),
                Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: passwordController,
                    textAlign: TextAlign.justify,
                    cursorRadius: Radius.circular(5),
                    cursorColor: Colors.grey,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                      labelText: 'Password',
                      hintText: '*************',
                    ),
                    obscureText: true,
                  ),
                ),

                Container(
                  width: 350,
                  margin: EdgeInsets.only(top: 30, bottom: 40),
                  child: RaisedButton(
                    child: Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      debugPrint('Cannot LogIn');
                    },
                    color: Colors.indigo,
                  )
                ),

                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Not yet registered? tap the register button',
                      ),
                      Container(
                        width: 120,
                        child: FlatButton(
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 15
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                          },
                          textColor: Colors.blue,
                        ),
                      )
                    ],
                  )
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }

}
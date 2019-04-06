import 'package:flutter/material.dart';
import './login.dart';

class Register extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }

}

class RegisterState extends State<Register> {

  final TextEditingController fNameController =TextEditingController();
  final TextEditingController lNameController =TextEditingController();
  final TextEditingController genderController =TextEditingController();
  final TextEditingController doBController =TextEditingController();
  final TextEditingController emailController =TextEditingController();
  final TextEditingController passwordController =TextEditingController();

  String gender = 'Male';

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
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'TooneyNoodle',
                      color: Colors.deepPurple
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                // First name...
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(top: 28, bottom: 20),
                  child: textInput(fNameController, 'First Name', 'First Name'),
                ),
                
                // Last Name...
                Container(
                  width: 350,
                  height: 50,
                  child: textInput(lNameController, 'Last Name', 'Last Name'),
                ),

                // Gender Selection...
                Container(
                  width: 350,
                  height: 60,
                  margin: EdgeInsets.only(top: 30),
                  child: DropdownButton<String>(
                    value: gender,
                    onChanged: (String newValue) {
                      setState(() {
                        gender = newValue;
                      });
                    },
                    items: <String>['Male', 'Female', 'Others']
                      .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      })
                      .toList(),
                    isDense: true,
                  ),
                ),
                
                // Email Id...
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(bottom: 20),
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

                // Date of Birth...
                Container(
                  width: 350,
                  height: 50,
                  child: TextField(
                    controller: doBController,
                    keyboardType: TextInputType.datetime,
                    textAlign: TextAlign.justify,
                    cursorRadius: Radius.circular(5),
                    cursorColor: Colors.grey,
                    keyboardAppearance: Brightness.dark,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
                      labelText: 'Date of Birth',
                      hintText: 'dd/mm/yyyy',
                    ),
                    obscureText: true,
                  ),
                ),

                // Password...
                Container(
                  width: 350,
                  height: 50,
                  margin: EdgeInsets.only(top: 20),
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

                // Register Button...
                Container(
                  width: 350,
                  margin: EdgeInsets.only(top: 30, bottom: 40),
                  child: RaisedButton(
                    child: Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                    onPressed: () {
                      debugPrint('Cannot Register!');
                    },
                    color: Colors.indigo,
                  )
                ),

                Container(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Already Registered? tap the LogIn button',
                      ),
                      FlatButton(
                        child: Text(
                          'LOG IN',
                          style: TextStyle(
                            fontSize: 15
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                        },
                        textColor: Colors.blue,
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

TextField textInput(TextEditingController controller, String labelText, String placeholder) {
  return TextField(
    controller: controller,
    keyboardType: TextInputType.text,
    textAlign: TextAlign.justify,
    cursorRadius: Radius.circular(5),
    cursorColor: Colors.grey,
    autocorrect: true,
    keyboardAppearance: Brightness.dark,
    decoration: InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.deepPurple)),
      labelText: labelText,
      hintText: placeholder,
    ),
  );
}

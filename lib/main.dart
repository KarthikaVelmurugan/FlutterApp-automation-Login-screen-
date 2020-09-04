import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Login form",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  String email, pass;
  TextEditingController emailController, passController;
  FocusNode emailfocus, passfocus;
  bool validatee = false, validatep = false;
  double ht, wt;
  @override
  Widget build(BuildContext context) {
    ht = MediaQuery.of(context).size.height;
    wt = MediaQuery.of(context).size.width;
    final ts = TextStyle(
      fontSize: wt / 15,
      fontWeight: FontWeight.w900,
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Login form',
        home: Scaffold(
            backgroundColor: Colors.yellow[600],
            body: Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Login", style: ts),
                  ),
                  Container(
                    height: ht / 3,
                    width: wt / 1.5,
                    child: Card(

                        /* color: Colors.white,
                      height: ht / 2,
                      width: wt / 1.5,
                      padding: EdgeInsets.all(5.0),*/
                        child: Column(children: <Widget>[
                      emailTextFormField(),
                      passwordTextFormField(),
                      loginbutton(),
                    ])),
                  )
                ]))));
  }

  Widget emailTextFormField() {
    return TextFormField(
      key: ValueKey('email'),
      onChanged: (value) {
        email = value;
      },
      focusNode: emailfocus,
      onFieldSubmitted: (String value) {
        emailfocus.unfocus();
        passfocus.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 20,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.person, color: Colors.grey[400], size: 25),
        hintText: "Email",
        hintStyle: TextStyle(fontSize: wt / 20, color: Colors.grey[400]),
        errorText: validatee ? 'Email must required' : null,
        errorStyle: TextStyle(
          fontSize: wt / 33,
          color: Colors.red,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget passwordTextFormField() {
    return TextFormField(
      key: ValueKey('password'),
      onChanged: (value) {
        pass = value;
      },
      focusNode: passfocus,
      onFieldSubmitted: (String value) {
        //   namefocusnode.unfocus();
        passfocus.requestFocus();
      },
      style: TextStyle(
          fontSize: wt / 20,
          color: Colors.black,
          letterSpacing: 1,
          fontWeight: FontWeight.w600),
      controller: passController,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.grey[400], size: 25),
        hintText: "password",
        hintStyle: TextStyle(fontSize: wt / 20, color: Colors.grey[400]),
        errorText: validatep ? 'Password must required' : null,
        errorStyle: TextStyle(
          fontSize: wt / 33,
          color: Colors.red,
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget loginbutton() {
    return FlatButton(
      key: ValueKey('login'),
      onPressed: () {
        var f = 0;
        if (email == null || email.length < 5) {
          validatee = true;
          f = 1;
        } else if (pass == null) {
          validatep = true;
          f = 1;
        }
        if (f == 0) {
          _showDialogue(context);
        }
      },
      color: Colors.yellow[600],
      child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text("Login",
              style: TextStyle(
                  fontSize: wt / 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w900))),
    );
  }

  _showDialogue(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => new AlertDialog(
              title: new Text('Login Successfully !!!'),
              content: new Text('Thank you for your colloboration!'),
            ));
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterapp/add_order.dart';
import 'package:flutterapp/menu.dart';
import 'package:flutterapp/order_list.dart';
import 'package:flutterapp/registration_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //final GoogleSignIn googleSignIn = new GoogleSignIn();
  bool isGoogleSignIn = false;
  String errorMessage = '';
  String successMessage = '';
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();
  String _emailId;
  String _password;
  final _emailIdController = TextEditingController(text: '');
  final _passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffecc5) ,
      appBar: AppBar(
        title: Text('Login'), backgroundColor: Color(0xffff5f23)
      ),
      body: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Form(
                        key: _formStateKey,
                        autovalidate: true,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 5),
                              child: TextFormField(
                                validator: validateEmail,
                                onSaved: (value) {
                                  _emailId = value;
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailIdController,
                                decoration: InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Color(0xffff5f23),
                                        width: 2,
                                        style: BorderStyle.solid),
                                  ),
                                  labelText: "Email Id",
                                  icon: Icon(
                                    Icons.email,
                                    color: Color(0xffff5f23),
                                  ),
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(
                                    color: Color(0xffff5f23),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.only(left: 10, right: 10, bottom: 5),
                              child: TextFormField(
                                validator: validatePassword,
                                onSaved: (value) {
                                  _password = value;
                                },
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: new UnderlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Color(0xffff5f23),
                                          width: 2,
                                          style: BorderStyle.solid)),
                                  labelText: "Password",
                                  icon: Icon(
                                    Icons.lock,
                                    color: Color(0xffff5f23),
                                  ),
                                  fillColor: Colors.white,
                                  labelStyle: TextStyle(
                                    color: Color(0xffff5f23),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      (errorMessage != ''
                          ? Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      )
                          : Container()),
                      ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                        RaisedButton(textColor: Colors.white,
                            color: Color(0xffff5f23),
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                              onPressed: () {
                                if (_formStateKey.currentState.validate()) {
                                  _formStateKey.currentState.save();
                                  signIn(_emailId, _password).then((user) {
                                    if (user != null) {Navigator.pushReplacement(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) => OrderList()));
                                    } else {
                                      print('Error while Login.');
                                    }
                                  });
                                }
                              },
                            ),
                            RaisedButton(textColor: Colors.white,
                              color: Color(0xffff5f23),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                    builder: (context) => RegistrationPage(),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              (successMessage != ''
                  ? Text(
                successMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Color(0xffff5f23),),
              )
                  : Container()),
            ],
          )),
    );
  }

  Future<UserCredential> signIn(String email, String password) async {
    try {
      UserCredential user = await auth.signInWithEmailAndPassword(
          email: email, password: password);

      assert(user != null);
      assert(await user.user.getIdToken() != null);

      final User currentUser = await auth.currentUser;
      assert(user.user.uid == currentUser.uid);
      return user;
    } catch (e) {
      handleError(e);
      return null;
    }
  }

//  Future<FirebaseUser> googleSignin(BuildContext context) async {
//    FirebaseUser currentUser;
//    try {
//      final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//      final GoogleSignInAuthentication googleAuth =
//      await googleUser.authentication;
//      final AuthCredential credential = GoogleAuthProvider.getCredential(
//        accessToken: googleAuth.accessToken,
//        idToken: googleAuth.idToken,
//      );
//
//      final FirebaseUser user = await auth.signInWithCredential(credential);
//      assert(user.email != null);
//      assert(user.displayName != null);
//      assert(!user.isAnonymous);
//      assert(await user.getIdToken() != null);
//
//      currentUser = await auth.currentUser();
//      assert(user.uid == currentUser.uid);
//      print(currentUser);
//      print("User Name  : ${currentUser.displayName}");
//    } catch (e) {
//      handleError(e);
//    }
//    return currentUser;
//  }

//  Future<bool> googleSignout() async {
//    await auth.signOut();
//    await googleSignIn.signOut();
//    return true;
//  }

  handleError(PlatformException error) {
    print(error);
    switch (error.code) {
      case 'ERROR_USER_NOT_FOUND':
        setState(() {
          errorMessage = 'User Not Found!!!';
        });
        break;
      case 'ERROR_WRONG_PASSWORD':
        setState(() {
          errorMessage = 'Wrong Password!!!';
        });
        break;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty || !regex.hasMatch(value))
      return 'Enter Valid Email Id!!!';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.trim().isEmpty) {
      return 'Password is empty!!!';
    }
    return null;
  }
}
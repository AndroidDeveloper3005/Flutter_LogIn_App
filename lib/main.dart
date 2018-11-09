import 'package:flutter/material.dart';
import 'package:login_app/setting.dart';
import 'package:login_app/login.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _MyState createState() => new _MyState();

}

class _MyState extends State<MyApp>{

  String _title ="Please LogIn";

  Widget _screan;
  Login _login;
  Setting _setting;
  bool _auththentication;


  _MyState(){
    _login = new Login(onSubmit: (){
      onSubmit();
    });
    _setting = new  Setting();
    _screan = _login;
    _auththentication = false;
  }

  void onSubmit(){
    print("Login With : " + _login.username + '\t'+ _login.password);
    if(_login.username == "user" && _login.password == "pass"){
      _setAuthentication(true);
    }
  }


  void _setAuthentication(bool auth){
    setState(() {
      if(auth == true){
        _screan = _setting;
        _title = "Wellcome";
        _auththentication = true;

      }else{
        _screan = _login;
        _title = "Please Login";
        _auththentication = false;


      }
    });

  }

  void _goHome(){
    print("Go Home $_auththentication");
    if(_auththentication == true){
      _screan = _setting;
    }else{
      _screan = _login;

    }

  }

  void _logOut(){
    print("Log Out");
    _setAuthentication(false);

  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: "Login Demo",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(_title),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.home), onPressed: (){
              _goHome();
            }),
            new IconButton(icon: new Icon(Icons.exit_to_app), onPressed: (){
              _logOut();
            }),

          ],
        ),
        body: _screan,
      ),

    );
  }

}

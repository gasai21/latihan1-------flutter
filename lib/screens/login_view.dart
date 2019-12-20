import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan1/constants.dart';
import 'package:latihan1/screens/register_view.dart';

class LoginPageMain extends StatefulWidget {
  @override
  LoginPage createState() => LoginPage();
}

class LoginPage extends State<LoginPageMain> {
  bool password = true;
  IconData data = Icons.visibility_off;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final txtUsername = TextEditingController();
  final txtPassword = TextEditingController();

  void _toggle() {
    setState(() {
      password = !password;
      if (password) {
        data = Icons.visibility_off;
      } else {
        data = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        color: Contstants.primaryColor,
        padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  _iconLogin(),
                  _titleDescriction(),
                  _textField(),
                  _buildButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _iconLogin() {
    return Image.asset(
      "assets/images/icon_login.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescriction() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Login Page",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Ini adalah deskripsi eaaaa",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  Widget _textField() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        TextFormField(
          decoration: InputDecoration(
              /*prefixIcon: Padding(
              child: Icon(Icons.account_circle),
              padding: EdgeInsets.only(left: 0.0, right: 10.0),
            ),*/
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Contstants.underlineTextField, width: 1.5)),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0)),
              hintText: "Username",
              hintStyle: TextStyle(color: Contstants.hintColor)),
          style: TextStyle(color: Colors.white, height: 1.5),
          autofocus: false,
          validator: (val){
            if(val.isEmpty){
              return "Username tidak boleh kosong!";
            }
            return null;
          },
          controller: txtUsername,
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          autofocus: false,
          obscureText: password,
          decoration: InputDecoration(
              suffixIcon: Padding(
                child: IconButton(
                  icon: Icon(
                    data,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    _toggle();
                  },
                ),
                padding: EdgeInsets.only(left: 0.0, right: 10.0),
              ),
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Contstants.underlineTextField, width: 1.5),
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 3.0)),
              hintText: "Password",
              hintStyle: TextStyle(color: Contstants.hintColor)),
          validator: (val){
            if(val.isEmpty){
              return "Password tidak boleh kosong!";
            }
            return null;
          },
          controller: txtPassword,
        )
      ],
    );
  }

  Widget _buildButton() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            width: double.infinity,
            child: Text(
              "Login",
              style: TextStyle(color: Contstants.primaryColor),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          ),
          onTap: (){
            if(_formKey.currentState.validate()){
              _doLogin();
            }
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "or",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
        ),
        FlatButton(
          child: Text(
            "Register",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pushNamed(context, RegisterPage.routeName);
          },
        )
      ],
    );
  }

  void _doLogin(){
    if(txtUsername.text == "Gagah" && txtPassword.text == "123"){
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(("berhasil Login!")),));
      Navigator.of(context).pushNamedAndRemoveUntil("/home", (Route<dynamic> route) => false);
      //Navigator.pushNamed(context, "/home");
    }else{
      _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("gagal Login!")));
    }
  }
}

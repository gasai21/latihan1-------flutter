import 'package:flutter/material.dart';
import 'package:latihan1/constants.dart';
import 'package:sweetalert/sweetalert.dart';

class RegisterPageMain extends StatefulWidget {
  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<RegisterPageMain> {
  static const routeName = "/RegisterPage";
  bool password = true;
  bool password2 = true;
  IconData data = Icons.visibility_off;
  IconData data2 = Icons.visibility_off;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final txtPassword = TextEditingController();
  final txtRePassword = TextEditingController();
  final txtUsername = TextEditingController();

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

  void _toggle2() {
    setState(() {
      password2 = !password2;
      if (password2) {
        data2 = Icons.visibility_off;
      } else {
        data2 = Icons.visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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
                  _iconTegister(),
                  _titleDescription(),
                  _textField(),
                  _buildButton()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconTegister() {
    return Image.asset(
      "assets/images/icon_register.png",
      width: 150.0,
      height: 150.0,
    );
  }

  Widget _titleDescription() {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "Registrasi",
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        Text(
          "ini contoh desc aja yaa",
          style: TextStyle(color: Colors.white, fontSize: 12.0),
          textAlign: TextAlign.center,
        ),
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
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Contstants.underlineTextField, width: 1.5)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              hintText: "Username",
              hintStyle: TextStyle(color: Contstants.hintColor)),
          style: TextStyle(color: Colors.white),
          autofocus: false,
          controller: txtUsername,
          validator: (value) {
            if (value.isEmpty) {
              return 'Username tidak boleh kosong!';
            }
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          autofocus: false,
          obscureText: password,
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  data,
                  color: Colors.white,
                ),
                onPressed: () {
                  _toggle();
                },
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Contstants.underlineTextField, width: 3.0)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              hintText: "Password",
              hintStyle: TextStyle(
                color: Contstants.hintColor,
              )),
          controller: txtPassword,
          validator: (value) {
            if (value.isEmpty) {
              return 'Password tidak boleh kosong!';
            }
            return null;
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        TextFormField(
          style: TextStyle(color: Colors.white),
          autofocus: false,
          obscureText: password2,
          decoration: InputDecoration(
              border: UnderlineInputBorder(),
              suffixIcon: IconButton(
                icon: Icon(
                  data2,
                  color: Colors.white,
                ),
                onPressed: () {
                  _toggle2();
                },
              ),
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: Contstants.underlineTextField, width: 3.0)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 3.0),
              ),
              hintText: "Re - Password",
              hintStyle: TextStyle(
                color: Contstants.hintColor,
              )),
          controller: txtRePassword,
          validator: (value) {
            if (value.isEmpty) {
              return 'Re - Password tidak boleh kosong!';
            }else if(value != txtPassword.text){
              return "Password tidak sama";
            }
            return null;
          },
        ),
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
              'Register',
              style: TextStyle(color: Contstants.primaryColor),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
          ),
          onTap: () {
            if (_formKey.currentState.validate()) {
              /*_scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('proses'),
              ));*/
              message("Berhasil Register!");
            }
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 16.0),
        ),
        FlatButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
  }

  void message(String msg__){
    SweetAlert.show(context,
        title: "Message",
        subtitle: msg__,
        style: SweetAlertStyle.success,
    onPress: (bool sta){
      if(sta){
        Navigator.pop(context);
      }
    });
  }
}

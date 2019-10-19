import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projectfanap/src/pages/home/HomePage.dart';
import 'package:projectfanap/src/service/ClientService.dart';
import 'package:projectfanap/src/widgets/CircleButton.dart';


class LoginSignInPage extends StatefulWidget {
  @override
  _LoginSignInPageState createState() => _LoginSignInPageState();
}

class _LoginSignInPageState extends State<LoginSignInPage> {
  TextEditingController _controllerLogin = TextEditingController();
  TextEditingController _controllerLoginPassword = TextEditingController();

  ClientService _clientService = ClientService();

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<int> _islogin() async {
    int response = await _clientService.isLoginPost(
        _controllerLogin.text, _controllerLoginPassword.text);
    return response;
  }

  _controllerCadastro() async {
    if (_controllerLogin.text == "") {
      final snackbar = SnackBar(
        content: Text("Digite seu Login"),
        duration: Duration(seconds: 3),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
    } else if (_controllerLoginPassword.text == "") {
      final snackbar = SnackBar(
        content: Text("Digite sua Senha"),
        duration: Duration(seconds: 3),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
    } else {
      if (await _islogin() > 0) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        final snackbar = SnackBar(
          content: Text("Usuario ou senha Invalidos"),
          duration: Duration(seconds: 3),
        );
        _scaffoldKey.currentState.showSnackBar(snackbar);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;

    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(
              horizontal: _size.width / 14, vertical: _size.width / 14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                    top: _size.width / 18, bottom: _size.width / 50),
                width: _size.width / 2.5,
                child: Image.asset("assets/logo.png"),
              ),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).accentColor,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(92, 42, 100, 1.0), blurRadius: 1),
                  ],
                ),
                child: Column(
                  children: <Widget>[
                    TextField(
                      style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      maxLength: 15,
                      decoration: InputDecoration(
                        icon: Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                          size: 26,
                        ),
                        hintText: "Usuario",
                        hintStyle: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey,
                          letterSpacing: 2,
                        ),
                      ),
                      controller: _controllerLogin,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      style: TextStyle(
                        color: Colors.white,
                        decorationColor: Colors.white,
                      ),
                      cursorColor: Colors.white,
                      maxLength: 8,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        labelStyle: TextStyle(color: Colors.white),
                        icon: Icon(
                          Icons.lock_outline,
                          color: Colors.white,
                          size: 26,
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 17.0,
                          color: Colors.grey,
                          letterSpacing: 2,
                        ),
                      ),
                      controller: _controllerLoginPassword,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2,
              ),
              GestureDetector(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Text(
                    "  CRIE SUA CONTA .",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                ),
                onTap: () {
                  debugPrint("Teste");
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: _size.width * 0.1),
                child: CicleButton(
                  label: "ENTRAR",
                  onTap: () async {
                    _controllerCadastro();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _size.width * 0.12),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Divider(
                      color: Colors.black,
                      height: 15,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "NOSSAS REDES",
                        style: TextStyle(
                            color: Theme.of(context).accentColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.black,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _size.width * 0.08),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: CicleButton(
                        height: 45,
                        gradientColor: false,
                        colorGradient: Colors.blue,
                        icon: Icon(
                          FontAwesomeIcons.facebookF,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: "FACEBOOK",
                        onTap: () {},
                      ),
                    ),
                    Container(
                      width: 20,
                    ),
                    Expanded(
                      child: CicleButton(
                        height: 45,
                        gradientColor: false,
                        colorGradient: Colors.red[700],
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Colors.white,
                          size: 18,
                        ),
                        label: "GOOGLE",
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

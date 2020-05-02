import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/util/util.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    set(w, h);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getLogin(),
    );
  }

  Widget getLogin() {
    BlocHome bloc = BlocProvider.getBloc<BlocHome>();
    return StreamBuilder(
        stream: bloc.userStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData && !snapshot.hasError) {
            return Container(
              color: Colors.white,
              width: width,
              height: heigth,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: height * 0.3)),
                  Image.asset('asset/swift.png'),
                  Container(
                    width: width * 0.9,
                    height: 50,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(176, 196, 222, 1)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromRGBO(176, 196, 222, 1)),
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      width: width * 0.9,
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: "Senha",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                  color: Color.fromRGBO(176, 196, 222, 1))),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color.fromRGBO(176, 196, 222, 1)),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                        ),
                      )),
                  Padding(padding: EdgeInsets.only(top: 15)),
                  RaisedButton(
                      onPressed: () {},
                      child: Text('Login'),
                      color: Color.fromRGBO(176, 196, 222, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  FlatButton(
                      onPressed: null, child: Text("Ainda não possui conta?"))
                ],
              ),
            );
          }

          else{
            return Text("lalal");
          }
        });
  }
}

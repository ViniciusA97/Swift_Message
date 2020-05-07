import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/Model/User.dart';
import 'package:swift/View/HomeUserPage/HomePageUser.dart';
import 'package:swift/View/Sign/Sign.dart';
import 'package:swift/util/util.dart';

class LoginPage extends StatelessWidget {

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();

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
    bloc.userStream.listen((event) {

     });
    return StreamBuilder(
        stream: bloc.userStream,
        builder: (context,AsyncSnapshot<User> snapshot) {
          if (snapshot.hasData) {
            call(context, snapshot.data);
            }
          return Container(
              color: Colors.white,
              width: width,
              height: heigth,
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: height * 0.3)),
                  Image.asset('asset/sx.png',),
                  Container(
                    width: width * 0.9,
                    height: 50,
                    child: TextFormField(
                      controller: _emailControler,
                      style: TextStyle(color: Colors.white),
                      decoration: kInput.copyWith(hintText:"email",)
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Container(
                      width: width * 0.9,
                      height: 50,
                      child: TextFormField(
                        controller: _passwordControler,
                        style: TextStyle(color: Colors.white),
                        decoration: kInput.copyWith(hintText:"senha")
                        ),
                      ),
                  Padding(padding: EdgeInsets.only(top: 25)),
                  RaisedButton(
                      onPressed:(){ 
                        bloc.userSubmit(_emailControler.text, _passwordControler.text, false);
                        },
                      child: Text('Login', style: TextStyle(color: Colors.white),),
                      color: Color.fromRGBO(143, 194, 234, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  Padding(padding: EdgeInsets.only(top: 20)),
                  FlatButton(
                      onPressed: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => Sign())); 
                      },
                      child: Text("Ainda não possui conta?"))
                ],
              ),
            );

        });
  }

  call(BuildContext context, User u) async{
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){ return HomePageUser(user: u);}));
  }
}

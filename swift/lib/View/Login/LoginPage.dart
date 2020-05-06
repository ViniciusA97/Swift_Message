import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
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
                      onPressed:() async{ 
                        bool condiction = await bloc.userSubmit(_emailControler.text, _passwordControler.text, false);
                        condiction ?
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageUser(snapshot.data)))
                            :print("************\nsnapshot login:${snapshot.data}\n*************");
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
          }

          else{
            return Text("lalal");
          }
        });
  }
}

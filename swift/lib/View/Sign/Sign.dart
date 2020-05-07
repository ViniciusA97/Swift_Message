import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/Model/User.dart';
import 'package:swift/View/HomeUserPage/HomePageUser.dart';
import 'package:swift/util/util.dart';

class Sign extends StatelessWidget{

  TextEditingController _emailControler = TextEditingController();
  TextEditingController _passwordControler = TextEditingController();
  TextEditingController _nameControler = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: getBody(),

    );
  }

  Widget getBody(){
    
    BlocHome bloc = BlocProvider.getBloc<BlocHome>();
    return 
    StreamBuilder(
      stream: bloc.userStream,
      builder: (context, AsyncSnapshot<User> snapshot){
        return Container(
      color: Colors.white60,
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:height*0.3)),
          Image.asset('asset/plane.gif', height: 100),
          Padding(padding: EdgeInsets.only(top:10)),
          Text("Crie sua conta! Adicione seus dados."),
          Padding(padding: EdgeInsets.only(top:10)),
          Container(
            width: width*0.8,
            height: height*0.4,
            child: Column(
              children: <Widget>[
                TextFormField(
                  controller: _nameControler,
                  style: TextStyle(color: Colors.white),
                  decoration: kInput.copyWith(hintText: "Nome")
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                TextFormField(
                  controller: _emailControler,
                  style: TextStyle(color: Colors.white),
                  decoration: kInput.copyWith(hintText: "Email")
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                TextFormField(
                  controller: _passwordControler,
                  style: TextStyle(color: Colors.white),
                  decoration: kInput.copyWith(hintText: "Senha")
                ),
                Padding(padding: EdgeInsets.only(top:15)),
                RaisedButton(
                      onPressed:() async{ 
                        bool cond = await bloc.userCreate(_emailControler.text, _nameControler.text, _passwordControler.text);
                        cond? Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePageUser(user: snapshot.data,)))
                        : print("Erro no signup");
                        },
                      child: Text('Criar'),
                      color: Color(0xff8fc2ea),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
              ],
            ),
          ),
        ],
      ),
    );
      }
      
      );
    
  }

}
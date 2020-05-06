import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocChats.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/Model/User.dart';
import 'package:swift/util/util.dart';

class HomePageUser extends StatelessWidget{
  
  User _user;

  HomePageUser(this._user);

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody(){

    
    BlocHome blocHome = BlocProvider.getBloc<BlocHome>();
    BlocChat blocChat = BlocProvider.getBloc<BlocChat>();

    blocChat.getChatsUser(_user);

    return Container(
      width: width,
      height: height,
      child: StreamBuilder(
        stream: blocChat.chatStream,
        builder: (context, snapshot){
          if(snapshot.hasData && !snapshot.hasError){
            print(snapshot.data);
            return Container(
              width: width-10,
              height: height*0.8,
              child: ListView.builder(
                itemBuilder: null
              ),
            );
          }else{
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('Você ainda não esta em nenhum chat')
                ],
              ),
            );
          }
        }
      )
    );
  }

}
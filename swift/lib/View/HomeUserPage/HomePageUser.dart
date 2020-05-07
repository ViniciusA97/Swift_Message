import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocChats.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/Model/Chat.dart';
import 'package:swift/Model/User.dart';
import 'package:swift/util/util.dart';

class HomePageUser extends StatelessWidget{
  
  User user;

  HomePageUser({this.user});

  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody(){

    
    BlocHome blocHome = BlocProvider.getBloc<BlocHome>();
    BlocChat blocChat = BlocProvider.getBloc<BlocChat>();
    blocChat.getChatsUser(user);

    return 
    StreamBuilder(
      stream: blocChat.chatStream,
      builder: (context,AsyncSnapshot<List<Chat>> snapshot){

        if(!snapshot.hasData){
          return Center(child: Text("Ainda sem chat"),);
        }
        else{
          return
            Container(
      width: width,
      height: height,
      child: ListView.builder(
        itemCount: snapshot.data.length,
        itemBuilder: (context,int index){
          return Container(
            width: width -10,
            height: 50,
            color: Colors.black,
          );
        }
        )
      );
        }

    });
    
  }

}
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocChats.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/Model/Chat.dart';
import 'package:swift/Model/User.dart';
import 'package:swift/View/createChat/CreateChat.dart';
import 'package:swift/util/util.dart';

class HomePageUser extends StatelessWidget {
  User user;

  HomePageUser({this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  Widget getBody() {
    BlocLogin blocHome = BlocProvider.getBloc<BlocLogin>();
    BlocChat blocChat = BlocProvider.getBloc<BlocChat>();
    blocChat.getChatsUser(user);

    return StreamBuilder(
        stream: blocChat.chatStream,
        builder: (context, AsyncSnapshot<List<Chat>> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Ainda sem chat"),
            );
          } else {
            return Container(
                color: Colors.white,
                width: width,
                height: height,
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.only(top: 20, left: 20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 30),
                            child: Text(
                              'Swift',
                              style: TextStyle(
                                  fontFamily: 'gabriola',
                                  fontSize: 40,
                                  color: color1),
                            )),
                        RawMaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateChat()));
                          },
                          child: Icon(
                            Icons.group_add,
                            color: color1,
                          ),
                        ),
                        RawMaterialButton(
                            onPressed: null,
                            child: Icon(Icons.message, color: color1))
                      ],
                    ),
                    Expanded(
                      child: Container(
                          color: Colors.white,
                          width: width * 0.95,
                          height: height,
                          margin: EdgeInsets.only(
                              left: width * 0.025, right: width * 0.025),
                          child: ListView.builder(
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext cntx, int index) {
                                return Container(
                                    width: width * 0.9,
                                    height: height * 0.1,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        end: Alignment.bottomCenter,
                                        begin: Alignment.topLeft,
                                        colors: <Color>[ Color.fromRGBO(143, 194, 234, 150),color1,]
                                        
                                      ),
                                        color: color1,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Colors.white),
                                          width: height * 0.1,
                                          height: height * 0.1,
                                          child: Icon(
                                            Icons.person,
                                            color: color1,
                                            size: 40,
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.only(
                                                top: 5, left: 19),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text(
                                                  snapshot.data[index]
                                                              .subject ==
                                                          null
                                                      ? "Chat de ${snapshot.data[index].clients[0].name} e ${snapshot.data[index].clients[1].name}"
                                                      : snapshot
                                                          .data[index].subject,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18),
                                                ),
                                                Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5)),
                                                Text(
                                                  snapshot.data[index]
                                                              .lastMessage ==
                                                          null
                                                      ? "Chat criado em ${snapshot.data[index].lastMessageDate}"
                                                      : snapshot.data[index]
                                                          .lastMessage,
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15),
                                                )
                                              ],
                                            ))
                                      ],
                                    ));
                              })),
                    )
                  ],
                ));
          }
        });
  }
}

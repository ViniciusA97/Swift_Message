import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocChats.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/Model/User.dart';
import 'package:swift/util/util.dart';

class CreateChat extends StatelessWidget {
  
  TextEditingController _subject = new TextEditingController();
  List<User> _list = new List<User>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
    );
  }

  void configure(BlocLogin bloc){
    bloc.userStream.listen((event) { 
      this._list.add(event);
      print(_list.length);
    });
  }

  Widget getBody() {
    BlocChat blocChat = BlocProvider.getBloc<BlocChat>();
    BlocLogin blocHome = BlocProvider.getBloc<BlocLogin>();

    configure(blocHome);

    return Container(
      padding: EdgeInsets.only(top: 30),
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Column(children: <Widget>[
              Text(
                'Crie seu grupo!',
                style: ktextGrabiola.copyWith(
                    fontSize: 40, fontWeight: FontWeight.w500),
              ),
              Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    width: width * 0.8,
                    child: TextFormField(
                        controller: _subject,
                        style: TextStyle(color: Colors.white),
                        decoration: kInput.copyWith(
                          hintText: "Nome do chat",
                        )),
                  ),
                  Padding(padding: EdgeInsets.only(top: 40)),
                  Text(
                    "Adicione os usuários",
                    style: ktextGrabiola.copyWith(fontSize: 25),
                  ),
                  Padding(padding: EdgeInsets.all(10)),
                  SizedBox(
                  
                    width: width * 0.8,
                    height: height * 0.55,
                    child: ListView.builder(
                      itemCount: _list.length,
                      itemBuilder: (c,index){
                        print('lala');
                        print(_list.length);
                        if(index==0){
                          return Container(
                            height: 20,
                            width: width*0.7,
                            decoration: BoxDecoration(
                              color: color1,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              child: Icon(Icons.add, color: color1),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white
                              ),
                            ) ,
                          );
                        }
                        else{
                          return
                            Container(
                            height: 20,
                            width: width*0.7,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Container(
                              child: Row(
                                children: <Widget>[
                                  Icon(Icons.add, color: Colors.white),
                                  Text(_list[index-1].name)
                                ],
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: color1
                              ),
                            ) ,
                          );
                        }
                      }
                    ),
                  ),
                ],
              ))
            ]),
          ),
          Align(
          alignment: Alignment.bottomCenter,
            child: 
          RaisedButton(
            onPressed: (){},
            child: Text('Criar',style: ktextGrabiola.copyWith(color:Colors.white),),
            color:color1, 
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            )
          )
        ],
      ),
    );
  }
}

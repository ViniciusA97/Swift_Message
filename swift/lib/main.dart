import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:swift/Controles/BLoC/BlocLogin.dart';
import 'package:swift/util/util.dart';
import 'View/Login/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {


  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>{
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs:[
        Bloc((i)=>BlocHome())
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Swift',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    ));
  }
}

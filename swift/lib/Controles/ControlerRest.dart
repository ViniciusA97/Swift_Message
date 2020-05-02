import 'dart:io';

import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:swift/Controles/data/database.dart';
import 'package:swift/Model/User.dart';

class ControlRest{

  String _token;
  final url = "http://192.168.0.20:8080";
  HttpClient _httpClient;
  IOClient _client ;
  DatabaseHelper _db;

  static ControlRest _instance;

  static ControlRest getInstance(){
    if(_instance ==null) _instance = new ControlRest();
    return _instance;
  }

  ControlRest(){ initialize();}

  void initialize(){
    print('hi');
    this._httpClient= new HttpClient()
        ..badCertificateCallback =
        ((X509Certificate cert, String host, int port) {
          return true;
        });
    this._client= new IOClient(this._httpClient);
  }

  Future<User> login(String email, String password, bool save) async{
    print("email: $email  senha: $password");
    Map<String, String> user = {'email': email, 'password' : password};
    try{
      Response response = await this._client.post(this.url+"/client/login",body: user);
      if(response.statusCode == 202){
        print(response.body);
        User user = User.mapJSON(response.body[0]);
        if(save) this._db.saveUser(user);
        return user;
      }
      else return null;

    }catch(err){
      print("**************** \n Erro Login: ${err.toString()} \n **************");
      return null;
    }


  }

  Future<User> create(String email, String name, String password) async{
    Map<String,String> userMap = {'email':email, 'name':name, 'password':password};
    try{
      Response response = await this._client.post(url+"/login", body: userMap); 
      if(response.statusCode == 200){
        User user = User.mapJSON(response.body);
        return user;
      }
      return null;

    }catch(err){
      print("**************** \nerro Create User : ${err.toString()}\n*******************");
      return null;
    }

  }
  



}
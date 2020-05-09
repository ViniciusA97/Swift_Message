import 'dart:io';
import 'dart:convert' as JSON;
import 'package:http/http.dart';
import 'package:http/io_client.dart';
import 'package:swift/Controles/data/database.dart';
import 'package:swift/Model/Chat.dart';
import 'package:swift/Model/User.dart';

class ControlRest{

  String _token;
  final url = "http://192.168.1.105:8080";
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
      var responseJson = JSON.jsonDecode(response.body);
      print("************\nresponse Json Login: $responseJson\n****************");
      if(response.statusCode == 202){
        User user = User.mapJSON(responseJson);
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
    print("email: $email  senha: $password name:$name");
    try{
      Response response = await this._client.post(url+"/client/create", body: userMap); 
      print(response.body);
      if(response.statusCode == 200){
        var responseJSON = JSON.jsonDecode(response.body);
        User user = User.mapJSON(responseJSON);
        return user;
      }
      return null;
    }catch(err){
      print("**************** \nerro Create User : ${err.toString()}\n*******************");
      return null;
    }
  }

  Future<List<Chat>> getChats(int idUser) async{
    print('id user:  $idUser');
    try{
      Response response = await this._client.get(url+"/chat/getChats/$idUser");
      print('${response.statusCode}');
      if(response.statusCode==202){
        List<Chat> chats = new List<Chat>();
        List<dynamic> chat = JSON.jsonDecode(response.body);
        for(dynamic i in chat){
          chats.add(Chat.mapJSON(i));
        }
        print("***************************\nJSON chat: $chat\n**************************");
        //print("***************************\nresponse chat: $response\n**************************");
        return chats;
      }
      return null;
    }catch(err){
      print("***************\nErro Chat: ${err.toString()}\n***************");
      return null;
    }


  }
  



}
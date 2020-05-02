import 'package:swift/Model/Client.dart';

class ControlRest{

  String _token;
  final url = "";

  static ControlRest _instance;

  factory ControlRest() {
    _instance ??= ControlRest._internal();
    return _instance;
  }
  ControlRest._internal();

  Future<Client> login(String email, String password) async{
    

  }
  



}
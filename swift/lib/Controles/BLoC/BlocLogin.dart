import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:swift/Controles/ControlerRest.dart';
import 'package:swift/Model/Chat.dart';
import 'package:swift/Model/Client.dart';

class BlocHome extends BlocBase{

  ControlRest controlRest = ControlRest();

  final _userStream = BehaviorSubject<Client>();
  final _chatStream = BehaviorSubject<Chat>();

  Observable<Client> get userStream => _userStream.stream;

  void userSubmit(String email, String password) async{
      
  }

  @override
  void dispose() {
    _userStream.close();
    _chatStream.close();
    super.dispose();
  }

}
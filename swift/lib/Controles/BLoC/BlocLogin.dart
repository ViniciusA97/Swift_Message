import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:swift/Controles/ControlerRest.dart';
import 'package:swift/Model/Chat.dart';
import 'package:swift/Model/User.dart';

class BlocHome extends BlocBase{

  ControlRest controlRest = ControlRest.getInstance();

  final _userStream = BehaviorSubject<User>();
  final _chatStream = BehaviorSubject<Chat>();

  Observable<User> get userStream => _userStream.stream;

  void userSubmit(String email, String password, bool save) async{
      User user =await controlRest.login(email, password, save);
      _userStream.sink.add(user);
  }

  void userCreate(String email, String name, String password) async{

  }

  @override
  void dispose() {
    _userStream.close();
    _chatStream.close();
    super.dispose();
  }

}
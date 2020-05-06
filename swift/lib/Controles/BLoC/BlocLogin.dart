import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:swift/Controles/ControlerRest.dart';
import 'package:swift/Model/User.dart';

class BlocHome extends BlocBase{

  ControlRest controlRest = ControlRest.getInstance();

  final _userStream = BehaviorSubject<User>();

  Observable<User> get userStream => _userStream.stream;

  Future<bool> userSubmit(String email, String password, bool save) async{
      User user =await controlRest.login(email, password, save);
      if(user!=null){
        _userStream.sink.add(user);
        return true;
      }
      return false;
  }

  Future<bool> userCreate(String email, String name, String password) async{
    User user =await controlRest.create(email, name, password);
    if(user!=null){
        _userStream.sink.add(user);
        return true;
      }
      return false;
  }

  @override
  void dispose() {
    _userStream.close();
    super.dispose();
  }

}
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';
import 'package:swift/Controles/ControlerRest.dart';
import 'package:swift/Model/Chat.dart';
import 'package:swift/Model/User.dart';

class BlocChat extends BlocBase{
  
  final _chatStream = BehaviorSubject<List<Chat>>();
  ControlRest controlRest = ControlRest.getInstance();

  Observable<List<Chat>> get chatStream => _chatStream.stream;

  void getChatsUser(User u){
    controlRest.getChats(u.id);
  }

  @override
  void dispose() {
    _chatStream.close();
    super.dispose();
  }
  
}
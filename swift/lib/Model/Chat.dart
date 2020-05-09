import 'package:swift/Model/User.dart';
import 'package:swift/Model/Message.dart';

class Chat{

  List<User> _clients = new List<User>();
  List<Message> _messages;
  String _lastMessage;
  String _subject;
  String _lastMessageDate;
  int _id;

  Chat.mapJSON(dynamic obj){
    for(dynamic client in obj['clients']){ this._clients.add(User.mapJSON(client));}
    this._subject = obj['subject'];
    this._id= obj['id'];
    this._lastMessage = obj['lastMessage'];
    this._lastMessageDate = obj['lastMessageDate'];
  }

  String get lastMessage => this._lastMessage;
  String get lastMessageDate => this._lastMessageDate;
  String get subject => this._subject;
  List<User> get clients => this._clients;
  List<Message> get messages => this._messages;
  int get id => this._id;
  


}
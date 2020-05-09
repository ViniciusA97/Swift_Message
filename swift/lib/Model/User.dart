class User{

  String _name;
  String _password;
  String _email;
  int _id;

  User(this._name,this._email,this._password);

  User.mapJSON(dynamic obj){
    this._name = obj['name'];
    this._password = obj['password'];
    this._email = obj['email'];
    this._id = obj['id'];
  }

  String  get name => this._name;
  String get password => this._password;
  String get email => this._email;
  int get id => this._id;

}
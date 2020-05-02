import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:swift/Model/Client.dart';

class DatabaseHelper {

  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1,onCreate: _onCreate);
        return ourDb;
  }    
   
  void _onCreate(Database db, int version) async{
    await db.execute(
      '''
        CREATE TABLE client(
            id INTEGER,
            email TEXT,
            name TEXT,
            password TEXT
        );
      ''');
  }

  Future<bool> saveUser(Client c) async {
    
    var dbClient = await this.db;
    try{
      await dbClient.rawInsert(
        '''
          INSERT INTO client(id, email, name, password) VALUES(${c.id},${c.email},${c.name}, ${c.password});
        ''');
      return true;
    }catch(err){
      return false;
    }
  }

  Future<List<Client>> getUsers()async{
    
    var local = await this.db;
    try{
      List<Map> response = await local.rawQuery(
        '''
        SELECT * FROM client
        ''');
      List<Client> clients = List<Client>();
      for(Map i in response){
        clients.add(Client.mapJSON(i));
      }
      return clients;
    
    }catch(err){
      return null;
    }

  }

  Future<Client> getUserName(String email)async{
    var dbClient = await this.db;
    try{
      dynamic response = await dbClient.rawQuery(
        '''
        SELECT * FROM client WHERE email = $email
      ''');
      return Client.mapJSON(response);
    }catch(err){
      return null;
    }
  }



}
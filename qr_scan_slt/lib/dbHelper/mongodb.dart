import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:qr_scan_slt/dbHelper/constant.dart';

class MongoDatabase {
  static var db, userCollection;

  static connect() async {
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);
    userCollection = db.collection(USER_COLLECTION);
  }

  // Method to authenticate the user
  static Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
    try {
      // Search for user with the given username and password
      final user = await userCollection.findOne({
        'username': username,
        'password': password,  // Use hashed/salted passwords in real applications!
      });

      if (user != null) {
        return user;
      } else {
        return null;
      }
    } catch (e) {
      log('Error authenticating user: $e');
      return null;
    }
  }
}

// import 'dart:developer';
//
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:qr_scan_slt/dbHelper/constant.dart';
//
// class MongoDatabase{
//   static var db , userCollection;
//   static connect() async {
//     db = await Db.create(MONGO_CONN_URL);
//     await db.open();
//     inspect(db);
//     userCollection = db.collection(USER_COLLECTION);
//   }
// }
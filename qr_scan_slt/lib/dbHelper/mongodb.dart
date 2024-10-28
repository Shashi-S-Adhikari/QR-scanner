import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:qr_scan_slt/dbHelper/constant.dart';

class MongoDatabase {
  static var db, userCollection, ticketsCollection;

  // Connect to MongoDB
  static Future<void> connect() async {
    if (db != null && db.isConnected) {
      log('Database already connected');
      return;
    }
    db = await Db.create(MONGO_CONN_URL);
    await db.open();
    inspect(db);

    // Initialize user and tickets collections
    userCollection = db.collection(USER_COLLECTION);
    ticketsCollection = db.collection(TICKETS_COLLECTION);
    log('Connected to the database');
  }

  // Close the MongoDB connection
  static Future<void> close() async {
    if (db != null && db.isConnected) {
      await db.close();
      log('Database connection closed');
    } else {
      log('Database is already closed or not initialized');
    }
  }

  // Method to authenticate the user
  static Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
    try {
      await connect(); // Ensure the database is connected
      final user = await userCollection.findOne({
        'username': username,
        'password': password, // Use hashed/salted passwords in real applications!
      });

      return user;
    } catch (e) {
      log('Error authenticating user: $e');
      return null;
    }
  }

  // Method to add ticket data to the tickets collection
  static Future<void> addTicketData(Map<String, dynamic> ticketData) async {
    try {
      await connect(); // Ensure the database is connected
      await ticketsCollection.insertOne(ticketData);
      log('Ticket data added successfully');
    } catch (e) {
      log('Error adding ticket data: $e');
    }
  }

  // Method to retrieve all tickets
  static Future<List<Map<String, dynamic>>> getAllTickets() async {
    try {
      await connect(); // Ensure the database is connected
      final tickets = await ticketsCollection.find().toList();
      return tickets;
    } catch (e) {
      log('Error retrieving tickets: $e');
      return [];
    }
  }

  // Method to retrieve ticket counts
  static Future<Map<String, int>> getTicketCounts() async {
    try {
      await connect(); // Ensure the database is connected
      final normalTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'Normal'));
      final vipTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'VIP'));
      final vvipTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'VVIP'));
      final totalCount = normalTicketsCount + vipTicketsCount + vvipTicketsCount;

      return {
        'normal': normalTicketsCount,
        'vip': vipTicketsCount,
        'vvip': vvipTicketsCount,
        'total': totalCount,
      };
    } catch (e) {
      log('Error retrieving ticket counts: $e');
      return {
        'normal': 0,
        'vip': 0,
        'vvip': 0,
        'total': 0,
      };
    }
  }
}






























// import 'dart:developer';
// import 'package:mongo_dart/mongo_dart.dart';
// import 'package:qr_scan_slt/dbHelper/constant.dart';
//
// class MongoDatabase {
//   static var db, userCollection, ticketsCollection;
//
//   // Connect to MongoDB
//   static Future<void> connect() async {
//     if (db != null && db.isConnected) {
//       log('Database already connected');
//       return;
//     }
//     db = await Db.create(MONGO_CONN_URL);
//     await db.open();
//     inspect(db);
//
//     // Initialize user and tickets collections
//     userCollection = db.collection(USER_COLLECTION);
//     ticketsCollection = db.collection(TICKETS_COLLECTION);
//     log('Connected to the database');
//   }
//
//   // Close the MongoDB connection
//   static Future<void> close() async {
//     if (db != null && db.isConnected) {
//       await db.close();
//       log('Database connection closed');
//     } else {
//       log('Database is already closed or not initialized');
//     }
//   }
//
//   // Method to authenticate the user
//   static Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
//     try {
//       await connect(); // Ensure the database is connected
//       final user = await userCollection.findOne({
//         'username': username,
//         'password': password, // Use hashed/salted passwords in real applications!
//       });
//
//       return user;
//     } catch (e) {
//       log('Error authenticating user: $e');
//       return null;
//     }
//   }
//
//   // Method to add ticket data to the tickets collection
//   static Future<void> addTicketData(Map<String, dynamic> ticketData) async {
//     try {
//       await connect(); // Ensure the database is connected
//       await ticketsCollection.insertOne(ticketData);
//       log('Ticket data added successfully');
//     } catch (e) {
//       log('Error adding ticket data: $e');
//     }
//   }
//
//   // Method to retrieve all tickets
//   static Future<List<Map<String, dynamic>>> getAllTickets() async {
//     try {
//       await connect(); // Ensure the database is connected
//       final tickets = await ticketsCollection.find().toList();
//       return tickets;
//     } catch (e) {
//       log('Error retrieving tickets: $e');
//       return [];
//     }
//   }
//
//   // Method to retrieve ticket counts
//   static Future<Map<String, int>> getTicketCounts() async {
//     try {
//       await connect(); // Ensure the database is connected
//       final normalTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'Normal'));
//       final vipTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'VIP'));
//       final vvipTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'VVIP'));
//       final totalCount = normalTicketsCount + vipTicketsCount + vvipTicketsCount;
//
//       return {
//         'normal': normalTicketsCount,
//         'vip': vipTicketsCount,
//         'vvip': vvipTicketsCount,
//         'total': totalCount,
//       };
//     } catch (e) {
//       log('Error retrieving ticket counts: $e');
//       return {
//         'normal': 0,
//         'vip': 0,
//         'vvip': 0,
//         'total': 0,
//       };
//     }
//   }
// }
// // import 'dart:developer';
// // import 'package:mongo_dart/mongo_dart.dart';
// // import 'package:qr_scan_slt/dbHelper/constant.dart';
// //
// // class MongoDatabase {
// //   static var db, userCollection, ticketsCollection;
// //
// //   // Connect to MongoDB
// //   static Future<void> connect() async {
// //     if (db != null && db.isConnected) {
// //       log('Database already connected');
// //       return;
// //     }
// //     db = await Db.create(MONGO_CONN_URL);
// //     await db.open();
// //     inspect(db);
// //
// //     // Initialize user and tickets collections
// //     userCollection = db.collection(USER_COLLECTION);
// //     ticketsCollection = db.collection(TICKETS_COLLECTION);
// //     log('Connected to the database');
// //   }
// //
// //   // Close the MongoDB connection
// //   static Future<void> close() async {
// //     if (db != null && db.isConnected) {
// //       await db.close();
// //       log('Database connection closed');
// //     } else {
// //       log('Database is already closed or not initialized');
// //     }
// //   }
// //
// //   // Method to authenticate the user
// //   static Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
// //     try {
// //       await connect(); // Ensure the database is connected
// //       final user = await userCollection.findOne({
// //         'username': username,
// //         'password': password, // Use hashed/salted passwords in real applications!
// //       });
// //
// //       return user;
// //     } catch (e) {
// //       log('Error authenticating user: $e');
// //       return null;
// //     }
// //   }
// //
// //   // Method to add ticket data to the tickets collection
// //   static Future<void> addTicketData(Map<String, dynamic> ticketData) async {
// //     try {
// //       await connect(); // Ensure the database is connected
// //       await ticketsCollection.insertOne(ticketData);
// //       log('Ticket data added successfully');
// //     } catch (e) {
// //       log('Error adding ticket data: $e');
// //     }
// //   }
// //
// //   // Method to retrieve all tickets
// //   static Future<List<Map<String, dynamic>>> getAllTickets() async {
// //     try {
// //       await connect(); // Ensure the database is connected
// //       final tickets = await ticketsCollection.find().toList();
// //       return tickets;
// //     } catch (e) {
// //       log('Error retrieving tickets: $e');
// //       return [];
// //     }
// //   }
// //
// //   // Method to retrieve ticket counts
// //   static Future<Map<String, int>> getTicketCounts() async {
// //     try {
// //       await connect(); // Ensure the database is connected
// //       final normalTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'Normal'));
// //       final vipTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'VIP'));
// //       final vvipTicketsCount = await ticketsCollection.count(where.eq('ticketType', 'VVIP'));
// //       final totalCount = normalTicketsCount + vipTicketsCount + vvipTicketsCount;
// //
// //       return {
// //         'normal': normalTicketsCount,
// //         'vip': vipTicketsCount,
// //         'vvip': vvipTicketsCount,
// //         'total': totalCount,
// //       };
// //     } catch (e) {
// //       log('Error retrieving ticket counts: $e');
// //       return {
// //         'normal': 0,
// //         'vip': 0,
// //         'vvip': 0,
// //         'total': 0,
// //       };
// //     }
// //   }
// // }
// //
// //
// //
// //
// //
// //
// //
// //
// //
// //
// // // import 'dart:developer';
// // // import 'package:mongo_dart/mongo_dart.dart';
// // // import 'package:qr_scan_slt/dbHelper/constant.dart';
// // //
// // // class MongoDatabase {
// // //   static var db, userCollection, ticketsCollection;
// // //
// // //   static connect() async {
// // //     // Connect to MongoDB
// // //     db = await Db.create(MONGO_CONN_URL);
// // //     await db.open();
// // //     inspect(db);
// // //
// // //     // Initialize user and tickets collections
// // //     userCollection = db.collection(USER_COLLECTION);
// // //     ticketsCollection = db.collection(TICKETS_COLLECTION);
// // //   }
// // //
// // //   // Method to authenticate the user
// // //   static Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
// // //     try {
// // //       // Search for user with the given username and password
// // //       final user = await userCollection.findOne({
// // //         'username': username,
// // //         'password': password,  // Use hashed/salted passwords in real applications!
// // //       });
// // //
// // //       if (user != null) {
// // //         return user;
// // //       } else {
// // //         return null;
// // //       }
// // //     } catch (e) {
// // //       log('Error authenticating user: $e');
// // //       return null;
// // //     }
// // //   }
// // //
// // //   // Method to add ticket data to the tickets collection
// // //   static Future<void> addTicketData(Map<String, dynamic> ticketData) async {
// // //     try {
// // //       await ticketsCollection.insertOne(ticketData);
// // //       log('Ticket data added successfully');
// // //     } catch (e) {
// // //       log('Error adding ticket data: $e');
// // //     }
// // //   }
// // //
// // //   // Method to retrieve all tickets
// // //   static Future<List<Map<String, dynamic>>> getAllTickets() async {
// // //     try {
// // //       final tickets = await ticketsCollection.find().toList();
// // //       return tickets;
// // //     } catch (e) {
// // //       log('Error retrieving tickets: $e');
// // //       return [];
// // //     }
// // //   }
// // // }
// // // import 'dart:developer';
// // // import 'package:mongo_dart/mongo_dart.dart';
// // // import 'package:qr_scan_slt/dbHelper/constant.dart';
// // //
// // // class MongoDatabase {
// // //   static var db, userCollection, ticketsCollection;
// // //
// // //   static connect() async {
// // //     // Connect to MongoDB
// // //     db = await Db.create(MONGO_CONN_URL);
// // //     await db.open();
// // //     inspect(db);
// // //
// // //     // Initialize user and tickets collections
// // //     userCollection = db.collection(USER_COLLECTION);
// // //     ticketsCollection = db.collection(TICKETS_COLLECTION);
// // //   }
// // //
// // //   // Method to add ticket data to the tickets collection
// // //   static Future<void> addTicketData(Map<String, dynamic> ticketData) async {
// // //     try {
// // //       await ticketsCollection.insertOne(ticketData);
// // //       log('Ticket data added successfully');
// // //     } catch (e) {
// // //       log('Error adding ticket data: $e');
// // //     }
// // //   }
// // // }
// // // import 'dart:developer';
// // // import 'package:mongo_dart/mongo_dart.dart';
// // // import 'package:qr_scan_slt/dbHelper/constant.dart';
// // //
// // // class MongoDatabase {
// // //   static var db, userCollection;
// // //
// // //   static connect() async {
// // //     db = await Db.create(MONGO_CONN_URL);
// // //     await db.open();
// // //     inspect(db);
// // //     userCollection = db.collection(USER_COLLECTION);
// // //   }
// // //
// // //   // Method to authenticate the user
// // //   static Future<Map<String, dynamic>?> authenticateUser(String username, String password) async {
// // //     try {
// // //       // Search for user with the given username and password
// // //       final user = await userCollection.findOne({
// // //         'username': username,
// // //         'password': password,  // Use hashed/salted passwords in real applications!
// // //       });
// // //
// // //       if (user != null) {
// // //         return user;
// // //       } else {
// // //         return null;
// // //       }
// // //     } catch (e) {
// // //       log('Error authenticating user: $e');
// // //       return null;
// // //     }
// // //   }
// // // }
// // //
// // // // import 'dart:developer';
// // // //
// // // // import 'package:mongo_dart/mongo_dart.dart';
// // // // import 'package:qr_scan_slt/dbHelper/constant.dart';
// // // //
// // // // class MongoDatabase{
// // // //   static var db , userCollection;
// // // //   static connect() async {
// // // //     db = await Db.create(MONGO_CONN_URL);
// // // //     await db.open();
// // // //     inspect(db);
// // // //     userCollection = db.collection(USER_COLLECTION);
// // // //   }
// // // // }
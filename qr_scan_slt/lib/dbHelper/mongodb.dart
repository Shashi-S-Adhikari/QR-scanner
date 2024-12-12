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

      // Aggregate ticket counts
      final normalTicketsCount = await ticketsCollection.aggregateToStream([
        {
          '\$group': {
            '_id': null,
            'normal': {'\$sum': '\$normal_tickets'},
            'vip': {'\$sum': '\$vip_tickets'},
            'vvip': {'\$sum': '\$vvip_tickets'}
          }
        }
      ]).first;

      final int normal = normalTicketsCount['normal'] ?? 0;
      final int vip = normalTicketsCount['vip'] ?? 0;
      final int vvip = normalTicketsCount['vvip'] ?? 0;
      final int total = normal + vip + vvip;

      return {
        'normal': normal,
        'vip': vip,
        'vvip': vvip,
        'total': total,
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

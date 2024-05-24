// db_connection.dart
import 'package:postgres/postgres.dart';

class DatabaseConnection {
  static final DatabaseConnection _instance = DatabaseConnection._internal();
  PostgreSQLConnection _connection;

  factory DatabaseConnection() => _instance;

  DatabaseConnection._internal();

  Future<void> connect() async {
    _connection = PostgreSQLConnection(
      'host',
      5432,
      'database_name',
      username: 'username',
      password: 'password',
    );

    await _connection.open();
  }

  PostgreSQLConnection get connection => _connection;

  Future<void> close() async {
    await _connection.close();
  }
}

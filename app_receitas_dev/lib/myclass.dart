import 'package:postgres/postgres.dart';
import 'package:app_receitas_dev/database_credentials.dart';
 // Ajuste o caminho conforme a estrutura do seu projeto

class MyClass {
  late PostgreSQLConnection _connection;

  MyClass() {
    _connection = PostgreSQLConnection(
      DatabaseCredentials.host,
      DatabaseCredentials.port,
      DatabaseCredentials.databaseName,
      username: DatabaseCredentials.username,
      password: DatabaseCredentials.password,
    );
  }

  // Métodos restantes da classe...
}

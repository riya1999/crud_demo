import 'package:new_frog_demo_api/database/model.dart';
import 'package:new_frog_demo_api/database/sql_client.dart';

/// data source form MySQL

class DataSource {
  /// initializing
  const DataSource(
    this.sqlClient,
  );

  ///Fetches all table fields from users table in our database
  Future<List<DatabaseModel>> fetchFields() async {
    // sqlQuey
    const sqlQuery = 'SELECT * FROM categories;';
    return sqlExecution(sqlQuery);
  }

  Future<List<DatabaseModel>> getFields(String id) async {
    // sqlQuey
    final sqlQuery = 'SELECT * FROM categories where id = $id;';
    return sqlExecution(sqlQuery);
  }

/*  Future<List<DatabaseModel>> postFields(String name) async {
    // sqlQuey
    final sqlQuery = 'INSERT INTO categories (name) VALUES ($name);';
    return sqlExecution(sqlQuery);
  }*/

  Future<List<DatabaseModel>> deleteFields(String id) async {
    // sqlQuey
    final sqlQuery = 'DELETE FROM categories WHERE id=$id;';
    return sqlExecution(sqlQuery);
  }

  Future<List<DatabaseModel>> putFields(String id) async {
    // sqlQuey
    final sqlQuery = 'UPDATE categories SET name = id WHERE id= $id;';
    return sqlExecution(sqlQuery);
  }

  /// accessing you client
  final MySQLClient sqlClient;

  Future<List<DatabaseModel>> sqlExecution(String sqlQuery) async {
    // executing our sqlQuery
    final result = await sqlClient.execute(sqlQuery);
    final users = <DatabaseModel>[];
    for (final row in result.rows) {
      users.add(DatabaseModel.fromRowAssoc(row.assoc()));
    }
    return users;
  }
}

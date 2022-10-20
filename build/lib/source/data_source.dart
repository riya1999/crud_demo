import 'package:new_frog_demo_api/database/sql_client.dart';

import '../database/model.dart';

/// data source form MySQL

class DataSource {
  /// initializing
  const DataSource(
      this.sqlClient,
      );

  ///Fetches all table fields from users table in our database
  Future<List<DatabaseModel>> fetchCategories() async {
    // sqlQuey
    const sqlQuery = 'SELECT * FROM categories;';
    return sqlExecution(sqlQuery);
    }
  Future<List<DatabaseModel>> fetchCategory(String id) async {
    // sqlQuey
    final sqlQuery = 'SELECT * FROM categories WHERE id=$id;';
    return sqlExecution(sqlQuery);
  }

  Future<String> deleteCategory(String id) async {
    final sqlQuery = 'DELETE FROM categories WHERE id=$id;';
    await sqlClient.execute(sqlQuery);
    return 'Deleted successfully';
  }

  Future<String> insertCategory(List keys, List values) async {
    final sqlQuery = 'INSERT INTO categories (${keys.join(",")}) VALUES ("${values.join(",")}")';
    await sqlClient.execute(sqlQuery);
    return 'Inserted successfully';
    // return sqlQuery;
  }
  Future<String> updateCategory(List values,String id) async {
    // final sqlQuery = 'UPDATE categories SET keys=values,keys=values WHERE id= $id;';
    final sqlQuery = 'UPDATE categories SET ${values.join(",").toString()} WHERE id= $id;';
    await sqlClient.execute(sqlQuery);
    return 'Updated successfully';
    // return sqlQuery;
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

import 'package:sqflite/sqflite.dart';

class UsuarioRepositorio {
  static Future<void> criarTabela(Database database) async {
    await database.execute("""CREATE TABLE Usuario( 
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          DisplayName TEXT,
          Email TEXT,
          PhoneNumber TEXT,
          PhotoURL TEXT,
          Uid TEXT,
          CreationTime TEXT
          Data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<Database> db() async {
    return openDatabase('Usuario', version: 1,
        onCreate: (Database database, int version) async {
      await criarTabela(database);
    });
  }

  static Future<int> createData(
    String? DisplayName,
    String? Email,
    String? PhoneNumber,
    String? PhotoURL,
    String? Uid,
    String? CreationTime,
  ) async {
    final db = await UsuarioRepositorio.db();

    final data = {
      'DisplayName': DisplayName,
      'Email': Email,
      'PhoneNumber': PhoneNumber,
      'PhotoURL': PhotoURL,
      'Uid': Uid,
      'CreationTime': CreationTime
    };
    final id = await db.insert(
      'Usuario',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return id;
  }

  static Future<int> updateData(
    int id,
    String DisplayName,
    String Email,
    String PhoneNumber,
    String PhotoURL,
    String TelNumber,
    String Uid,
    DateTime? CreationTime,
  ) async {
    final db = await UsuarioRepositorio.db();
    final data = {
      'DisplayName': DisplayName,
      'Email': Email,
      'PhoneNumber': PhoneNumber,
      'PhotoURL': PhotoURL,
      'Uid': Uid,
      'CreationTime': CreationTime,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('Usuario', data, where: "id = ?", whereArgs: [id]);

    return result;
  }

  static Future<void> deleteData(int id) async {
    final db = await UsuarioRepositorio.db();
    try {
      await db.delete('Usuario', where: "id = ?", whereArgs: [id]);
    } catch (e) {}
  }

  static Future<void> deleteAll() async {
    final db = await UsuarioRepositorio.db();
    try {
      await db.delete('Usuario');
    } catch (e) {}
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await UsuarioRepositorio.db();
    return db.query('Usuario', orderBy: 'id DESC');
  }

  static Future<List<Map<String, dynamic>>> getSingleData(int id) async {
    final db = await UsuarioRepositorio.db();
    return db.query('Usuario', where: "id= ?", whereArgs: [id], limit: 2);
  }

  static Future<void> dropTable() async {
    // Abra a conexão com o banco de dados
    final Database db = await openDatabase('Usuario.db');

    // Execute o comando SQL para dropar a tabela
    await db.execute('DROP TABLE IF EXISTS Usuario');

    // Feche a conexão com o banco de dados
    await db.close();
  }
}

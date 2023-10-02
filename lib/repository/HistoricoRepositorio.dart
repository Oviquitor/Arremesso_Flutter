import 'package:sqflite/sqflite.dart';

class HistoricoRepositorio {
  static Future<void> criarTabela(Database database) async {
    await database.execute("""CREATE TABLE Historico( 
          id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
          EntradaCalculo TEXT,
          ResultadoDir TEXT,
          ResultadoEsq TEXT,
          NColetores INT,
          NPassadas INT,
          NDistancia DOUBLE,
          Data TEXT
    )""");
  }

  static Future<Database> db() async {
    return openDatabase('Historico', version: 1,
        onCreate: (Database database, int version) async {
      await criarTabela(database);
    });
  }

  static Future<int> createData(
      String EntradaCalculo,
      String ResultadoDir,
      String ResultadoEsq,
      int NColetores,
      int NPassadas,
      double NDistancia,
      String Data) async {
    final db = await HistoricoRepositorio.db();

    final data = {
      'EntradaCalculo': EntradaCalculo,
      'ResultadoDir': ResultadoDir,
      'ResultadoEsq': ResultadoEsq,
      'NColetores': NColetores,
      'NPassadas': NPassadas,
      'NDistancia': NDistancia,
      'Data': Data
    };
    final id = await db.insert(
      'Historico',
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    await db.close();

    return id;
  }

  // static Future<int> updateData(
  //     int id,
  //     String ResultadoDir,
  //     String ResultadoEsq,
  //     int NColetores,
  //     int NPassadas,
  //     double NDistancia) async {
  //   final db = await HistoricoRepositorio.db();
  //   final data = {
  //     'ResultadoDir': ResultadoDir,
  //     'ResultadoEsq': ResultadoEsq,
  //     'NColetores': NColetores,
  //     'NPassadas': NPassadas,
  //     'NDistancia': NDistancia,
  //     'createdAt': DateTime.now().toString()
  //   };

  //   final result =
  //       await db.update('Historico', data, where: "id = ?", whereArgs: [id]);
  //   await db.close();

  //   return result;
  // }

  static Future<void> deleteData(int id) async {
    final db = await HistoricoRepositorio.db();
    try {
      await db.delete('Historico', where: "id = ?", whereArgs: [id]);
    } catch (e) {}
    await db.close();
  }

  static Future<void> deleteAll() async {
    final db = await HistoricoRepositorio.db();
    try {
      await db.delete('Historico');
    } catch (e) {}
    await db.close();
  }

  static Future<List<Map<String, dynamic>>> getLast() async {
    final db = await HistoricoRepositorio.db();
    List<Map<String, dynamic>> result =
        await db.query('Historico', orderBy: 'id DESC');
    await db.close();

    return result;
  }

  static Future<List<Map<String, dynamic>>> getAllData() async {
    final db = await HistoricoRepositorio.db();
    List<Map<String, Object?>> result =
        await db.query('Historico', orderBy: 'id DESC');
    await db.close();

    return result;
  }

  static Future<List<Map<String, dynamic>>> getSingleData(String data) async {
    final db = await HistoricoRepositorio.db();
    List<Map<String, Object?>> result = await db.query(
      'Historico',
      where: "Data = ?",
      whereArgs: [data], /*limit: 2*/
    );
    await db.close();

    return result;
  }

  static Future<void> dropTable() async {
    // Abra a conexão com o banco de dados
    final Database db = await openDatabase('Historico.db');

    // Execute o comando SQL para dropar a tabela
    await db.execute('DROP TABLE IF EXISTS Historico');

    // Feche a conexão com o banco de dados
    await db.close();
  }
}

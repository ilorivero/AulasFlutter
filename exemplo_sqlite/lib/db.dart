import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoSQLite{
   late Database db;

   Future open() async {
        // Get a location using getDatabasesPath
        var databasesPath = await getDatabasesPath();
        String path = join(databasesPath, 'produtos.db');

        db = await openDatabase(path, version: 1,
            onCreate: (Database db, int version) async {

              await db.execute('''

                    CREATE TABLE IF NOT EXISTS produtos( 
                          id primary key,
                          nome varchar(255) not null,
                          codigo int not null,
                          valor varchar(255) not null
                      );

                  ''');
        });
   }

  Future<Map<dynamic, dynamic>?> pegaProduto(int codigo) async {
    List<Map> maps = await db.query('produtos',
        where: 'codigo = ?',
        whereArgs: [codigo]);
    if (maps.length > 0) {
       return maps.first;
    }
    return null;
  }
}
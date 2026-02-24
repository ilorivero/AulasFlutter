import 'package:path/path.dart'; // Pacote para construir caminhos de arquivo
import 'package:sqflite/sqflite.dart'; // Pacote para banco de dados SQLite

/// Classe responsável por gerenciar o banco de dados SQLite.
///
/// Encapsula a abertura do banco e as operações de consulta,
/// servindo como camada de acesso a dados (DAL) para o aplicativo.
class BancoSQLite {
  /// Instância do banco de dados SQLite.
  ///
  /// Marcada com `late` pois será inicializada de forma assíncrona
  /// pelo método [open], antes de qualquer uso.
  late Database db;

  /// Abre (ou cria) o banco de dados e a tabela de produtos.
  ///
  /// O arquivo de banco de dados é criado no caminho padrão do dispositivo.
  /// A tabela 'produtos' é criada apenas uma vez, na primeira execução (onCreate).
  Future open() async {
    // Obtém o caminho do diretório padrão para bancos de dados.
    var databasesPath = await getDatabasesPath();
    // Combina o caminho base com o nome do arquivo do banco.
    String path = join(databasesPath, 'produtos.db');

    db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // Cria a tabela de produtos com as colunas necessárias.
        // IF NOT EXISTS evita erro se a tabela já existir.
        await db.execute('''
            CREATE TABLE IF NOT EXISTS produtos( 
                  id primary key,
                  nome varchar(255) not null,
                  codigo int not null,
                  valor varchar(255) not null
              );
          ''');
      },
    );
  }

  /// Busca um produto específico pelo seu [codigo].
  ///
  /// Retorna um [Map] com os dados do produto encontrado, ou `null`
  /// se nenhum produto com o código informado for encontrado.
  Future<Map<dynamic, dynamic>?> pegaProduto(int codigo) async {
    List<Map> maps = await db.query(
      'produtos',
      where: 'codigo = ?',
      whereArgs: [codigo],
    ); // Usa placeholder para evitar SQL injection
    if (maps.length > 0) {
      return maps.first; // Retorna apenas o primeiro resultado encontrado.
    }
    return null; // Retorna null se a consulta não retornar resultados.
  }
}

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart'; // Pacote para banco de dados local SQLite
import 'package:path/path.dart'; // Pacote para montar o caminho do banco de dados

/// Ponto de entrada do aplicativo.
/// Inicializa o [MaterialApp] com a tela principal [Home].
void main() => runApp(MaterialApp(home: Home()));

/// Widget principal da tela que demonstra operações com banco de dados SQLite.
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

/// Estado associado ao widget [Home].
/// Contém os métodos para realizar operações CRUD (Criar, Ler, Atualizar, Excluir)
/// no banco de dados SQLite local.
class _HomeState extends State<Home> {
  /// Abre (ou cria, se não existir) o banco de dados SQLite.
  ///
  /// Retorna a instância do banco de dados [Database].
  /// A tabela 'usuarios' é criada na primeira execução (onCreate).
  _recuperarBancoDados() async {
    // Obtém o caminho padrão para armazenamento de bancos de dados no dispositivo.
    final caminhoBancoDados = await getDatabasesPath();
    // Combina o caminho base com o nome do arquivo do banco de dados.
    final localBancoDados = join(caminhoBancoDados, "banco3.bd");
    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      // Chamado apenas na primeira vez que o banco é criado.
      onCreate: (db, dbVersaoRecente) {
        // SQL para criar a tabela de usuários com id, nome e idade.
        String sql =
            "CREATE TABLE usuarios (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR, idade INTEGER) ";
        db.execute(sql);
      },
    );
    return bd;
  }

  /// Insere um novo usuário no banco de dados.
  ///
  /// Recebe o [nome] e a [idade] do usuário e os salva na tabela 'usuarios'.
  _salvarDados(String nome, int idade) async {
    Database bd = await _recuperarBancoDados();
    // Mapa com os dados a serem inseridos. A chave 'id' é gerada automaticamente.
    Map<String, dynamic> dadosUsuario = {"nome": nome, "idade": idade};
    // Retorna o id do registro inserido.
    int id = await bd.insert("usuarios", dadosUsuario);
    print("Salvo: $id ");
  }

  /// Lista todos os usuários cadastrados no banco de dados.
  ///
  /// Executa uma consulta SQL e imprime os resultados no console.
  _listarUsuarios() async {
    Database bd = await _recuperarBancoDados();
    // Consulta SQL para buscar todos os registros da tabela.
    String sql = "SELECT * FROM usuarios";
    List usuarios = await bd.rawQuery(
      sql,
    ); // Permite escrever SQL personalizado
    for (var usu in usuarios) {
      print(
        " id: " +
            usu['id'].toString() +
            " nome: " +
            usu['nome'] +
            " idade: " +
            usu['idade'].toString(),
      );
    }
  }

  /// Busca e lista um único usuário pelo seu [id].
  ///
  /// Usa o método [Database.query] com a cláusula WHERE para filtrar.
  _listarUmUsuario(int id) async {
    Database bd = await _recuperarBancoDados();
    List usuarios = await bd.query(
      "usuarios",
      columns: ["id", "nome", "idade"], // Colunas a retornar
      where: "id = ?", // Condição de filtro (? é o placeholder)
      whereArgs: [id], // Valor que substitui o placeholder
    );
    for (var usu in usuarios) {
      print(
        " id: " +
            usu['id'].toString() +
            " nome: " +
            usu['nome'] +
            " idade: " +
            usu['idade'].toString(),
      );
    }
  }

  /// Exclui usuários com nome e idade específicos do banco de dados.
  ///
  /// Demonstra o uso de múltiplas condições na cláusula WHERE.
  _excluirUsuario() async {
    Database bd = await _recuperarBancoDados();
    int retorno = await bd.delete(
      "usuarios",
      where: "nome = ? AND idade = ?", // Múltiplas condições com operador AND
      whereArgs: ["Raquel Ribeiro", 26],
    );
    print("Itens excluidos: " + retorno.toString());
  }

  /// Atualiza os dados de um usuário existente pelo seu [id].
  ///
  /// Substitui o nome e a idade do usuário com o id informado.
  _atualizarUsuario(int id) async {
    Database bd = await _recuperarBancoDados();
    // Novos dados a serem gravados no lugar dos antigos.
    Map<String, dynamic> dadosUsuario = {"nome": "Antonio Pedro", "idade": 35};
    int retorno = await bd.update(
      "usuarios",
      dadosUsuario,
      where: "id = ?", // Filtra pelo id para atualizar apenas um registro
      whereArgs: [id],
    );
    print("Itens atualizados: " + retorno.toString());
  }

  @override
  Widget build(BuildContext context) {
    // Controladores para obter o texto digitado nos campos de entrada.
    final TextEditingController _controllernome = TextEditingController();
    final TextEditingController _controlleridade = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text("Banco de dados")),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            // Campo para o usuário digitar o nome.
            TextField(
              decoration: const InputDecoration(labelText: "Digite o nome: "),
              controller: _controllernome,
            ),
            // Campo para o usuário digitar a idade.
            TextField(
              decoration: const InputDecoration(labelText: "Digite a idade: "),
              controller: _controlleridade,
            ),
            const SizedBox(height: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // Botão para salvar um novo usuário no banco.
                ElevatedButton(
                  child: const Text("Salvar um usuário"),
                  onPressed: () {
                    _salvarDados(
                      _controllernome.text,
                      int.parse(_controlleridade.text),
                    );
                  },
                ),
                // Botão para listar todos os usuários cadastrados.
                ElevatedButton(
                  child: const Text("Listar todos usuários"),
                  onPressed: () {
                    _listarUsuarios();
                  },
                ),
                // Botão para listar apenas o usuário com id=2.
                ElevatedButton(
                  child: const Text("Listar um usuário"),
                  onPressed: () {
                    _listarUmUsuario(2);
                  },
                ),
                // Botão para atualizar os dados do usuário com id=2.
                ElevatedButton(
                  child: const Text("Atualizar um usuário"),
                  onPressed: () {
                    _atualizarUsuario(2);
                  },
                ),
                // Botão para excluir o usuário com nome e idade fixos.
                ElevatedButton(
                  child: const Text("Excluir usuário"),
                  onPressed: () {
                    _excluirUsuario();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

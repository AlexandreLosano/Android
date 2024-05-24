import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart'; // Importe sua biblioteca para PostgreSQL aqui
import 'package:app_receitas_dev/database_queries.dart'; // Ajuste o caminho conforme necessário

class CadastrosGeraisPage extends StatefulWidget {
  const CadastrosGeraisPage({Key? key}) : super(key: key);

  @override
  _CadastrosGeraisPageState createState() => _CadastrosGeraisPageState();
}

class _CadastrosGeraisPageState extends State<CadastrosGeraisPage> {
  late List<Map<String, dynamic>> ingredientesData = []; // Dados dos ingredientes

  @override
  void initState() {
    super.initState();
    // Inicializa os dados ao abrir a página
    fetchIngredientes();
  }

  Future<void> fetchIngredientes() async {
    try {
      final connection = PostgreSQLConnection(
        'projetopessoal.cmf5fhdaoljl.sa-east-1.rds.amazonaws.com',
        5432,
        'postgres',
        username: 'losano',
        password: 'n149)M^[9BvekXG{H98h',
      );

      await connection.open();
      PostgreSQLResult result = await connection.query(DatabaseQueries.getIngredientes);

      List<Map<String, dynamic>> results = [];

      for (var row in result) {
        results.add({
          'id': row[0], // Substitua pelos índices das suas colunas ou pelos nomes das colunas
          'nome': row[1], // Substitua pelos índices das suas colunas ou pelos nomes das colunas
        });
      }

      await connection.close();

      setState(() {
        ingredientesData = results;
      });
    } catch (e) {
      print('Erro ao buscar ingredientes: $e');
      // Tratar o erro conforme necessário
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastros Gerais'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      fetchIngredientes(); // Chama a função para buscar os ingredientes
                    },
                    child: const Text('Ingredientes'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Medidas'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Tipo'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16), // Espaçamento entre os botões e o TextField
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Digite algo aqui...',
                ),
              ),
            ),
          ),
          SizedBox(height: 16), // Espaçamento entre o TextField e a tabela
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Nome')),
                ],
                rows: ingredientesData.map((data) => DataRow(
                  cells: [
                    DataCell(Text(data['id'].toString())),
                    DataCell(Text(data['nome'].toString())),
                  ],
                )).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(BancoApp());
}

class BancoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _transacoes = [];
  final _valorController = TextEditingController();
  final _descricaoController = TextEditingController();

  void _adicionarTransacao() {
    final valor = _valorController.text;
    final descricao = _descricaoController.text;

    if (valor.isEmpty || descricao.isEmpty) {
      return;
    }

    setState(() {
      _transacoes.add('$descricao: \$${valor}');
    });

    _valorController.clear();
    _descricaoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplicação Bancária'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: _valorController,
                    decoration: InputDecoration(labelText: 'Valor'),
                    keyboardType: TextInputType.number,
                  ),
                  TextField(
                    controller: _descricaoController,
                    decoration: InputDecoration(labelText: 'Descrição'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _adicionarTransacao,
                    child: Text('Adicionar Transação'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _transacoes.length,
              itemBuilder: (ctx, index) {
                return ListTile(
                  title: Text(_transacoes[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

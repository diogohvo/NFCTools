import 'package:flutter/material.dart';

class AfterRead extends StatelessWidget {
  const AfterRead({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.memory),
              title: Text('Tipo de tag:'),
              subtitle: Text('NXP - NTAG213'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.confirmation_number),
              title: Text('Serial Number'),
              subtitle: Text('04:61:E3:AA:07:AF:81'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.key),
              title: Text('Protegido por senha'),
              subtitle: Text('Não'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.storage),
              title: Text('Informação da Memória'),
              subtitle: Text('180 bytes: 45 páginas (4 bytes cada)'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.storage_rounded),
              title: Text('Tamanho'),
              subtitle: Text('4 / 137 bytes'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.replay_outlined),
              title: Text('Gravável'),
              subtitle: Text('Sim'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.content_paste_search),
              title: Text('Conteúdo'),
              subtitle: Text('Vazio'),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class OthersPage extends StatelessWidget {
  const OthersPage({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _dialogBuilder(context),
      child: const Column(
        children: <Widget>[
          Card(
            child: ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('Copiar tag'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.delete),
              title: Text('Apagar tag'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.data_usage),
              title: Text('Formatar memória'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.lock),
              title: Text('Bloquear tag'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.vpn_key),
              title: Text('Definir senha'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Escrever na tag NFC'),
          content: const Icon(Icons.nfc, size: 40),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

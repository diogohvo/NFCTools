import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

class WritePage extends StatelessWidget {
  const WritePage({
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
              leading: Icon(Icons.text_snippet),
              title: Text('Texto'),
              subtitle: Text('Adicionar Texto'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.add_link),
              title: Text('URL'),
              subtitle: Text('Adicionar URL'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.wifi),
              title: Text('Rede WiFi'),
              subtitle: Text('Adicionar Rede WiFi'),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.share_location),
              title: Text('Localização'),
              subtitle: Text('Adicionar Localização'),
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

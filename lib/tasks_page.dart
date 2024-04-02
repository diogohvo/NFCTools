import 'package:flutter/material.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({
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
              leading: Icon(Icons.settings_suggest),
              title: Text('Nova tarefa'),
              subtitle: Text('Adicionar nova tarefa'),
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

import 'package:flutter/material.dart';
import 'dart:convert';

class AfterRead extends StatelessWidget {
  final Map<String, dynamic> tagData;
  const AfterRead({
    super.key,
    required this.theme,
    required this.tagData,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final cachedMessage = tagData['ndef']['cachedMessage']['records'];
    return Center(
      child: Column(
        children: <Widget>[
          const Card(
            child: ListTile(
              leading: Icon(Icons.memory),
              title: Text('Tipo de tag:'),
              subtitle: Text('NXP - NTAG213'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.confirmation_number),
              title: const Text('Número de Série'),
              subtitle: Text(tagData['nfca']['identifier'].toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Tecnologias'),
              subtitle: Text(_getTechListString(tagData)),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.key),
              title: const Text('Tornar Leitura Apenas'),
              subtitle: Text(tagData['ndef']['canMakeReadOnly'].toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.storage_rounded),
              title: const Text('Tamanho'),
              subtitle: Text('${tagData['ndef']['maxSize']} bytes'),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.replay_outlined),
              title: const Text('Gravável'),
              subtitle: Text(tagData['ndef']['isWritable'].toString()),
            ),
          ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.content_paste_search),
              title: Text(
                  'Conteúdo: ${_getPayloadType(utf8.decode(cachedMessage[0]['type']))}'),
              subtitle: Text(utf8.decode(cachedMessage[0]['payload'])),
            ),
          ),
        ],
      ),
    );
  }

  String _getTechListString(Map<String, dynamic> tagData) {
    final techList = <String>[];
    if (tagData.containsKey('nfca')) techList.add('NfcA');
    if (tagData.containsKey('nfcb')) techList.add('NfcB');
    if (tagData.containsKey('nfcf')) techList.add('NfcF');
    if (tagData.containsKey('nfcv')) techList.add('NfcV');
    if (tagData.containsKey('isodep')) techList.add('IsoDep');
    if (tagData.containsKey('mifareclassic')) techList.add('MifareClassic');
    if (tagData.containsKey('mifareultralight')) {
      techList.add('MifareUltralight');
    }
    if (tagData.containsKey('ndef')) techList.add('Ndef');
    if (tagData.containsKey('ndefformatable')) techList.add('NdefFormatable');
    return techList.join(' / ');
  }

  String _getPayloadType(String encoded) {
    if (encoded == 'T') {
      return 'Texto';
    } else if (encoded == 'U') {
      return 'URL / Localização';
    }
    return encoded;
  }
}

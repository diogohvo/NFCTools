import 'package:flutter/material.dart';

class BeforeRead extends StatelessWidget {
  const BeforeRead({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.nfc, size: 40),
          const SizedBox(height: 22.0),
          Text(
            'Aproxime-se de um disp. NFC',
            style: theme.textTheme.titleLarge,
          ),
          const SizedBox(height: 90),
        ],
      ),
    );
  }
}

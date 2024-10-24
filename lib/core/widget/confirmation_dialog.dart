import 'package:flutter/material.dart';

class ConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String text;

  const ConfirmationDialog(
      {super.key, required this.onConfirm, required this.text});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Konfirmasi'),
      content: Text(text),
      actions: <Widget>[
        TextButton(
          child: const Text('Batal'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        ElevatedButton(
          onPressed: onConfirm,
          child: const Text('Tambah'),
        ),
      ],
    );
  }
}

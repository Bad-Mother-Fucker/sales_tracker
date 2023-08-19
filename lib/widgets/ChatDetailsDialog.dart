import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Utilities/Extensions.dart';

import '../model/chat.dart';

class ChatDetailsDialog extends StatelessWidget {
  final Chat chat;

  ChatDetailsDialog({required this.chat});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Chat Details'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            buildDetailRow('Nome Lead: ', chat.nomeLead),
            buildDetailRow('Piattaforma: ', chat.piattaforma),
            buildDetailRow('Data chat: ' , chat.data?.toDayMonthString()),
            buildDetailRow('Numero di Telefono: ', chat.numeroTelefono),
            buildDetailRow('Email: ', chat.email),
            buildDetailRow('Esito: ', chat.esito),
            buildDetailRow('Note: ', chat.note),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }

  Widget buildDetailRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
          Flexible(
            child: Text(value ?? "-", overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}

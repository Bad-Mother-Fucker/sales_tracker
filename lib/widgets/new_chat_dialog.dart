import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/Utilities/Extensions.dart';

import '../model/chat.dart';
import '../providers/chat_provider.dart';

class NewChatDialog extends StatefulWidget {
  @override
  _NewChatDialogState createState() => _NewChatDialogState();
}

class _NewChatDialogState extends State<NewChatDialog> {
  final TextEditingController nomeLeadController = TextEditingController();
  final TextEditingController piattaformaController = TextEditingController();
  final TextEditingController numeroTelefonoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  String? esito = ChatOutcome.CallBooked;
  String? piattaforma = ChatPlatform.Instagram;
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Chat'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            TextField(
              controller: nomeLeadController,
              decoration: InputDecoration(hintText: 'Nome Lead'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(hintText: 'email'),
            ),
            TextField(
              controller: numeroTelefonoController,
              decoration: InputDecoration(hintText: 'telefono'),
            ),

            DropdownButton<String>(
              value: piattaforma,
              hint: Text('Piattaforma'),
              onChanged: (String? value) {
                setState(() {
                  piattaforma = value;
                });
              },
              items: ChatPlatform.values.map((String e) {
                return DropdownMenuItem<String>(
                  value: e,
                  child: Text(e),
                );
              }).toList()
            ),

            ListTile(
              title: Text("Data: ${selectedDate.toDayMonthString()}"),
              trailing: Icon(Icons.calendar_today),
              onTap: () => _selectDate(context),
            ),

            DropdownButton<String>(
              value: esito,
              hint: Text('Scegli un esito'),
              onChanged: (String? value) {
                setState(() {
                  esito = value;
                });
              },
              items: ChatOutcome.values.map((String outcome) {
                return DropdownMenuItem<String>(
                  value: outcome,
                  child: Text(outcome),
                );
              }).toList(),
            ),
            TextField(
              controller: noteController,
              decoration: InputDecoration(hintText: 'Note'),
              style: TextStyle(color: Colors.grey), // Change text color
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('Add'),
          onPressed: () {
            Chat newChat = Chat(
              nomeLead: nomeLeadController.text,
              piattaforma: piattaforma.toString(),
              numeroTelefono: numeroTelefonoController.text,
              email: emailController.text,
              esito: esito,
              note: noteController.text,
              data: selectedDate, // Add the selected date
            );
            Provider.of<ChatProvider>(context, listen: false).addChat(newChat);
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

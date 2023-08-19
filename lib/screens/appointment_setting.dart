import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/model/Users/user.dart';
import 'package:sales_tracker/widgets/ChatAppBar.dart';
import 'package:sales_tracker/widgets/ChatDetailsDialog.dart';

import '../model/chat.dart';
import '../providers/chat_provider.dart';
import '../providers/user_provider.dart';
import '../Utilities/Extensions.dart';

class AppointmentSetterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Ottieni l'istanza del UserProvider
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;

    // Verifica se l'utente è un "Appointment Setter"
    final isAppointmentSetter = user?.role == UserRole.AppointmentSetter; // Adatta questa linea in base alla struttura del tuo oggetto User

    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer<ChatProvider>(
          builder: (context, chatProvider, child) {
            return ListView.builder(
              itemCount: chatProvider.filteredChats.length,
              itemBuilder: (context, index) {
                final chat = chatProvider.filteredChats[index];
                return ChatRowWidget(
                  chat: chat,
                  onActionsPressed: () {
                    // Logica per le azioni (ad esempio mostrare un dialogo o un menu)
                  },
                  onTap: () {
                    showDialog(context: context, builder: (context) {
                      return ChatDetailsDialog(chat: chat);
                    }
                    );
                  },
                );
              }
            );
          },
        );
      },
    );
  }
}

class ChatRowWidget extends StatelessWidget {
  final Chat chat;
  final VoidCallback onActionsPressed;
  final VoidCallback onTap;

  ChatRowWidget({required this.chat, required this.onActionsPressed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.nomeLead ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("${chat.numeroTelefono} | ${chat.email}", style: TextStyle(fontSize: 12.0, color: Colors.grey)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(chat.piattaforma ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(chat.data!.toDayMonthString(), style: TextStyle(fontSize: 10.0, color: Colors.grey)),
              ],
            ),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: onActionsPressed,
            ),
          ],
        ),
      ),
    );
  }
}


// Puoi creare la ChatDetailsPage per mostrare ulteriori dettagli sulla chat
class ChatDetailsPage extends StatelessWidget {
  final Chat chat;

  ChatDetailsPage({required this.chat});

  @override
  Widget build(BuildContext context) {
    // Implementa la logica per mostrare i dettagli della chat
    return Scaffold(
        appBar: AppBar(
          title: Text('Chat Details'),
        ),
        body: Container()// Contenuto della pagina
    );
  }
}
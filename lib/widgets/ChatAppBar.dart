import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/chat_provider.dart';
import '../screens/appointment_setting.dart';
import 'chat_filter_dialog.dart';
import 'new_chat_dialog.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChatProvider>(
      builder: (context, chatProvider, child) {
        return AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white, // Rende l'app bar bianca
          title: const Center(
            child: Text(
              "Chat",
              style: TextStyle(
                color: Colors.black, // Colore del testo nero per contrastare lo sfondo bianco
                fontSize: 34.0, // Dimensione del carattere molto grande
                fontWeight: FontWeight.bold, // Font in grassetto
              ),
            ),
          ),
          toolbarHeight: 100.0,
          elevation: 0.0, // Rimuove l'ombra sotto l'app bar
          actions: [
            IconButton(onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return NewChatDialog();
                },
              );
            }, icon: const Icon(Icons.add)
            ),
            IconButton(
              icon: Icon(Icons.filter_list),
              onPressed: () async {
                final result = await showDialog<Map<String, dynamic>>(
                  context: context,
                  builder: (context) => FilterDialog(),
                );

                if (result != null) {
                  // Utilizza i filtri selezionati dall'utente
                  // ...
                }
              },
            ),
          ],
        );
      },
    );
  }
}

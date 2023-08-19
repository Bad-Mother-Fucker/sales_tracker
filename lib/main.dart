import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/providers/chat_provider.dart';
import 'package:sales_tracker/providers/product_provider.dart';
import 'package:sales_tracker/providers/sales_call_provider.dart';
import 'package:sales_tracker/providers/user_provider.dart';
import 'package:sales_tracker/screens/appointment_setting.dart';
import 'package:sales_tracker/screens/sales_calls.dart';
import 'package:sales_tracker/widgets/ChatAppBar.dart';
import 'package:sales_tracker/widgets/dashboard_grid.dart';
import 'package:sales_tracker/widgets/filter_dashboard.dart';
import 'package:sales_tracker/widgets/new_chat_dialog.dart';
import 'package:sales_tracker/widgets/sales_call_app_bar.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
        ChangeNotifierProvider(create: (context) => ChatProvider()),
        ChangeNotifierProvider(create: (context) => SalesCallProvider()),
      ],
      child: MyApp(),
    ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF00A1E0), // Blue
        hintColor: Colors.grey, // White
        fontFamily: 'Roboto', // Puoi sostituire con 'Arial' o un altro font di sistema
      ),
      home: const HomePage(title: 'Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    DashboardGrid(), // Definito in precedenza
    AppointmentSetterPage(),     // Definisci questa pagina
    SalesCallsPage(), // Definisci questa pagina
  ];



  @override
  Widget build(BuildContext context) {
    var salesCallProvider = Provider.of<SalesCallProvider>(context);


    PreferredSizeWidget bar = AppBar(
      backgroundColor: Colors.white, // Rende l'app bar bianca
      iconTheme: const IconThemeData(color: Colors.black),
      toolbarHeight: 100.0,
      title: const Text(
        "Dashboard",
        style: TextStyle(
          color: Colors.black, // Colore del testo nero per contrastare lo sfondo bianco
          fontSize: 34.0, // Dimensione del carattere molto grande
          fontWeight: FontWeight.bold, // Font in grassetto
        ),
      ),
      elevation: 0.0,
      actions: [
        IconButton(onPressed: () {
          showDialog(context: context, builder: (context) {
            return FilterDashboardDialog();
          });
        },
            icon: const Icon(Icons.filter_list)
        )
      ],// Rimuove l'ombra sotto l'app bar
    );


    switch (_selectedIndex) {
      case 0:
        break;
      case 1:
        bar = ChatAppBar(); // Definisci questa funzione per ottenere le azioni per la pagina delle chat
        break;
      case 2:
        bar = SalesCallAppBar(); // Definisci questa funzione per ottenere le azioni per la pagina delle sales call
        break;
      default:
        break;
    }
    return Scaffold(
      appBar: bar,
      body: _pages[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Chats'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sales Calls'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
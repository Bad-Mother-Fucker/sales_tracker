import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_tracker/Utilities/Extensions.dart';
import 'package:sales_tracker/model/Users/user.dart';
import 'package:sales_tracker/widgets/sales_call_app_bar.dart';

import '../model/sales_call.dart';
import '../providers/product_provider.dart';
import '../providers/sales_call_provider.dart';
import '../providers/user_provider.dart';

class SalesCallsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user = userProvider.currentUser;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Consumer<SalesCallProvider>(
          builder: (context, salesCallProvider, child) {
            return ListView.builder(
                itemCount: salesCallProvider.salesCalls.length,
                itemBuilder: (context, index) {
                  final salesCall = salesCallProvider.salesCalls[index];
                  return SalesCallRowWidget(
                    salesCall: salesCall,
                    onActionsPressed: () {
                      // Logica per le azioni (ad esempio mostrare un dialogo o un menu)
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SalesCallDetailsPage(salesCall: salesCall)),
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

class SalesCallRowWidget extends StatelessWidget {
  final SalesCall salesCall;
  final VoidCallback onActionsPressed;
  final VoidCallback onTap;

  SalesCallRowWidget({required this.salesCall, required this.onActionsPressed, required this.onTap});

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
                Text(salesCall.nomeLead ?? "", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Revenue: ${salesCall.revenue} | Cash: ${salesCall.cash}", style: TextStyle(fontSize: 12.0, color: Colors.grey)),
              ],
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(salesCall.outcome.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                Text(salesCall.data!.toDayMonthString(), style: TextStyle(fontSize: 10.0, color: Colors.grey)),
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

class SalesCallDetailsPage extends StatelessWidget {
  final SalesCall salesCall;

  SalesCallDetailsPage({required this.salesCall});

  @override
  Widget build(BuildContext context) {
    // Implementa la logica per mostrare i dettagli della chiamata di vendita
    return Scaffold(
      appBar: AppBar(
        title: Text('Sales Call Details'),
      ),
      body: Container(), // Contenuto della pagina
    );
  }
}
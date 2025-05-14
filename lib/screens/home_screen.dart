import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/login_controller.dart';
import '../widget/custom_top_bar.dart';
import '../widget/notificationCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> notifications = List.generate(5, (index) {
    return {
      'sender': 'Risorsa ${index + 1}',
      'message': [
        'Consulta la guida rapida per i pulsanti personalizzati.',
        'Scopri come configurare i bottoni dinamici nei tuoi progetti.',
        'Leggi l’articolo sulle best practices per UI responsive.',
        'Nuovo aggiornamento: supporto per gesture avanzate!',
        'Aggiunta documentazione sulle animazioni nei custom button.'
      ][index],
    };
  });

  bool showNotificationBar = false;
  bool expanded = false;

  void removeNotification(int index) {
    setState(() {
      notifications.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context, listen: false);
    final screenHeight = MediaQuery.of(context).size.height;
    final maxNotificationHeight = screenHeight * 0.55; // adatta per restare sopra la bottom bar

    return Scaffold(
      appBar: CustomTopBar(
        showActions: true,
        onLogout: () => loginController.logout(context),
        onNotification: () {
          setState(() {
            showNotificationBar = !showNotificationBar;
            expanded = false;
          });
        },
      ),
      body: Stack(
        children: [
          const Center(
            child: Text(
              'Contenuto della schermata Home',
              style: TextStyle(fontSize: 24),
            ),
          ),
          if (showNotificationBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: expanded ? maxNotificationHeight : 180, // 170 + freccia
              child: Container(
                color: Colors.grey.shade100.withOpacity(0.95),
                child: Column(
                  children: [
                    Expanded(
                      child: !expanded
                          ? PageView.builder(
                        itemCount: notifications.length,
                        controller: PageController(viewportFraction: 0.95),
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                            child: NotificationCard(
                              sender: notif['sender']!,
                              message: notif['message']!,
                            ),
                          );
                        },
                      )
                          : ListView.builder(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
                            child: NotificationCard(
                              sender: notif['sender']!,
                              message: notif['message']!,
                              expanded: true,
                              onRemove: () => removeNotification(index),
                            ),
                          );
                        },
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                        size: 28,
                      ),
                      onPressed: () {
                        setState(() {
                          expanded = !expanded;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

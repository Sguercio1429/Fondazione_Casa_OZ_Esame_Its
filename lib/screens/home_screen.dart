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
  final List<Map<String, String>> notifications = List.generate(10, (index) {
    return {
      'sender': 'Mittente ${index + 1}',
      'message':
      'Questo è un messaggio dettagliato per la notifica numero ${index + 1}. Può riguardare vari temi come personalizzazione, accessibilità o supporto tecnico, ed essere più o meno lunga.',
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
    final maxNotificationHeight = screenHeight * 0.55; // limita lo spazio prima della bottombar

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
              height: expanded ? maxNotificationHeight : 180, // <- ridotta
              child: Container(
                color: Colors.grey.shade100.withOpacity(0.95),
                child: Column(
                  children: [
                    Expanded(
                      child: !expanded
                          ? PageView.builder(
                        itemCount: notifications.length,
                        controller: PageController(viewportFraction: 0.92),
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                            child: Container(
                              height: 170,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 6,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/icons/notification.png',
                                    width: 20,
                                    height: 20,
                                    color: const Color(0xFF009E3D),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          notif['sender']!,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                        ),
                                        const SizedBox(height: 4),
                                        Text(
                                          notif['message']!,
                                          style: const TextStyle(fontSize: 13),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      )
                          : ListView.builder(
                        padding: const EdgeInsets.only(top: 10, bottom: 0),
                        itemCount: notifications.length,
                        itemBuilder: (context, index) {
                          final notif = notifications[index];
                          return NotificationCard(
                            sender: notif['sender']!,
                            message: notif['message']!,
                            onClose: () => removeNotification(index),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10), // distanza ridotta
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

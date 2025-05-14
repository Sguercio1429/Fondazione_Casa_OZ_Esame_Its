import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/login_controller.dart';
import '../widget/custom_top_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> notifications = List.generate(10, (index) {
    return {
      'sender': 'Mittente ${index + 1}',
      'message': 'Questo è il messaggio della notifica numero ${index + 1}.'
    };
  });

  bool showNotificationBar = false;

  @override
  Widget build(BuildContext context) {
    final loginController = Provider.of<LoginController>(context, listen: false);

    return Scaffold(
      appBar: CustomTopBar(
        showActions: true,
        onLogout: () => loginController.logout(context),
        onNotification: () {
          setState(() {
            showNotificationBar = !showNotificationBar;
          });
        },
      ),
      body: Column(
        children: [
          // NOTIFICATION DRAWER
          if (showNotificationBar)
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.grey.shade300,
              child: PageView.builder(
                itemCount: notifications.length,
                controller: PageController(viewportFraction: 0.95),
                itemBuilder: (context, index) {
                  final notif = notifications[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            '${notif['sender']!}: ',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Text(
                              notif['message']!,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

          // MAIN BODY
          const Expanded(
            child: Center(
              child: Text(
                'Contenuto della schermata Home',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controller/bottom_nav_controller.dart';
import 'widget/bottom_nav_bar.dart';
import 'screens/home_screen.dart';
import 'screens/resources_screen.dart';
import 'screens/channels_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BottomNavController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final List<Widget> screens = [
    HomeScreen(),
    ResourcesScreen(),
    ChannelsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavController>(context);

    return Scaffold(
      body: screens[controller.selectedIndex],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

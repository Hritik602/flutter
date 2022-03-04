import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  FlutterLocalNotificationsPlugin localNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    super.initState();
    var androidInitializeSetting =
        const AndroidInitializationSettings("@mipmap/ic_launcher");

    var initializeSetting =
        InitializationSettings(android: androidInitializeSetting);

    localNotificationsPlugin.initialize(initializeSetting);
  }

  showNotification() async {
    var androidNotificationDetails = const AndroidNotificationDetails(
        "channelId", "channelName",
        priority: Priority.high, importance: Importance.high);
    var platform = NotificationDetails(android: androidNotificationDetails);
    await localNotificationsPlugin.show(
        0, "Hello", "Have a nice day.", platform);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Welcome to Home Screen",
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ElevatedButton(
            onPressed: () {
              print("clicked");
              showNotification();
            },
            child: const Text("Click Me"))
      ],
    )));
  }
}

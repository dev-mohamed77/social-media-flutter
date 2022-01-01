import 'package:flutter/material.dart';
import 'package:socailmedia/features/notifications/presentation/pages/widgets/notifications_body.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(),
      body: NotificationsBody(),
    );
  }
}

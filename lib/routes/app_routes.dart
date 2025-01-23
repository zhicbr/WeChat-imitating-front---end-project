import 'package:flutter/material.dart';
import 'package:my_first_app/features/chat/chat_detail_page.dart';
import 'package:my_first_app/features/contacts/contact_detail_page.dart';
import 'package:my_first_app/models/message.dart';
import 'package:my_first_app/models/contact.dart';

class AppRoutes {
  static const String chatDetail = '/chat-detail';
  static const String contactDetail = '/contact-detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chatDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChatDetailPage(
            contactName: args['contactName'],
            messages: args['messages'],
          ),
        );
      case contactDetail:
        final contact = settings.arguments as Contact;
        return MaterialPageRoute(
          builder: (_) => ContactDetailPage(contact: contact),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

import 'package:flutter/material.dart';
import 'package:my_first_app/features/chat/chat_detail_page.dart';
import 'package:my_first_app/features/contacts/contact_detail_page.dart';
import 'package:my_first_app/features/contacts/contacts_page.dart';
import 'package:my_first_app/features/profile/profile_detail_page.dart';
import 'package:my_first_app/services/profile_service.dart';
import 'package:my_first_app/models/message.dart';
import 'package:my_first_app/models/contact.dart';

class AppRoutes {
  static const String chatDetail = '/chat-detail';
  static const String contactDetail = '/contact-detail';
  static const String profileDetail = '/profile-detail';
  static const String contacts = '/contacts';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case chatDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ChatDetailPage(
            contactName: args['contactName'] as String,
            messages: (args['messages'] as List).cast<Message>(),
          ),
        );
      case contactDetail:
        final contact = settings.arguments as Contact;
        return MaterialPageRoute(
          builder: (context) => ContactDetailPage(contact: contact),
        );
      case profileDetail:
        return MaterialPageRoute(
          builder: (context) => ProfileDetailPage(profile: ProfileService.currentUser),
        );
      case contacts:
        return MaterialPageRoute(
          builder: (context) => ContactsPage(contacts: settings.arguments as List<Contact>),
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

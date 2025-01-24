import 'package:flutter/material.dart';
import 'package:my_first_app/models/contact.dart';
import 'package:my_first_app/routes/app_routes.dart';

class ContactsPage extends StatelessWidget {
  final List<Contact> contacts;

  const ContactsPage({Key? key, required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人列表'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact.avatarUrl),
            ),
            title: Text(contact.name),
            onTap: () {
              Navigator.of(context).pushNamed(
                AppRoutes.contactDetail,
                arguments: contact,
              );
            },
          );
        },
      ),
    );
  }
}

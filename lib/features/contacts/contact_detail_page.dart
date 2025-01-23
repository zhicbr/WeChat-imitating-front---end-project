import 'package:flutter/material.dart';
import 'package:my_first_app/models/contact.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailPage({required this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人详情'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(contact.avatarUrl),
                radius: 50,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '姓名: ${contact.name}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            if (contact.description != null)
              Text(
                '描述: ${contact.description}',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 8),
            if (contact.phone != null)
              Text(
                '电话: ${contact.phone}',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 8),
            if (contact.email != null)
              Text(
                '邮箱: ${contact.email}',
                style: TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_first_app/models/contact.dart';
import 'package:my_first_app/models/message.dart';
import 'package:my_first_app/routes/app_routes.dart';

class ContactDetailPage extends StatelessWidget {
  final Contact contact;

  const ContactDetailPage({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('联系人详情'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage(contact.avatarUrl),
            ),
            SizedBox(height: 20),
            Text(
              contact.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            if (contact.phone != null)
              Text(
                contact.phone!,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
            SizedBox(height: 20),
            Divider(),
            if (contact.email != null)
              ListTile(
                leading: Icon(Icons.email),
                title: Text(contact.email!),
              ),
            if (contact.description != null)
              ListTile(
                leading: Icon(Icons.info_outline),
                title: Text(contact.description!),
              ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      AppRoutes.chatDetail,
                      arguments: {
                        'contactName': contact.name,
                        'messages': <Message>[],
                      },
                    );
                  },
                  icon: Icon(Icons.message),
                  label: Text('发消息'),
                ),
                ElevatedButton.icon(
                  onPressed: () async {
                    final Uri phoneUri = Uri(scheme: 'tel', path: contact.phone);
                    if (await canLaunchUrl(phoneUri)) {
                      await launchUrl(phoneUri);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('无法拨打电话')),
                      );
                    }
                  },
                  icon: Icon(Icons.call),
                  label: Text('拨打电话'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

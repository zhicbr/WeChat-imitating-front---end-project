import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String avatarUrl;
  final String? description;
  final VoidCallback? onTap;

  const ContactItem({
    required this.name,
    required this.avatarUrl,
    this.description,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
      ),
      title: Text(name),
      subtitle: description != null ? Text(description!) : null,
      onTap: onTap,
      trailing: Icon(Icons.chevron_right),
    );
  }
}

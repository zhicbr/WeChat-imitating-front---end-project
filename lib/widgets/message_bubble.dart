import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isMe;
  final String username;
  final String userImage;
  final bool showName;

  const MessageBubble({
    required this.message,
    required this.isMe,
    required this.username,
    required this.userImage,
    this.showName = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe && showName)
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(userImage),
                radius: 12,
              ),
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 14,
            ),
            decoration: BoxDecoration(
              color: isMe 
                  ? Colors.green[100]
                  : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(isMe ? 12 : 0),
                topRight: Radius.circular(isMe ? 0 : 12),
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showName && !isMe)
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      username,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                Text(
                  message,
                  style: TextStyle(
                    color: isMe ? Colors.black : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

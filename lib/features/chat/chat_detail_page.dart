import 'package:flutter/material.dart';
import 'package:my_first_app/models/message.dart';
import 'package:my_first_app/widgets/message_bubble.dart';

class ChatDetailPage extends StatefulWidget {
  final String contactName;
  final List<Message> messages;

  const ChatDetailPage({
    required this.contactName,
    required this.messages,
  });

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    _messages = widget.messages;
    // Scroll to bottom when first loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    final newMessage = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'user1',
      receiverId: widget.contactName,
      content: _controller.text,
      timestamp: DateTime.now(),
    );

    setState(() {
      _messages.add(newMessage);
      _controller.clear();
    });

    // Scroll to bottom after sending message
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.contactName),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: EdgeInsets.all(8),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message.senderId == 'user1';
                final showName = index == 0 || 
                    _messages[index - 1].senderId != message.senderId;
                
                return Column(
                  crossAxisAlignment: isMe 
                      ? CrossAxisAlignment.end 
                      : CrossAxisAlignment.start,
                  children: [
                    if (showName && !isMe)
                      Padding(
                        padding: EdgeInsets.only(left: 8, bottom: 4),
                        child: Text(
                          widget.contactName,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    MessageBubble(
                      message: message.content,
                      isMe: isMe,
                      username: isMe ? '我' : widget.contactName,
                      userImage: 'https://placekitten.com/50/50',
                      showName: showName,
                    ),
                    if (index < _messages.length - 1 && 
                        _messages[index + 1].senderId != message.senderId)
                      SizedBox(height: 8),
                  ],
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: '输入消息...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                    maxLines: 3,
                    minLines: 1,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  color: Colors.green,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

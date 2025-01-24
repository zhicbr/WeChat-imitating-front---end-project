import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:my_first_app/widgets/message_bubble.dart';
import 'package:my_first_app/routes/app_routes.dart';
import 'package:my_first_app/models/message.dart';
import 'package:my_first_app/models/contact.dart';
import 'package:my_first_app/features/me/me_page.dart';

void main() => runApp(WeChatApp());

class WeChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '仿微信',
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      onGenerateRoute: AppRoutes.generateRoute,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ChatListPage(),
    ContactPage(),
    DiscoverPage(),
    MePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '微信',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: '发现',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我',
          ),
        ],
      ),
    );
  }
}

class ChatListPage extends StatefulWidget {
  @override
  _ChatListPageState createState() => _ChatListPageState();
}

class _ChatListPageState extends State<ChatListPage> {
  List<Chat> chats = [
    Chat(
      name: '张三',
      messages: [
        Message(
          id: '1',
          senderId: 'user1',
          receiverId: 'user2',
          content: '你好呀！',
          timestamp: DateTime.now().subtract(Duration(minutes: 20)),
        ),
        Message(
          id: '2',
          senderId: 'user1',
          receiverId: 'user2',
          content: '最近怎么样？',
          timestamp: DateTime.now().subtract(Duration(minutes: 19)),
        ),
        Message(
          id: '3',
          senderId: 'user2',
          receiverId: 'user1',
          content: '还不错，你呢？',
          timestamp: DateTime.now().subtract(Duration(minutes: 18)),
        ),
        Message(
          id: '4',
          senderId: 'user1',
          receiverId: 'user2',
          content: '我也挺好的',
          timestamp: DateTime.now().subtract(Duration(minutes: 17)),
        ),
        Message(
          id: '5',
          senderId: 'user1',
          receiverId: 'user2',
          content: '周末有空吗？',
          timestamp: DateTime.now().subtract(Duration(minutes: 16)),
        ),
        Message(
          id: '6',
          senderId: 'user2',
          receiverId: 'user1',
          content: '有空啊，怎么了？',
          timestamp: DateTime.now().subtract(Duration(minutes: 15)),
        ),
        Message(
          id: '7',
          senderId: 'user1',
          receiverId: 'user2',
          content: '要不要一起吃饭？',
          timestamp: DateTime.now().subtract(Duration(minutes: 14)),
        ),
        Message(
          id: '8',
          senderId: 'user1',
          receiverId: 'user2',
          content: '我找到一家不错的餐厅',
          timestamp: DateTime.now().subtract(Duration(minutes: 13)),
        ),
        Message(
          id: '9',
          senderId: 'user2',
          receiverId: 'user1',
          content: '好啊，什么时候？',
          timestamp: DateTime.now().subtract(Duration(minutes: 12)),
        ),
        Message(
          id: '10',
          senderId: 'user1',
          receiverId: 'user2',
          content: '周六晚上7点怎么样？',
          timestamp: DateTime.now().subtract(Duration(minutes: 11)),
        ),
        Message(
          id: '11',
          senderId: 'user2',
          receiverId: 'user1',
          content: '可以，我记下了',
          timestamp: DateTime.now().subtract(Duration(minutes: 10)),
        ),
        Message(
          id: '12',
          senderId: 'user1',
          receiverId: 'user2',
          content: '别忘了带伞，可能会下雨',
          timestamp: DateTime.now().subtract(Duration(minutes: 9)),
        ),
        Message(
          id: '13',
          senderId: 'user2',
          receiverId: 'user1',
          content: '好的，谢谢提醒',
          timestamp: DateTime.now().subtract(Duration(minutes: 8)),
        ),
      ],
    ),
  ];

  void addChat(Chat newChat) {
    setState(() {
      if (!chats.any((chat) => chat.name == newChat.name)) {
        chats.add(newChat);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('微信'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          PopupMenuButton(itemBuilder: (context) => []),
        ],
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(chat.avatarUrl),
            ),
            title: Text(chat.name),
            subtitle: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.lastMessageTimeString,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                if (chat.unread)
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.chatDetail,
                arguments: {
                  'contactName': chat.name,
                  'messages': chat.messages,
                },
              );
            },
          );
        },
      ),
    );
  }
}

class Chat {
  final String name;
  final String avatarUrl;
  final List<Message> messages;
  final DateTime lastMessageTime;
  final bool unread;

  Chat({
    required this.name,
    required this.messages,
    this.avatarUrl = 'https://placekitten.com/50/50',
    this.unread = false,
  }) : lastMessageTime = messages.last.timestamp;

  String get lastMessage => messages.last.content;
  String get lastMessageTimeString {
    final now = DateTime.now();
    final diff = now.difference(lastMessageTime);
    
    if (diff.inDays > 7) {
      return '${lastMessageTime.year}-${lastMessageTime.month}-${lastMessageTime.day}';
    } else if (diff.inDays > 0) {
      return '${diff.inDays}天前';
    } else if (diff.inHours > 0) {
      return '${diff.inHours}小时前';
    } else if (diff.inMinutes > 0) {
      return '${diff.inMinutes}分钟前';
    }
    return '刚刚';
  }
}

class ContactPage extends StatefulWidget {
  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final List<Contact> contacts = [
    Contact(
      id: '1',
      name: '张三',
      phone: '13800138000',
      email: 'zhangsan@example.com',
      avatarUrl: 'https://placekitten.com/200/200',
      description: '好友',
    ),
    Contact(
      id: '2',
      name: '李四',
      phone: '13800138001',
      email: 'lisi@example.com',
      avatarUrl: 'https://placekitten.com/201/201',
      description: '同事',
    ),
    Contact(
      id: '3',
      name: '王五',
      phone: '13800138002',
      email: 'wangwu@example.com',
      avatarUrl: 'https://placekitten.com/202/202',
      description: '同学',
    ),
    Contact(
      id: '4',
      name: '赵六',
      phone: '13800138003',
      email: 'zhaoliu@example.com',
      avatarUrl: 'https://placekitten.com/203/203',
      description: '家人',
    ),
    Contact(
      id: '5',
      name: '陈七',
      phone: '13800138004',
      email: 'chenqi@example.com',
      avatarUrl: 'https://placekitten.com/204/204',
      description: '朋友',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('通讯录'),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.person_add), onPressed: () {}),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.group, color: Colors.grey),
            title: Text('新的朋友'),
          ),
          ListTile(
            leading: Icon(Icons.group, color: Colors.grey),
            title: Text('群聊'),
          ),
          ...contacts.map((contact) => ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(contact.avatarUrl),
            ),
            title: Text(contact.name),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ContactDetailPage(
                    contact: contact,
                    onMessage: (contact) {
                      final chatListState = context.findAncestorStateOfType<_ChatListPageState>();
                      chatListState?.addChat(Chat(
                        name: contact.name,
                        messages: [],
                        avatarUrl: contact.avatarUrl,
                      ));
                      Navigator.of(context).pushNamed(
                        AppRoutes.chatDetail,
                        arguments: {
                          'contactName': contact.name,
                          'messages': [],
                        },
                      );
                    },
                  ),
                ),
              );
            },
          )),
        ],
      ),
    );
  }
}

class ContactDetailPage extends StatelessWidget {
  final Contact contact;
  final Function(Contact)? onMessage;

  const ContactDetailPage({
    Key? key,
    required this.contact,
    this.onMessage,
  }) : super(key: key);

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
                    onMessage?.call(contact);
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

class DiscoverPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('发现')),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.camera_alt, color: Colors.green),
            title: Text('朋友圈'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.qr_code, color: Colors.green),
            title: Text('扫一扫'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Colors.green),
            title: Text('购物'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.games, color: Colors.green),
            title: Text('游戏'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:my_first_app/widgets/message_bubble.dart';
import 'package:my_first_app/routes/app_routes.dart';
import 'package:my_first_app/models/message.dart';

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
    ProfilePage(),
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

class ChatListPage extends StatelessWidget {
  final List<Chat> chats = [
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
    Chat(
      name: '李四',
      messages: List.generate(20, (index) => Message(
        id: '${index + 21}',
        senderId: index.isEven ? 'user1' : 'user3',
        receiverId: index.isEven ? 'user3' : 'user1',
        content: _generateMessageContent(index),
        timestamp: DateTime.now().subtract(Duration(hours: 20 - index)),
      )),
    ),
    Chat(
      name: '工作群',
      messages: List.generate(20, (index) => Message(
        id: '${index + 41}',
        senderId: index.isEven ? 'user1' : 'user4',
        receiverId: 'group1',
        content: _generateWorkMessageContent(index),
        timestamp: DateTime.now().subtract(Duration(days: 20 - index)),
      )),
    ),
  ];

  static String _generateMessageContent(int index) {
    final messages = [
      '你好呀！',
      '最近怎么样？',
      '周末有空吗？',
      '要不要一起吃饭？',
      '我找到一家不错的餐厅',
      '好啊，什么时候？',
      '周六晚上7点怎么样？',
      '可以，我记下了',
      '别忘了带伞，可能会下雨',
      '好的，谢谢提醒',
      '你到哪了？',
      '马上到，5分钟',
      '我看到你了',
      '这边这边！',
      '今天玩得真开心',
      '是啊，下次再约',
      '晚安',
      '早点休息',
      '明天见',
      '👋'
    ];
    return messages[index % messages.length];
  }

  static String _generateWorkMessageContent(int index) {
    final messages = [
      '项目文档已更新',
      '收到，谢谢通知',
      '新版本什么时候发布？',
      '预计周五发布',
      '需要我准备发布说明吗？',
      '是的，麻烦准备一下',
      '好的，明天上午发给你',
      '测试环境准备好了吗？',
      '已经准备好了',
      '好的，那我开始测试',
      '发现了一个bug',
      '具体是什么问题？',
      '页面加载时崩溃',
      '我看看日志',
      '找到了，是空指针异常',
      '修复好了，重新部署一下',
      '部署完成',
      '测试通过',
      '可以发布了',
      '发布成功'
    ];
    return messages[index % messages.length];
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

class ContactPage extends StatelessWidget {
  final List<String> contacts = [
    '张三', '李四', '王五', '赵六', '陈七'
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
              backgroundImage: NetworkImage('https://placekitten.com/50/50'),
            ),
            title: Text(contact),
          )),
        ],
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

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我')),
      body: ListView(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage('https://placekitten.com/100/100'),
            ),
            title: Text('用户名'),
            subtitle: Text('微信号: user123'),
            trailing: Icon(Icons.qr_code),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.wallet, color: Colors.green),
            title: Text('支付'),
            trailing: Icon(Icons.chevron_right),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.collections, color: Colors.green),
            title: Text('收藏'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.green),
            title: Text('相册'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.green),
            title: Text('设置'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}

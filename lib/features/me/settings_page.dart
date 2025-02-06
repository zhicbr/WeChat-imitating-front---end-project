import 'package:flutter/material.dart';
import 'profile_page.dart'; // 添加这一行

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200], // 设置背景为浅灰色
        child: ListView(
          children: [
            ListTile(
              title: Text('个人资料', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()), // 导航到个人资料页面
                );
              },
            ),
            Divider(),
            ListTile(
              title: Text('账号安全', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到账号安全页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('青少年模式', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到青少年模式页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('关怀模式', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到关怀模式页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('新消息通知', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到新消息通知页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('聊天', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到聊天设置页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('通用', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到通用设置页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('隐私', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到隐私设置页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('插件', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到插件设置页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('关于微信', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到关于微信页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('帮助与反馈', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到帮助与反馈页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('切换账号', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 导航到切换账号页面
              },
            ),
            Divider(),
            ListTile(
              title: Text('退出', style: TextStyle(color: Colors.black)),
              trailing: Icon(Icons.chevron_right, color: Colors.grey),
              onTap: () {
                // TODO: 处理退出逻辑
              },
            ),
          ],
        ),
      ),
    );
  }
}

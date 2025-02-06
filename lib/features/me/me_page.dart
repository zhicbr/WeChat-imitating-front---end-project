import 'package:flutter/material.dart';
import 'package:my_first_app/routes/app_routes.dart';
import 'settings_page.dart'; // 添加这一行
import 'package:my_first_app/services/profile_service.dart';

class MePage extends StatelessWidget {
  const MePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profile = ProfileService.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('我'),
      ),
      body: ListView(
        children: [
          // 个人信息卡片
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.profileDetail);
            },
            child: Container(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(profile.avatar),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          profile.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '微信号: ${profile.wxId}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.chevron_right),
                ],
              ),
            ),
          ),
          Divider(height: 1),
          
          // 其他设置项
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()), // 导航到设置页面
              );
            },
          ),
        ],
      ),
    );
  }
}

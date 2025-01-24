import 'package:flutter/material.dart';
import 'package:my_first_app/models/profile.dart';

class ProfileDetailPage extends StatelessWidget {
  final Profile profile;

  const ProfileDetailPage({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息'),
      ),
      body: ListView(
        children: [
          _buildAvatarSection(),
          _buildInfoSection(),
        ],
      ),
    );
  }

  Widget _buildAvatarSection() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(profile.avatar),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text('微信号: ${profile.wxId}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      children: [
        ListTile(
          title: Text('地区'),
          trailing: Text(profile.region),
        ),
        Divider(),
        ListTile(
          title: Text('个性签名'),
          trailing: Text(profile.signature),
        ),
      ],
    );
  }
}

import 'package:my_first_app/models/profile.dart';

class ProfileService {
  // 模拟用户个人信息
  static final Profile currentUser = Profile(
    id: 'user1',
    name: '张三',
    avatar: 'https://placekitten.com/200/200',
    wxId: 'zhangsan123',
    region: '广东 深圳',
    signature: '生活就像一盒巧克力',
  );

  // 获取当前用户信息
  Future<Profile> getCurrentProfile() async {
    // 模拟网络请求延迟
    await Future.delayed(Duration(milliseconds: 500));
    return currentUser;
  }

  // 更新用户信息
  Future<void> updateProfile(Profile profile) async {
    // 模拟网络请求延迟
    await Future.delayed(Duration(milliseconds: 500));
    // TODO: 实现实际的更新逻辑
  }
}

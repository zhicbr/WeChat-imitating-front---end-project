import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_app/main.dart'; // 确保导入路径正确

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // 将原本的 MyApp() 修改为 WeChatApp()
    await tester.pumpWidget(WeChatApp());

    // 原始测试逻辑保持不变（但需要根据实际UI调整）
    expect(find.text('微信'), findsOneWidget);
    expect(find.text('通讯录'), findsNothing);
  });
}
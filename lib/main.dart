import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

void main() {
  // WidgetBindの初期化
  // 呼び出さないとアプリの設定を行えない
  WidgetsFlutterBinding.ensureInitialized();

  // 画面の向き指定
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeRight, // 横固定
  ]);

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

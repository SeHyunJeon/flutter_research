import 'package:flutter/material.dart';

// 'android/app/build.gradle'

void main() {
  /// Flutter App을 실행한다.
  runApp(
    /// materialApp은 항상 최상위에 위치한다.
    /// Scaffold는 바로 아래에 위치한다.
    /// 상기 두 개는 반드시 고정적
    /// 위젯 -> Widget (화면에 보여주는 요소를 위젯이라고 부름)
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Text('Hello World!', style: TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );
}

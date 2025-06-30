import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                /// 배경 색상
                backgroundColor: Colors.red,
                disabledBackgroundColor: Colors.grey,
                disabledForegroundColor: Colors.red,

                /// 배경 위에 색상 (글자 색상 및 스플래시 색상)
                foregroundColor: Colors.white,
                shadowColor: Colors.green,
                elevation: 10.0,
                // 얼마나 올릴 지
                textStyle: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                ),
                padding: EdgeInsets.all(32.0),
                side: BorderSide(color: Colors.black, width: 12.0),
                // minimumSize: Size(300, 400),
                // maximumSize: Size(100, 150),
                // fixedSize: Size(100,150),
              ),
              child: Text('Elevated Button'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.red,
                shadowColor: Colors.black,
                elevation: 10.0,
              ),
              child: Text('Outlined Button'),
            ),
            TextButton(onPressed: () {}, child: Text('Text Button')),
          ],
        ),
      ),
    );
  }
}

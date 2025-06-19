import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // 100~900, 500이 기본값
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width, // 현재 실행 중인 앱의 사이즈
          child: Column(
            children: [
              _Top(),
              _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  const _Top({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        child: Column(
          children: [
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text(
              '우리 처음 만난 날',
              style: textTheme.bodyLarge,
            ),
            Text(
              '2025.02.09',
              style: textTheme.bodyMedium,
            ),
            IconButton(
              iconSize: 60.0,
              color: Colors.red[400],
              onPressed: () {},
              icon: Icon(Icons.favorite),
            ),
            Text(
              'D+1',
              style: textTheme.displayMedium,
            ),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child: Container(
        child: Image.asset('asset/img/middle_image.png'),
      ),
    );
  }
}


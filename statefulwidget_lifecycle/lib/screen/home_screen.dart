import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool show = false;
  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 중괄호 안에서만 사용 가능한 문법
            /// 다음에 오는 위젯 하나가 보일 지 말 지 설정 가능한 문법임
            if (show) GestureDetector(
              onTap: (){
                setState(() {
                  color = (color == Colors.red ? Colors.blue : Colors.red);
                });
              },
              child: CodeFactoryWidget(
                color: color,
              ),
            ),

            SizedBox(height: 32.0),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  show = !show;
                });
              },
              child: Text('클릭해서 보이기/안보이기'),
            ),
          ],
        ),
      ),
    );
  }
}

class CodeFactoryWidget extends StatefulWidget {
  final Color color;

  CodeFactoryWidget( {
    super.key,
    required this.color,
  }) {
    print('1) Stateful Widget Constructor');
  }

  @override
  State<CodeFactoryWidget> createState() {
    print('2) Stateful Widget Create State');

    return _CodeFactoryWidgetState();
  }
}

class _CodeFactoryWidgetState extends State<CodeFactoryWidget> {

  @override
  void initState() {
    print('3) Stateful Widget initState');
    super.initState(); // 부모의 initState 함수 호출
  }

  @override
  void didChangeDependencies() {
    print('4) Stateful Widget didChangeDependencies');
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print('5) Stateful Widget build');
    return Container(
        width: 50.0,
        height: 50.0,
        color: widget.color,
    );
  }

  @override
  void deactivate() {
    print('6) Stateful Widget deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    print('7) Stateful Widget dispose');
    super.dispose();
  }
}

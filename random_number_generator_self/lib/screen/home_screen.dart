import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text('랜덤숫자 생성기', style: textTheme.bodyLarge),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.settings, color: Colors.red[400]),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('123'), Text('456'), Text('789')],
              ),
            ),
          ),
          SizedBox(
            height: 90.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 30,
                  child: FilledButton(
                    onPressed: () {},
                    child: Text('생성하기!'),
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.red[400]),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

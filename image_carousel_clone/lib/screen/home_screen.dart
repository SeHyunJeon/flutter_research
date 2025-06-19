import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    _timer = Timer.periodic(Duration(milliseconds: 2000), (timer){
        int currentPage = _pageController.page!.toInt();
        int nextPage = currentPage + 1;

        if(nextPage > 4) {
          nextPage = 0;
        }

        _pageController.animateToPage(nextPage, duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    if(_timer != null) {
      _timer!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [1,2,3,4,5].map((e)=>Image.asset(
            fit: BoxFit.cover,
            'asset/img/image_$e.jpeg',
          ),
        ).toList(),
      ),
    );
  }
}

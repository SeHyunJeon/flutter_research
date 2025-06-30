import 'package:flutter/material.dart';
import 'package:navigation/layout/default_layout.dart';

class RouteTwoScreen extends StatelessWidget {
  const RouteTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments;

    return DefaultLayout(
      title: 'RouteTwoScreen',
      children: [
        Text(arguments.toString(), textAlign: TextAlign.center),
        OutlinedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Pop'),
        ),
      ],
    );
  }
}

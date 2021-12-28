import 'package:flutter/material.dart';

class ContentManagementPage extends StatelessWidget {
  const ContentManagementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 26, horizontal: 40),
        child: Text('Content Management'),
      ),
    );
  }
}

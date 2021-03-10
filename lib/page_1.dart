import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'list_item.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff15161A),
      body: Container(
          padding: EdgeInsets.all(24),
          child: Center(child: ListItem()))
    );
  }
}

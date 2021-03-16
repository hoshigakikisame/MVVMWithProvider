import 'package:flutter/material.dart';
import 'package:mvvm_provider/views/main_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'MY App', home: HalamanUtama());
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes/pages/shoe_page.dart';

import 'models/shoe_model.dart';

void main() {
  return runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => new ShoeModel())],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: ShoePage());
  }
}

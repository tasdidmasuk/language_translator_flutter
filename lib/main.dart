import 'package:flutter/material.dart';
import 'package:language_translator_flutter/pages/language_translator.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LanguageTranslator(),
    );
  }
}

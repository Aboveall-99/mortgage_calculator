import 'package:flutter/material.dart';
import 'input_page.dart';



void main() {
  runApp(MortgageCalculator());
}


class MortgageCalculator extends StatelessWidget {
  const MortgageCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(50, 62, 242, 1)
        )
      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,

    );
  }
}


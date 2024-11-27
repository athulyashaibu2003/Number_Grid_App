import 'package:flutter/material.dart';

class NumberGridScreen extends StatefulWidget {
  @override
  _NumberGridScreenState createState() => _NumberGridScreenState();
}

class _NumberGridScreenState extends State<NumberGridScreen> {
  String selectedRule = 'Odd Numbers';
  List<int> numbers = List.generate(100, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(     
        title: Text('Number Grid'),
        actions: [
          DropdownButton<String>(
            value: selectedRule,
            items:
                [
                  'Odd Numbers',
                  'Even Numbers',
                  'Prime Numbers',
                  'Fibonacci Numbers',
                ].map((rule) {
                  return DropdownMenuItem(value: rule, child: Text(rule));
                }).toList(),
            onChanged: (rule) {
              setState(() {
                selectedRule = rule!;
              });
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 10,
        ),
        itemCount: numbers.length,
        itemBuilder: (context, index) {
          final number = numbers[index];
          final isHighlighted = isNumberHighlighted(number);
          return Container(
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: isHighlighted ? Colors.blue : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                '$number',
                style: TextStyle(
                  color: isHighlighted ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  bool isNumberHighlighted(int number) {
    switch (selectedRule) {
      case 'Odd Numbers':
        return number % 2 != 0;
      case 'Even Numbers':
        return number % 2 == 0;
      case 'Prime Numbers':
        return isPrime(number);
      case 'Fibonacci Numbers':
        return isFibonacci(number);
      default:
        return false;
    }
  }

  bool isPrime(int number) {
    if (number < 2) return false;
    for (int i = 2; i <= number ~/ 2; i++) {
      if (number % i == 0) return false;
    }
    return true;
  }

  bool isFibonacci(int number) {
    int a = 0, b = 1;
    while (b < number) {
      int temp = b;
      b = a + b;
      a = temp;
    }
    return b == number;
  }
}

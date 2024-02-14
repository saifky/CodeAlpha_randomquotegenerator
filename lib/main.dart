import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Quote Generator',
      theme: ThemeData.dark(),
      home: QuotePage(),
    );
  }
}

class QuotePage extends StatefulWidget {
  @override
  _QuotePageState createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String _currentQuote = "Click below to get a new quote!";
  final List<String> _quotes = [
    "The only way to do great work is to love what you do. – Steve Jobs",
    "Success is not final, failure is not fatal: It is the courage to continue that counts. – Winston Churchill",
    "Your time is limited, don’t waste it living someone else’s life. – Steve Jobs",
    "Believe you can and you're halfway there. – Theodore Roosevelt",
    "The only limit to our realization of tomorrow will be our doubts of today. – Franklin D. Roosevelt",
    "The journey of a thousand miles begins with one step. – Lao Tzu",
  ];

  void _generateQuote() {
    setState(() {
      _currentQuote = _quotes[Random().nextInt(_quotes.length)];
    });
  }

  void _shareQuote() {
    (_currentQuote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Quote Generator'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: _shareQuote,
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _currentQuote,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _generateQuote,
                child: Text('Generate New Quote'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

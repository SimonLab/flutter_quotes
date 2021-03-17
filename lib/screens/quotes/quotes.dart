import 'package:flutter/material.dart';
import 'package:flutter_quotes/models/quote.dart';

class Quotes extends StatelessWidget {
  final List<Quote> quotes = [
    Quote(author: 'Author1', text: 'first quote'),
    Quote(author: 'Author2', text: 'second quote')
  ];

  @override
  Widget build(context) {
    return Scaffold(
      body: listQuotes(quotes),
    );
  }
 
  Widget listQuotes(List<Quote> quotes) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        return ListTile(title: Text('${quotes[index].author} - ${quotes[index].text}'));
      },
    );
  }

  
}

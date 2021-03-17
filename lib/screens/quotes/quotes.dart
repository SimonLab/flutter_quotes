import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quotes/models/quote.dart';
import 'package:http/http.dart' as http;

class Quotes extends StatelessWidget {
  @override
  Widget build(context) {
    return Scaffold(
        body: FutureBuilder(
      future: fetchQuotes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return listQuotes(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    ));
  }

  Widget listQuotes(List<Quote> quotes) {
    return ListView.builder(
      itemCount: quotes.length,
      itemBuilder: (context, index) {
        return ListTile(
            title: Text('${quotes[index].author} - ${quotes[index].text}'));
      },
    );
  }

  Future<List<Quote>> fetchQuotes() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/dwyl/quotes/master/quotes.json'));
    if (response.statusCode == 200) {
      // parse to json
      final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
      return parsed.map<Quote>((json) => Quote.fromJson(json)).toList();
    } else {
      return [];
    }
  }
}

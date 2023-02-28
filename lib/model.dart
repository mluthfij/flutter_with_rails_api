import 'package:flutter/material.dart';

class Article {
  final String body;
  final int id;
  final String title;

  const Article({
    required this.body,
    required this.id,
    required this.title,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      body: json['body'],
      id: json['id'],
      title: json['title'],
    );
  }
}

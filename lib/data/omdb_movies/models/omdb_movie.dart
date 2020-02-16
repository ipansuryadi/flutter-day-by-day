import 'dart:convert';

import 'package:meta/meta.dart';

class OmdbMovie {
  final String id;
  final String title;
  final String year;
  final String poster;
  final String label;
  final int priority;
  final bool viewed;
  final int rating;
  final int timestamp;

  OmdbMovie(
      {@required this.id,
      @required this.title,
      @required this.year,
      @required this.poster,
      @required this.label,
      @required this.priority,
      @required this.viewed,
      @required this.rating,
      @required this.timestamp});

  factory OmdbMovie.fromJson(Map<String, dynamic>json) {
    return OmdbMovie(
        id: json['id'],
        title: json['title'],
        year: json['year'],
        poster: json['poster'],
        label: json['label'],
        priority: json['priority'],
        viewed: json['viewed'],
        rating: json['rating'],
        timestamp: json['timestamp']);
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'poster': poster,
      'label': label,
      'priority': priority,
      'viewed': viewed,
      'rating': rating,
      'timestamp': timestamp,
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'novel.g.dart';

@JsonSerializable()
class Novel {
  final String title;
  final String author;
  final String description;
  final String posterUrl;
  final List<String> genres;
  final int isNewRelease;
  final List<Chapter> chapters;

  Novel({
    required this.title,
    required this.author,
    required this.description,
    required this.posterUrl,
    required this.genres,
    required this.isNewRelease,
    required this.chapters,
  });
  factory Novel.fromJson(Map<String, dynamic> json) => _$NovelFromJson(json);

  Map<String, dynamic> toJson() => _$NovelToJson(this);
}

@JsonSerializable()
class Chapter {
  final String title;
  final String content;

  Chapter({
    required this.title,
    required this.content,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) =>
      _$ChapterFromJson(json);

  Map<String, dynamic> toJson() => _$ChapterToJson(this);
}

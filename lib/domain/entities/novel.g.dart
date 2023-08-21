// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'novel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Novel _$NovelFromJson(Map<String, dynamic> json) => Novel(
      title: json['title'] as String,
      author: json['author'] as String,
      description: json['description'] as String,
      posterUrl: json['posterUrl'] as String,
      genres:
          (json['genres'] as List<dynamic>).map((e) => e as String).toList(),
      isNewRelease: json['isNewRelease'] as int,
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => Chapter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NovelToJson(Novel instance) => <String, dynamic>{
      'title': instance.title,
      'author': instance.author,
      'description': instance.description,
      'posterUrl': instance.posterUrl,
      'genres': instance.genres,
      'isNewRelease': instance.isNewRelease,
      'chapters': instance.chapters,
    };

Chapter _$ChapterFromJson(Map<String, dynamic> json) => Chapter(
      title: json['title'] as String,
      content: json['content'] as String,
    );

Map<String, dynamic> _$ChapterToJson(Chapter instance) => <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

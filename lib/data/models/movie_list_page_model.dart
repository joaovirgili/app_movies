import 'dart:convert';

import '../../domain/entities/entities.dart';
import '../../shared/api/api.dart';

class MovieListPageModel {
  MovieListPageModel({
    this.page,
    this.movies,
    this.totalPages,
    this.totalResults,
  });

  final int page;
  final List<MoviePreviewModel> movies;
  final int totalPages;
  final int totalResults;

  MovieListPageModel copyWith({
    int page,
    List<MoviePreviewModel> movies,
    int totalPages,
    int totalResults,
  }) =>
      MovieListPageModel(
        page: page ?? this.page,
        movies: movies ?? this.movies,
        totalPages: totalPages ?? this.totalPages,
        totalResults: totalResults ?? this.totalResults,
      );

  factory MovieListPageModel.fromRawJson(String str) =>
      MovieListPageModel.fromJson(json.decode(str) as Map);

  String toRawJson() => json.encode(toJson());

  factory MovieListPageModel.fromJson(Map json) => MovieListPageModel(
        page: json['page'] as int,
        movies: json['results'] == null
            ? null
            : List<MoviePreviewModel>.from((json['results'] as List)
                .map((x) => MoviePreviewModel.fromJson(x as Map))),
        totalPages: json['total_pages'] as int,
        totalResults: json['total_results'] as int,
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': movies == null
            ? null
            : List<dynamic>.from(movies.map((x) => x.toJson())),
        'total_pages': totalPages,
        'total_results': totalResults,
      };

  MovieListPageEntity toEntity() => MovieListPageEntity(
        movies: movies.map((e) => e.toEntity()).toList(),
        page: page,
        totalPages: totalPages,
        totalResults: totalResults,
      );
}

class MoviePreviewModel {
  MoviePreviewModel({
    this.posterPath,
    this.genreIds,
    this.id,
    this.title,
  });

  final String posterPath;
  final List<int> genreIds;
  final int id;
  final String title;

  MoviePreviewModel copyWith({
    String posterPath,
    List<int> genreIds,
    int id,
    String title,
  }) =>
      MoviePreviewModel(
        posterPath: posterPath ?? this.posterPath,
        genreIds: genreIds ?? this.genreIds,
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory MoviePreviewModel.fromRawJson(String str) =>
      MoviePreviewModel.fromJson(json.decode(str) as Map);

  String toRawJson() => json.encode(toJson());

  factory MoviePreviewModel.fromJson(Map json) => MoviePreviewModel(
        posterPath: Api.imageBaseUrl + json['poster_path'],
        genreIds: json['genre_ids'] == null
            ? null
            : (json['genre_ids'] as List).map((e) => e as int).toList(),
        id: json['id'] as int,
        title: json['title'] as String,
      );

  Map<String, dynamic> toJson() => {
        'poster_path': posterPath,
        'genre_ids': genreIds,
        'id': id,
        'title': title,
      };

  MoviePreviewEntity toEntity() => MoviePreviewEntity(
        id: id,
        title: title,
        genreIds: genreIds,
        posterPath: posterPath,
      );
}

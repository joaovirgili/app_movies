import '../../domain/entities/entities.dart';

class MovieDetailsModel {
  MovieDetailsModel({
    this.budget,
    this.genres,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.productionCompanies,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.runtime,
    this.credits,
  });

  final int budget;
  final List<String> genres;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final String posterPath;
  final List<String> productionCompanies;
  final DateTime releaseDate;
  final String title;
  final double voteAverage;
  final int runtime;
  final MovieCredits credits;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        budget: json['budget'],
        genres: json['genres'] == null
            ? null
            : (json['genres'] as List).map((e) => e['name'] as String).toList(),
        id: json['id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title'],
        overview: json['overview'],
        posterPath: json['poster_path'],
        productionCompanies: json['production_companies'] == null
            ? null
            : (json['production_companies'] as List)
                .map((e) => e['name'] as String)
                .toList(),
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        title: json['title'],
        voteAverage: json['vote_average'],
        runtime: json['runtime'],
        credits: MovieCredits.fromJson(json['credits']),
      );

  MovieDetailsEntity toEntity() => MovieDetailsEntity(
        budget: budget,
        genres: genres,
        id: id,
        originalLanguage: originalLanguage,
        overview: overview,
        posterPath: posterPath,
        productionCompanies: productionCompanies,
        releaseDate: releaseDate,
        title: title,
        originalTitle: originalTitle,
        voteAverage: voteAverage,
        runtime: runtime,
        cast: credits.cast
            .where((e) => e.knownForDepartment == 'Acting')
            .map((e) => e.toEntity())
            .toList(),
        directors: credits.crew
            .where((e) => e.department == 'Directing')
            .map((e) => e.toEntity())
            .toList(),
      );
}

class MovieCredits {
  MovieCredits({
    this.cast,
    this.crew,
  });

  final List<MemberModel> cast;
  final List<MemberModel> crew;

  MovieCredits copyWith({
    List<MemberModel> cast,
    List<MemberModel> crew,
  }) =>
      MovieCredits(
        cast: cast ?? this.cast,
        crew: crew ?? this.crew,
      );

  factory MovieCredits.fromJson(Map json) => MovieCredits(
        cast: json['cast'] == null
            ? null
            : List<MemberModel>.from(
                json['cast'].map((x) => MemberModel.fromJson(x))),
        crew: json['crew'] == null
            ? null
            : List<MemberModel>.from(
                json['crew'].map((x) => MemberModel.fromJson(x))),
      );
}

class MemberModel {
  MemberModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.castId,
    this.character,
    this.creditId,
    this.order,
    this.department,
    this.job,
  });

  final bool adult;
  final int gender;
  final int id;
  final String knownForDepartment;
  final String name;
  final String originalName;
  final double popularity;
  final String profilePath;
  final int castId;
  final String character;
  final String creditId;
  final int order;
  final String department;
  final String job;

  MemberModel copyWith({
    bool adult,
    int gender,
    int id,
    String knownForDepartment,
    String name,
    String originalName,
    double popularity,
    String profilePath,
    int castId,
    String character,
    String creditId,
    int order,
    String department,
    String job,
  }) =>
      MemberModel(
        adult: adult ?? this.adult,
        gender: gender ?? this.gender,
        id: id ?? this.id,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        name: name ?? this.name,
        originalName: originalName ?? this.originalName,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
        castId: castId ?? this.castId,
        character: character ?? this.character,
        creditId: creditId ?? this.creditId,
        order: order ?? this.order,
        department: department ?? this.department,
        job: job ?? this.job,
      );

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        adult: json['adult'],
        gender: json['gender'],
        id: json['id'],
        knownForDepartment: json['known_for_department'],
        name: json['name'],
        originalName: json['original_name'],
        popularity: json['popularity']?.toDouble(),
        profilePath: json['profile_path'],
        castId: json['cast_id'],
        character: json['character'],
        creditId: json['credit_id'],
        order: json['order'],
        department: json['department'],
        job: json['job'],
      );

  MemberEntity toEntity() => MemberEntity(
        adult: adult,
        gender: gender,
        id: id,
        knownForDepartment: knownForDepartment,
        name: name,
        originalName: originalName,
        popularity: popularity,
        profilePath: profilePath,
        castId: castId,
        character: character,
        creditId: creditId,
        order: order,
        department: department,
        job: job,
      );
}

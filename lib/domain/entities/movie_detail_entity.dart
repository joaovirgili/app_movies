class MovieDetailsEntity {
  MovieDetailsEntity({
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
    this.directors,
    this.cast,
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
  final List<MemberEntity> directors;
  final List<MemberEntity> cast;
}

class MemberEntity {
  MemberEntity({
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
}

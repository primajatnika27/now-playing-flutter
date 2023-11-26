import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:now_playing/domain/entities/game.dart';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel extends Equatable {
  final int? id;
  final String? slug;
  final String? name;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? metacritic;
  final int? playtime;
  final int? suggestionsCount;
  final DateTime? updated;
  final dynamic userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<PlatformElement>? platforms;
  final List<ParentPlatform>? parentPlatforms;
  final List<Genre>? genres;
  final List<Store>? stores;
  final dynamic clip;
  final List<Genre>? tags;
  final EsrbRating? esrbRating;
  final List<ShortScreenshot>? shortScreenshots;

  const GameModel({
    this.id,
    this.slug,
    this.name,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.playtime,
    this.suggestionsCount,
    this.updated,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.platforms,
    this.parentPlatforms,
    this.genres,
    this.stores,
    this.clip,
    this.tags,
    this.esrbRating,
    this.shortScreenshots,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    released: json["released"] == null ? null : DateTime.parse(json["released"]),
    tba: json["tba"],
    backgroundImage: json["background_image"],
    rating: json["rating"]?.toDouble(),
    ratingTop: json["rating_top"],
    ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
    ratingsCount: json["ratings_count"],
    reviewsTextCount: json["reviews_text_count"],
    added: json["added"],
    addedByStatus: json["added_by_status"] == null ? null : AddedByStatus.fromJson(json["added_by_status"]),
    metacritic: json["metacritic"] ?? 0,
    playtime: json["playtime"],
    suggestionsCount: json["suggestions_count"],
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    userGame: json["user_game"],
    reviewsCount: json["reviews_count"],
    saturatedColor: json["saturated_color"],
    dominantColor: json["dominant_color"],
    platforms: json["platforms"] == null ? [] : List<PlatformElement>.from(json["platforms"]!.map((x) => PlatformElement.fromJson(x))),
    parentPlatforms: json["parent_platforms"] == null ? [] : List<ParentPlatform>.from(json["parent_platforms"]!.map((x) => ParentPlatform.fromJson(x))),
    genres: json["genres"] == null ? [] : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
    stores: json["stores"] == null ? [] : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
    clip: json["clip"],
    tags: json["tags"] == null ? [] : List<Genre>.from(json["tags"]!.map((x) => Genre.fromJson(x))),
    esrbRating: json["esrb_rating"] == null ? null : EsrbRating.fromJson(json["esrb_rating"]),
    shortScreenshots: json["short_screenshots"] == null ? [] : List<ShortScreenshot>.from(json["short_screenshots"]!.map((x) => ShortScreenshot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "released": "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
    "tba": tba,
    "background_image": backgroundImage,
    "rating": rating,
    "rating_top": ratingTop,
    "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
    "ratings_count": ratingsCount,
    "reviews_text_count": reviewsTextCount,
    "added": added,
    "added_by_status": addedByStatus?.toJson(),
    "metacritic": metacritic,
    "playtime": playtime,
    "suggestions_count": suggestionsCount,
    "updated": updated?.toIso8601String(),
    "user_game": userGame,
    "reviews_count": reviewsCount,
    "saturated_color": saturatedColor,
    "dominant_color": dominantColor,
    "platforms": platforms == null ? [] : List<dynamic>.from(platforms!.map((x) => x.toJson())),
    "parent_platforms": parentPlatforms == null ? [] : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
    "clip": clip,
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "esrb_rating": esrbRating?.toJson(),
    "short_screenshots": shortScreenshots == null ? [] : List<dynamic>.from(shortScreenshots!.map((x) => x.toJson())),
  };

  Game toEntity() {
    return Game(
      id: id,
      slug: slug,
      name: name,
      released: released,
      tba: tba,
      backgroundImage: backgroundImage,
      rating: rating,
      ratingTop: ratingTop,
      ratings: ratings,
      ratingsCount: ratingsCount,
      reviewsTextCount: reviewsTextCount,
      added: added,
      addedByStatus: addedByStatus,
      metacritic: metacritic,
      playtime: playtime,
      suggestionsCount: suggestionsCount,
      updated: updated,
      userGame: userGame,
      reviewsCount: reviewsCount,
      saturatedColor: saturatedColor,
      dominantColor: dominantColor,
      platforms: platforms,
      parentPlatforms: parentPlatforms,
      genres: genres,
      stores: stores,
      clip: clip,
      tags: tags,
      esrbRating: esrbRating,
      shortScreenshots: shortScreenshots,
    );
  }

  @override
  List<Object?> get props => [
    id,
    slug,
    name,
    released,
    tba,
    backgroundImage,
    rating,
    ratingTop,
    ratings,
    ratingsCount,
    reviewsTextCount,
    added,
    addedByStatus,
    metacritic,
    playtime,
    suggestionsCount,
    updated,
    userGame,
    reviewsCount,
    saturatedColor,
    dominantColor,
    platforms,
    parentPlatforms,
    genres,
    stores,
    clip,
    tags,
    esrbRating,
    shortScreenshots,
  ];
}

class AddedByStatus {
  final int? yet;
  final int? owned;
  final int? beaten;
  final int? toplay;
  final int? dropped;
  final int? playing;

  AddedByStatus({
    this.yet,
    this.owned,
    this.beaten,
    this.toplay,
    this.dropped,
    this.playing,
  });

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
    yet: json["yet"],
    owned: json["owned"],
    beaten: json["beaten"],
    toplay: json["toplay"],
    dropped: json["dropped"],
    playing: json["playing"],
  );

  Map<String, dynamic> toJson() => {
    "yet": yet,
    "owned": owned,
    "beaten": beaten,
    "toplay": toplay,
    "dropped": dropped,
    "playing": playing,
  };
}

class EsrbRating {
  final int? id;
  final String? name;
  final String? slug;

  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
  };
}

class Genre {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  Genre({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    gamesCount: json["games_count"],
    imageBackground: json["image_background"],
    domain: json["domain"],
    language: json["language"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "games_count": gamesCount,
    "image_background": imageBackground,
    "domain": domain,
    "language": language,
  };
}

class ParentPlatform {
  final EsrbRating? platform;

  ParentPlatform({
    this.platform,
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
    platform: json["platform"] == null ? null : EsrbRating.fromJson(json["platform"]),
  );

  Map<String, dynamic> toJson() => {
    "platform": platform?.toJson(),
  };
}

class PlatformElement {
  final PlatformPlatform? platform;
  final DateTime? releasedAt;
  final RequirementsEn? requirementsEn;
  final dynamic requirementsRu;

  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu,
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
    platform: json["platform"] == null ? null : PlatformPlatform.fromJson(json["platform"]),
    releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
    requirementsEn: json["requirements_en"] == null ? null : RequirementsEn.fromJson(json["requirements_en"]),
    requirementsRu: json["requirements_ru"],
  );

  Map<String, dynamic> toJson() => {
    "platform": platform?.toJson(),
    "released_at": "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
    "requirements_en": requirementsEn?.toJson(),
    "requirements_ru": requirementsRu,
  };
}

class PlatformPlatform {
  final int? id;
  final String? name;
  final String? slug;
  final dynamic image;
  final dynamic yearEnd;
  final int? yearStart;
  final int? gamesCount;
  final String? imageBackground;

  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) => PlatformPlatform(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    yearEnd: json["year_end"],
    yearStart: json["year_start"],
    gamesCount: json["games_count"],
    imageBackground: json["image_background"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "year_end": yearEnd,
    "year_start": yearStart,
    "games_count": gamesCount,
    "image_background": imageBackground,
  };
}

class RequirementsEn {
  final String? minimum;
  final String? recommended;

  RequirementsEn({
    this.minimum,
    this.recommended,
  });

  factory RequirementsEn.fromJson(Map<String, dynamic> json) => RequirementsEn(
    minimum: json["minimum"],
    recommended: json["recommended"],
  );

  Map<String, dynamic> toJson() => {
    "minimum": minimum,
    "recommended": recommended,
  };
}

class Rating {
  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    id: json["id"],
    title: json["title"],
    count: json["count"],
    percent: json["percent"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "count": count,
    "percent": percent,
  };
}

class ShortScreenshot {
  final int? id;
  final String? image;

  ShortScreenshot({
    this.id,
    this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
  };
}

class Store {
  final int? id;
  final Genre? store;

  Store({
    this.id,
    this.store,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    store: json["store"] == null ? null : Genre.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "store": store?.toJson(),
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

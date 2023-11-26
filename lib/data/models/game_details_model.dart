import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:now_playing/domain/entities/game_detail.dart';

class GameDetailsModel extends Equatable {
  final int? id;
  final String? slug;
  final String? name;
  final String? nameOriginal;
  final String? description;
  final int? metacritic;
  final List<MetacriticPlatform>? metacriticPlatforms;
  final DateTime? released;
  final bool? tba;
  final DateTime? updated;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final double? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final Map<String, int>? reactions;
  final int? added;
  final AddedByStatus? addedByStatus;
  final int? playtime;
  final int? screenshotsCount;
  final int? moviesCount;
  final int? creatorsCount;
  final int? achievementsCount;
  final int? parentAchievementsCount;
  final String? redditUrl;
  final String? redditName;
  final String? redditDescription;
  final String? redditLogo;
  final int? redditCount;
  final int? twitchCount;
  final int? youtubeCount;
  final int? reviewsTextCount;
  final int? ratingsCount;
  final int? suggestionsCount;
  final List<dynamic>? alternativeNames;
  final String? metacriticUrl;
  final int? parentsCount;
  final int? additionsCount;
  final int? gameSeriesCount;
  final dynamic userGame;
  final int? reviewsCount;
  final String? saturatedColor;
  final String? dominantColor;
  final List<ParentPlatform>? parentPlatforms;
  final List<PlatformElement>? platforms;
  final List<Store>? stores;
  final List<Developer>? developers;
  final List<Developer>? genres;
  final List<Developer>? tags;
  final List<Developer>? publishers;
  final EsrbRating? esrbRating;
  final dynamic clip;
  final String? descriptionRaw;

  const GameDetailsModel({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  factory GameDetailsModel.fromRawJson(String str) => GameDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) => GameDetailsModel(
    id: json["id"],
    slug: json["slug"],
    name: json["name"],
    nameOriginal: json["name_original"],
    description: json["description"],
    metacritic: json["metacritic"],
    metacriticPlatforms: json["metacritic_platforms"] == null ? [] : List<MetacriticPlatform>.from(json["metacritic_platforms"]!.map((x) => MetacriticPlatform.fromJson(x))),
    released: json["released"] == null ? null : DateTime.parse(json["released"]),
    tba: json["tba"],
    updated: json["updated"] == null ? null : DateTime.parse(json["updated"]),
    backgroundImage: json["background_image"],
    backgroundImageAdditional: json["background_image_additional"],
    website: json["website"],
    rating: json["rating"]?.toDouble(),
    ratingTop: json["rating_top"],
    ratings: json["ratings"] == null ? [] : List<Rating>.from(json["ratings"]!.map((x) => Rating.fromJson(x))),
    reactions: Map.from(json["reactions"]!).map((k, v) => MapEntry<String, int>(k, v)),
    added: json["added"],
    addedByStatus: json["added_by_status"] == null ? null : AddedByStatus.fromJson(json["added_by_status"]),
    playtime: json["playtime"],
    screenshotsCount: json["screenshots_count"],
    moviesCount: json["movies_count"],
    creatorsCount: json["creators_count"],
    achievementsCount: json["achievements_count"],
    parentAchievementsCount: json["parent_achievements_count"],
    redditUrl: json["reddit_url"],
    redditName: json["reddit_name"],
    redditDescription: json["reddit_description"],
    redditLogo: json["reddit_logo"],
    redditCount: json["reddit_count"],
    twitchCount: json["twitch_count"],
    youtubeCount: json["youtube_count"],
    reviewsTextCount: json["reviews_text_count"],
    ratingsCount: json["ratings_count"],
    suggestionsCount: json["suggestions_count"],
    alternativeNames: json["alternative_names"] == null ? [] : List<dynamic>.from(json["alternative_names"]!.map((x) => x)),
    metacriticUrl: json["metacritic_url"],
    parentsCount: json["parents_count"],
    additionsCount: json["additions_count"],
    gameSeriesCount: json["game_series_count"],
    userGame: json["user_game"],
    reviewsCount: json["reviews_count"],
    saturatedColor: json["saturated_color"],
    dominantColor: json["dominant_color"],
    parentPlatforms: json["parent_platforms"] == null ? [] : List<ParentPlatform>.from(json["parent_platforms"]!.map((x) => ParentPlatform.fromJson(x))),
    platforms: json["platforms"] == null ? [] : List<PlatformElement>.from(json["platforms"]!.map((x) => PlatformElement.fromJson(x))),
    stores: json["stores"] == null ? [] : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
    developers: json["developers"] == null ? [] : List<Developer>.from(json["developers"]!.map((x) => Developer.fromJson(x))),
    genres: json["genres"] == null ? [] : List<Developer>.from(json["genres"]!.map((x) => Developer.fromJson(x))),
    tags: json["tags"] == null ? [] : List<Developer>.from(json["tags"]!.map((x) => Developer.fromJson(x))),
    publishers: json["publishers"] == null ? [] : List<Developer>.from(json["publishers"]!.map((x) => Developer.fromJson(x))),
    esrbRating: json["esrb_rating"] == null ? null : EsrbRating.fromJson(json["esrb_rating"]),
    clip: json["clip"],
    descriptionRaw: json["description_raw"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "slug": slug,
    "name": name,
    "name_original": nameOriginal,
    "description": description,
    "metacritic": metacritic,
    "metacritic_platforms": metacriticPlatforms == null ? [] : List<dynamic>.from(metacriticPlatforms!.map((x) => x.toJson())),
    "released": "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
    "tba": tba,
    "updated": updated?.toIso8601String(),
    "background_image": backgroundImage,
    "background_image_additional": backgroundImageAdditional,
    "website": website,
    "rating": rating,
    "rating_top": ratingTop,
    "ratings": ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x.toJson())),
    "reactions": Map.from(reactions!).map((k, v) => MapEntry<String, dynamic>(k, v)),
    "added": added,
    "added_by_status": addedByStatus?.toJson(),
    "playtime": playtime,
    "screenshots_count": screenshotsCount,
    "movies_count": moviesCount,
    "creators_count": creatorsCount,
    "achievements_count": achievementsCount,
    "parent_achievements_count": parentAchievementsCount,
    "reddit_url": redditUrl,
    "reddit_name": redditName,
    "reddit_description": redditDescription,
    "reddit_logo": redditLogo,
    "reddit_count": redditCount,
    "twitch_count": twitchCount,
    "youtube_count": youtubeCount,
    "reviews_text_count": reviewsTextCount,
    "ratings_count": ratingsCount,
    "suggestions_count": suggestionsCount,
    "alternative_names": alternativeNames == null ? [] : List<dynamic>.from(alternativeNames!.map((x) => x)),
    "metacritic_url": metacriticUrl,
    "parents_count": parentsCount,
    "additions_count": additionsCount,
    "game_series_count": gameSeriesCount,
    "user_game": userGame,
    "reviews_count": reviewsCount,
    "saturated_color": saturatedColor,
    "dominant_color": dominantColor,
    "parent_platforms": parentPlatforms == null ? [] : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
    "platforms": platforms == null ? [] : List<dynamic>.from(platforms!.map((x) => x.toJson())),
    "stores": stores == null ? [] : List<dynamic>.from(stores!.map((x) => x.toJson())),
    "developers": developers == null ? [] : List<dynamic>.from(developers!.map((x) => x.toJson())),
    "genres": genres == null ? [] : List<dynamic>.from(genres!.map((x) => x.toJson())),
    "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x.toJson())),
    "publishers": publishers == null ? [] : List<dynamic>.from(publishers!.map((x) => x.toJson())),
    "esrb_rating": esrbRating?.toJson(),
    "clip": clip,
    "description_raw": descriptionRaw,
  };

  GameDetail toEntity() {
    return GameDetail(
      id: id,
      slug: slug,
      name: name,
      nameOriginal: nameOriginal,
      description: description,
      metacritic: metacritic,
      metacriticPlatforms: metacriticPlatforms,
      released: released,
      tba: tba,
      updated: updated,
      backgroundImage: backgroundImage,
      backgroundImageAdditional: backgroundImageAdditional,
      website: website,
      rating: rating,
      ratingTop: ratingTop,
      ratings: ratings,
      reactions: reactions,
      added: added,
      addedByStatus: addedByStatus,
      playtime: playtime,
      screenshotsCount: screenshotsCount,
      moviesCount: moviesCount,
      creatorsCount: creatorsCount,
      achievementsCount: achievementsCount,
      parentAchievementsCount: parentAchievementsCount,
      redditUrl: redditUrl,
      redditName: redditName,
      redditDescription: redditDescription,
      redditLogo: redditLogo,
      redditCount: redditCount,
      twitchCount: twitchCount,
      youtubeCount: youtubeCount,
      reviewsTextCount: reviewsTextCount,
      ratingsCount: ratingsCount,
      suggestionsCount: suggestionsCount,
      alternativeNames: alternativeNames,
      metacriticUrl: metacriticUrl,
      parentsCount: parentsCount,
      additionsCount: additionsCount,
      gameSeriesCount: gameSeriesCount,
      userGame: userGame,
      reviewsCount: reviewsCount,
      saturatedColor: saturatedColor,
      dominantColor: dominantColor,
      parentPlatforms: parentPlatforms,
      platforms: platforms,
      stores: stores,
      developers: developers,
      genres: genres,
      tags: tags,
      publishers: publishers,
      esrbRating: esrbRating,
      clip: clip,
      descriptionRaw: descriptionRaw,
    );
  }

  @override
  List<Object?> get props => [
    id,
    slug,
    name,
    nameOriginal,
    description,
    metacritic,
    metacriticPlatforms,
    released,
    tba,
    updated,
    backgroundImage,
    backgroundImageAdditional,
    website,
    rating,
    ratingTop,
    ratings,
    reactions,
    added,
    addedByStatus,
    playtime,
    screenshotsCount,
    moviesCount,
    creatorsCount,
    achievementsCount,
    parentAchievementsCount,
    redditUrl,
    redditName,
    redditDescription,
    redditLogo,
    redditCount,
    twitchCount,
    youtubeCount,
    reviewsTextCount,
    ratingsCount,
    suggestionsCount,
    alternativeNames,
    metacriticUrl,
    parentsCount,
    additionsCount,
    gameSeriesCount,
    userGame,
    reviewsCount,
    saturatedColor,
    dominantColor,
    parentPlatforms,
    platforms,
    stores,
    developers,
    genres,
    tags,
    publishers,
    esrbRating,
    clip,
    descriptionRaw,
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

  factory AddedByStatus.fromRawJson(String str) => AddedByStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class Developer {
  final int? id;
  final String? name;
  final String? slug;
  final int? gamesCount;
  final String? imageBackground;
  final String? domain;
  final String? language;

  Developer({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  factory Developer.fromRawJson(String str) => Developer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
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

class EsrbRating {
  final int? id;
  final String? name;
  final String? slug;

  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  factory EsrbRating.fromRawJson(String str) => EsrbRating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class MetacriticPlatform {
  final int? metascore;
  final String? url;
  final MetacriticPlatformPlatform? platform;

  MetacriticPlatform({
    this.metascore,
    this.url,
    this.platform,
  });

  factory MetacriticPlatform.fromRawJson(String str) => MetacriticPlatform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetacriticPlatform.fromJson(Map<String, dynamic> json) => MetacriticPlatform(
    metascore: json["metascore"],
    url: json["url"],
    platform: json["platform"] == null ? null : MetacriticPlatformPlatform.fromJson(json["platform"]),
  );

  Map<String, dynamic> toJson() => {
    "metascore": metascore,
    "url": url,
    "platform": platform?.toJson(),
  };
}

class MetacriticPlatformPlatform {
  final int? platform;
  final String? name;
  final String? slug;

  MetacriticPlatformPlatform({
    this.platform,
    this.name,
    this.slug,
  });

  factory MetacriticPlatformPlatform.fromRawJson(String str) => MetacriticPlatformPlatform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MetacriticPlatformPlatform.fromJson(Map<String, dynamic> json) => MetacriticPlatformPlatform(
    platform: json["platform"],
    name: json["name"],
    slug: json["slug"],
  );

  Map<String, dynamic> toJson() => {
    "platform": platform,
    "name": name,
    "slug": slug,
  };
}

class ParentPlatform {
  final EsrbRating? platform;

  ParentPlatform({
    this.platform,
  });

  factory ParentPlatform.fromRawJson(String str) => ParentPlatform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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
  final Requirements? requirements;

  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirements,
  });

  factory PlatformElement.fromRawJson(String str) => PlatformElement.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlatformElement.fromJson(Map<String, dynamic> json) => PlatformElement(
    platform: json["platform"] == null ? null : PlatformPlatform.fromJson(json["platform"]),
    releasedAt: json["released_at"] == null ? null : DateTime.parse(json["released_at"]),
    requirements: json["requirements"] == null ? null : Requirements.fromJson(json["requirements"]),
  );

  Map<String, dynamic> toJson() => {
    "platform": platform?.toJson(),
    "released_at": "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
    "requirements": requirements?.toJson(),
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

  factory PlatformPlatform.fromRawJson(String str) => PlatformPlatform.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class Requirements {
  final String? minimum;
  final String? recommended;

  Requirements({
    this.minimum,
    this.recommended,
  });

  factory Requirements.fromRawJson(String str) => Requirements.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
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

  factory Rating.fromRawJson(String str) => Rating.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

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

class Store {
  final int? id;
  final String? url;
  final Developer? store;

  Store({
    this.id,
    this.url,
    this.store,
  });

  factory Store.fromRawJson(String str) => Store.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    id: json["id"],
    url: json["url"],
    store: json["store"] == null ? null : Developer.fromJson(json["store"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "url": url,
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

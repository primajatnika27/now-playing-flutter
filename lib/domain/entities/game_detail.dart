import 'package:equatable/equatable.dart';
import 'package:now_playing/data/models/game_details_model.dart';

class GameDetail extends Equatable {
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

  const GameDetail({
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

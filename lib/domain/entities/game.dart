import 'package:equatable/equatable.dart';
import 'package:now_playing/data/models/game_model.dart';

class Game extends Equatable {
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

  const Game({
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

  @override
  // TODO: implement props
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

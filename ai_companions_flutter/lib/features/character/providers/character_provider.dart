// Character Provider - Riverpod state management

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/services/character_service.dart';
import '../../../shared/models/index.dart';

class CharacterListState {
  final List<Character> characters;
  final List<Character> featured;
  final List<Character> myCharacters;
  final List<Character> favorites;
  final Character? selectedCharacter;
  final bool isLoading;
  final bool isLoadingMore;
  final int page;
  final bool hasMore;
  final int total;
  final String? error;
  final Map<String, dynamic> filters;

  CharacterListState({
    this.characters = const [],
    this.featured = const [],
    this.myCharacters = const [],
    this.favorites = const [],
    this.selectedCharacter,
    this.isLoading = false,
    this.isLoadingMore = false,
    this.page = 1,
    this.hasMore = true,
    this.total = 0,
    this.error,
    this.filters = const {},
  });

  CharacterListState copyWith({
    List<Character>? characters,
    List<Character>? featured,
    List<Character>? myCharacters,
    List<Character>? favorites,
    Character? selectedCharacter,
    bool? isLoading,
    bool? isLoadingMore,
    int? page,
    bool? hasMore,
    int? total,
    String? error,
    Map<String, dynamic>? filters,
  }) {
    return CharacterListState(
      characters: characters ?? this.characters,
      featured: featured ?? this.featured,
      myCharacters: myCharacters ?? this.myCharacters,
      favorites: favorites ?? this.favorites,
      selectedCharacter: selectedCharacter ?? this.selectedCharacter,
      isLoading: isLoading ?? this.isLoading,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      page: page ?? this.page,
      hasMore: hasMore ?? this.hasMore,
      total: total ?? this.total,
      error: error ?? this.error,
      filters: filters ?? this.filters,
    );
  }
}

class CharacterNotifier extends Notifier<CharacterListState> {
  @override
  CharacterListState build() => CharacterListState();

  Future<void> fetchCharacters({bool reset = false}) async {
    if (state.isLoading) return;

    final newPage = reset ? 1 : state.page;
    state = state.copyWith(
      isLoading: reset || newPage == 1,
      isLoadingMore: !reset && newPage > 1,
    );

    try {
      final result = await CharacterService.instance.list(
        page: newPage,
        limit: 20,
        gender: state.filters['gender'],
        style: state.filters['style'],
        category: state.filters['category'],
        sort: state.filters['sort'] ?? 'popular',
        search: state.filters['search'],
      );

      final updatedCharacters = reset || newPage == 1
          ? result.data
          : [...state.characters, ...result.data];

      state = state.copyWith(
        characters: updatedCharacters,
        page: newPage + 1,
        hasMore: result.hasMore,
        total: result.total,
        isLoading: false,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        isLoadingMore: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> fetchFeatured() async {
    try {
      final result = await CharacterService.instance.list(
        sort: 'popular',
        limit: 10,
      );
      state = state.copyWith(featured: result.data);
    } catch (e) {
      // Silent fail
    }
  }

  Future<void> fetchMyCharacters() async {
    try {
      final data = await CharacterService.instance.getMyCharacters();
      state = state.copyWith(myCharacters: data);
    } catch (e) {
      // Silent fail
    }
  }

  Future<void> fetchFavorites() async {
    try {
      final data = await CharacterService.instance.getFavorites();
      state = state.copyWith(favorites: data);
    } catch (e) {
      // Silent fail
    }
  }

  Future<Character> createCharacter(CreateCharacterRequest request) async {
    try {
      final character = await CharacterService.instance.create(request);
      state = state.copyWith(myCharacters: [...state.myCharacters, character]);
      return character;
    } catch (e) {
      rethrow;
    }
  }

  Future<Character> fetchCharacterById(String id) async {
    final character = await CharacterService.instance.getById(id);
    state = state.copyWith(selectedCharacter: character);
    return character;
  }

  Future<void> toggleFavorite(String id) async {
    try {
      final result = await CharacterService.instance.toggleFavorite(id);

      final updateFav = (List<Character> chars) {
        return chars.map((c) {
          if (c.id == id) {
            return c.copyWith(isFavorited: result.isFavorited);
          }
          return c;
        }).toList();
      };

      state = state.copyWith(
        characters: updateFav(state.characters),
        featured: updateFav(state.featured),
        selectedCharacter: state.selectedCharacter?.id == id
            ? state.selectedCharacter!.copyWith(isFavorited: result.isFavorited)
            : state.selectedCharacter,
      );
    } catch (e) {
      // Silent fail
    }
  }

  Future<void> fetchMore() async {
    if (state.isLoading || state.isLoadingMore || !state.hasMore) return;
    await fetchCharacters();
  }

  void setFilter(String key, dynamic value) {
    final newFilters = Map<String, dynamic>.from(state.filters);
    newFilters[key] = value;
    state = state.copyWith(filters: newFilters, page: 1, hasMore: true);
  }

  void clearFilters() {
    state = state.copyWith(
      filters: {'sort': 'popular'},
      page: 1,
      hasMore: true,
    );
  }

  void setSelectedCharacter(Character? character) {
    state = state.copyWith(selectedCharacter: character);
  }
}

final characterProvider =
    NotifierProvider<CharacterNotifier, CharacterListState>(
      CharacterNotifier.new,
    );

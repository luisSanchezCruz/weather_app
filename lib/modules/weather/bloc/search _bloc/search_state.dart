part of 'search_bloc.dart';

class SearchState extends Equatable {
  const SearchState._({
    this.query = '',
    this.results = const [],
    this.loading = false,
  });

  factory SearchState.initialState() {
    return const SearchState._();
  }

  final String query;
  final List<Location> results;
  final bool loading;

  SearchState copyWith({
    String? query,
    List<Location>? results,
    bool? loading,
  }) =>
      SearchState._(
        query: query ?? this.query,
        results: results ?? this.results,
        loading: loading ?? this.loading,
      );

  @override
  List<Object> get props => [
        query,
        results,
        loading,
      ];
}

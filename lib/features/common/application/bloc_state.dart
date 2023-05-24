import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_state.freezed.dart';

@freezed
abstract class BlocState<T> with _$BlocState<T> {
  const factory BlocState.initial() = InitialState<T>;
  const factory BlocState.loading() = LoadingState<T>;
  const factory BlocState.error(String error) = ErrorState<T>;
  const factory BlocState.data() = DataState<T>;
}

extension BlocStateExtension<T> on BlocState<T> {
  bool get isInitial => this is InitialState<T>;
  bool get isLoading => this is LoadingState<T>;
  bool get isError => this is ErrorState<T>;
  bool get isData => this is DataState<T>;

  InitialState<T> get asInitial => this as InitialState<T>;
  LoadingState<T> get asLoading => this as LoadingState<T>;
  ErrorState<T> get asError => this as ErrorState<T>;
  DataState<T> get asData => this as DataState<T>;

  BlocState<T> copyWith({
    T? data,
    String? error,
  }) {
    if (isData && data != null) {
      return const BlocState.data();
    } else if (isError && error != null) {
      return BlocState.error(error);
    } else {
      return this;
    }
  }
}

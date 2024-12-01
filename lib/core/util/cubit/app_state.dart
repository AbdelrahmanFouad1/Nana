import 'package:nana/core/util/resources/common_dependencies.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {

  const factory AppState.initial() = _Initial;

  const factory AppState.empty() = _Empty;

  const factory AppState.loading() = _Loading;

  const factory AppState.loaded() = _Loaded;

}
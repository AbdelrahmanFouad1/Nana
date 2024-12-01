
import 'package:nana/core/util/resources/common_dependencies.dart';

import 'app_state.dart';

@injectable
@LazySingleton()
class AppCubit extends Cubit<AppState> {

  AppCubit() : super(const AppState.initial());

  static AppCubit get(context) => BlocProvider.of(context);


}

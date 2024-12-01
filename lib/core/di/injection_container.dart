import 'package:nana/core/util/resources/common_dependencies.dart';
import 'injection_container.config.dart';

GetIt inject = GetIt.instance;


@InjectableInit(
  initializerName: r'$initDependenciesGetIt', // default
  preferRelativeImports: true, // default
)


void configureDependencies(GetIt getIt) => getIt.$initDependenciesGetIt();


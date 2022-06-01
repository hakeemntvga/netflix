import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injectable.config.dart';

final getit = GetIt.instance;

@InjectableInit()
Future<void> configureInjection() async {
  await $initGetIt(getit, environment: Environment.prod);
}

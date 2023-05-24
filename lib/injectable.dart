import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:learningcards/injectable.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies(String? env) async => getIt.init(environment: env);

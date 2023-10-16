import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
// Packages

// Core

// Notifiers

// Repositories

// Services

// Cubits
  getIt.registerFactory(
    () => HomeCubit(homeService: getIt()),
  );
}

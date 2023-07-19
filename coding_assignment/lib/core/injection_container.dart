import 'package:coding_assignment/repository/scan_repository.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

// Creating a global singleton instance of GetIt for dependency injection
final sl = GetIt.instance;
// Asynchronous function to initialize the dependency injection container

Future<void> init() async {
  // Registering the ScanRepository as a lazy singleton in the container
  // The ScanRepository will only be instantiated once and reused whenever needed
  sl.registerLazySingleton(
    () => ScanRepository(
      client: sl(),
    ),
  );
  // Registering Dio as a lazy singleton in the container
  sl.registerLazySingleton(Dio.new);
}

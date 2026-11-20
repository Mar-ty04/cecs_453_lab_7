import 'package:get_it/get_it.dart';

import '../repository/note_repository.dart';

// the standard way to grab the global service locator singleton from get_it
final getIt = GetIt.instance;

void setupLocator() {
  // lazy singleton, the NoteRepository is only created the first time it is requested
  getIt.registerLazySingleton(() => NoteRepository());
}
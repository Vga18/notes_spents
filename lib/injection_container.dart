import 'package:get_it/get_it.dart';
import 'package:notes_spents/repository/auth_repository.dart';
import 'package:notes_spents/repository/note_repository.dart';
import 'package:notes_spents/view_mode/auth/auth_view_model.dart';
import 'package:notes_spents/view_mode/note/note_view_model.dart';

final locator = GetIt.instance;

setupLocator() {
  //Respositorios(Singletons)
  locator.registerLazySingleton<AuthRepository>(() => AuthRepositoryImple());
  locator.registerLazySingleton<ActivesRepository>(()=>ActivesRepositoryImpl());

  //Viewmodel (Factory)
  locator.registerFactory<AuthViewModel>(() => AuthViewModel(locator<AuthRepository>()));
  locator.registerFactoryParam<ActivesViewModel, String, void>((userId,_) => ActivesViewModel(locator<ActivesRepository>(), userId));

}

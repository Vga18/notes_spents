import 'package:mobx/mobx.dart';
import 'package:notes_spents/repository/auth_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
part 'auth_view_model.g.dart';

class AuthViewModel = _AuthViewModelBase with _$AuthViewModel;

abstract class _AuthViewModelBase with Store {
  final AuthRepository _authRepository;
  _AuthViewModelBase(this._authRepository);

  @observable
  bool isLoading = false;

  @observable
  String? errorMessage;

  @observable
  User? user;

  @observable
  bool recoveryEmailSent = false;

  @action
  Future<bool>checkPersistedSession()async{
    isLoading = true;
    try{
      final hasSession = await _authRepository.initializeSession();
      if(hasSession){
        user = _authRepository.currentUser;
      } return hasSession;
    } catch(_){
      return false;
    } finally{
      isLoading = false;
      return false;
    }
  }

  @action
  Future<bool>login(String email, String password) async{
    isLoading = true;
    errorMessage = null;
    try{
      user = await _authRepository.login(email, password);
      return user != null;
    } catch(e){
      errorMessage = e.toString().replaceAll('AuthException: ', '');
      return false;
    } finally{
      isLoading = false;
    }
  }

  @action
  Future<bool>register(String email, String password) async{
    isLoading = true;
    errorMessage = null;
    try{
      user = await _authRepository.register(email, password);
      return user != null;
    } catch(e){
      errorMessage = e.toString().replaceAll('AuthException: ', '');
      return false;
    } finally{
      isLoading = false;
    }
  }

  @action
  Future<bool>sendRecoveryEmail(String email) async{
    isLoading = true;
    errorMessage = null;
    recoveryEmailSent = false;
    try{
      await _authRepository.recoverPassword(email);
      recoveryEmailSent = true;
      return true;
    } catch (e){
      errorMessage = e.toString().replaceAll('AuthException: ', '');
      return false;
    } finally{
      isLoading = false;
    }
  }

  @action
  Future<void>logout()async{
    await _authRepository.logout();
    user = null;
  }
}
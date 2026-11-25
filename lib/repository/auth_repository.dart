import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AuthRepository {
  Future<User?> login (String email, String password);
  Future<User?> register (String email, String password);
  Future<void> logout ();
  Future<void> recoverPassword (String email);
  Future<bool> initializeSession ();
  User? get currentUser;
}

class AuthRepositoryImple extends AuthRepository {
  final _client = Supabase.instance.client;
  final _secureStorage = const FlutterSecureStorage();
  static const _sessionKey = 'supabase_refresh_token';

  AuthRepositoryImple(){
    _client.auth.onAuthStateChange.listen((data)async{
      final session = data.session;
      if(session!=null && session.refreshToken!=null){
        await _secureStorage.write(key: _sessionKey, value: session.refreshToken);
      }else if (data.event == AuthChangeEvent.signedOut){
        await _secureStorage.delete(key: _sessionKey);
      }
    });
  }
  @override
  // TODO: implement currentUser
  User? get currentUser => _client.auth.currentUser;

  @override
  Future<bool> initializeSession() async{
    // TODO: implement initializeSession
    try{
      final refreshToken = await _secureStorage.read(key: _sessionKey);
      if(refreshToken == null) return false;
      
      final response = await _client.auth.setSession(refreshToken);
      return response.user != null;
    }catch(_){
      await _secureStorage.delete(key: _sessionKey);
      return false;
    }
  }

  @override
  Future<User?> login(String email, String password) async{
    // TODO: implement login
    final response = await _client.auth.signInWithPassword(email: email, password: password);
    return response.user;
  }

  @override
  Future<User?> register(String email, String password) async{
    // TODO: implement register
    final response = await _client.auth.signUp(email: email, password: password);
    return response.user;
  }

  @override
  Future<void> recoverPassword(String email) async{
    // TODO: implement recoverPassword
    await _client.auth.resetPasswordForEmail(email);
  }

  @override
  Future<void> logout() async{
    // TODO: implement logout
    await _client.auth.signOut();
    await _secureStorage.delete(key: _sessionKey);
  }
}
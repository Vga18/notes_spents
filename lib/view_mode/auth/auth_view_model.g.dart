// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on _AuthViewModelBase, Store {
  late final _$isLoadingAtom = Atom(
    name: '_AuthViewModelBase.isLoading',
    context: context,
  );

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom = Atom(
    name: '_AuthViewModelBase.errorMessage',
    context: context,
  );

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$userAtom = Atom(
    name: '_AuthViewModelBase.user',
    context: context,
  );

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$recoveryEmailSentAtom = Atom(
    name: '_AuthViewModelBase.recoveryEmailSent',
    context: context,
  );

  @override
  bool get recoveryEmailSent {
    _$recoveryEmailSentAtom.reportRead();
    return super.recoveryEmailSent;
  }

  @override
  set recoveryEmailSent(bool value) {
    _$recoveryEmailSentAtom.reportWrite(value, super.recoveryEmailSent, () {
      super.recoveryEmailSent = value;
    });
  }

  late final _$checkPersistedSessionAsyncAction = AsyncAction(
    '_AuthViewModelBase.checkPersistedSession',
    context: context,
  );

  @override
  Future<bool> checkPersistedSession() {
    return _$checkPersistedSessionAsyncAction.run(
      () => super.checkPersistedSession(),
    );
  }

  late final _$loginAsyncAction = AsyncAction(
    '_AuthViewModelBase.login',
    context: context,
  );

  @override
  Future<bool> login(String email, String password) {
    return _$loginAsyncAction.run(() => super.login(email, password));
  }

  late final _$registerAsyncAction = AsyncAction(
    '_AuthViewModelBase.register',
    context: context,
  );

  @override
  Future<bool> register(String email, String password) {
    return _$registerAsyncAction.run(() => super.register(email, password));
  }

  late final _$sendRecoveryEmailAsyncAction = AsyncAction(
    '_AuthViewModelBase.sendRecoveryEmail',
    context: context,
  );

  @override
  Future<bool> sendRecoveryEmail(String email) {
    return _$sendRecoveryEmailAsyncAction.run(
      () => super.sendRecoveryEmail(email),
    );
  }

  late final _$logoutAsyncAction = AsyncAction(
    '_AuthViewModelBase.logout',
    context: context,
  );

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
user: ${user},
recoveryEmailSent: ${recoveryEmailSent}
    ''';
  }
}

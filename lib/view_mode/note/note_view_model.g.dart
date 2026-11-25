// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ActivesViewModel on _ActivesViewModelBase, Store {
  late final _$activeAtom = Atom(
    name: '_ActivesViewModelBase.active',
    context: context,
  );

  @override
  ObservableList<ActivesModel> get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(ObservableList<ActivesModel> value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  late final _$isLoadingAtom = Atom(
    name: '_ActivesViewModelBase.isLoading',
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

  late final _$loadActivesAsyncAction = AsyncAction(
    '_ActivesViewModelBase.loadActives',
    context: context,
  );

  @override
  Future<void> loadActives() {
    return _$loadActivesAsyncAction.run(() => super.loadActives());
  }

  late final _$addactiveAsyncAction = AsyncAction(
    '_ActivesViewModelBase.addactive',
    context: context,
  );

  @override
  Future<void> addactive(String title, double amount) {
    return _$addactiveAsyncAction.run(() => super.addactive(title, amount));
  }

  late final _$editactiveAsyncAction = AsyncAction(
    '_ActivesViewModelBase.editactive',
    context: context,
  );

  @override
  Future<void> editactive(ActivesModel active) {
    return _$editactiveAsyncAction.run(() => super.editactive(active));
  }

  late final _$removeactiveAsyncAction = AsyncAction(
    '_ActivesViewModelBase.removeactive',
    context: context,
  );

  @override
  Future<void> removeactive(String id) {
    return _$removeactiveAsyncAction.run(() => super.removeactive(id));
  }

  @override
  String toString() {
    return '''
active: ${active},
isLoading: ${isLoading}
    ''';
  }
}

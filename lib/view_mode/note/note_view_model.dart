import 'dart:ffi';

import 'package:mobx/mobx.dart';
import 'package:notes_spents/model/note.dart';
import 'package:notes_spents/repository/note_repository.dart';

part 'note_view_model.g.dart';

class ActivesViewModel = _ActivesViewModelBase with _$ActivesViewModel;

abstract class _ActivesViewModelBase with Store {
  final ActivesRepository _activesRepository;
  final String userId;
  _ActivesViewModelBase(this._activesRepository,this.userId);

  @observable
  ObservableList<ActivesModel> active = ObservableList<ActivesModel>();

  @observable
  bool isLoading = false;

  @action
  Future<void> loadActives() async{
    isLoading = true;
    try{
      final result = await _activesRepository.fetchactive();
      active.clear();
      active.addAll(result);
    }catch(_){}
    isLoading = false;
  }

  @action
  Future<void> addactive(String title, double amount) async{
    final newactive = ActivesModel(userId: userId, title: title, amount: amount);
    try{
      await _activesRepository.createactive(newactive);
      await loadActives();
    }catch(_){}
    isLoading = false;
  }

  @action
  Future<void>editactive(ActivesModel active) async{
    final editactive = ActivesModel(id: active.id,userId: userId, title: active.title, amount: active.amount);
    isLoading = true;
    try{
      await _activesRepository.updateactive(editactive);
      await loadActives();
    }catch(_){}
    isLoading = false;
  }

  @action
  Future<void> removeactive(String id) async{
    isLoading = true;
    try{
      await _activesRepository.deleteactive(id);
      active.removeWhere((active) => active.id == id);
    }catch(_){}
    isLoading = false;
  }
}
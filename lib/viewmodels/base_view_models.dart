import 'package:flutter/material.dart';
import 'package:covidgraph/enums/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _viewState = ViewState.Idle;

  ViewState get state => _viewState;

  void setState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }
}

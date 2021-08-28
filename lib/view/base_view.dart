import 'package:covidgraph/services/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:covidgraph/viewmodels/base_view_models.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget? child) build;
  final Function(T) onViewModelReady;

  BaseView({
    required this.build,
    required this.onViewModelReady,
  });

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T viewModel = serviceLocator<T>();

  @override
  void initState() {
    widget.onViewModelReady(viewModel);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
      create: (BuildContext context) => viewModel,
      child: Consumer<T>(
        builder: widget.build,
      ),
    );
  }
}

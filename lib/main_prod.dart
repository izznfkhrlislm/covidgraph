import 'package:covidgraph/services/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covidgraph/enums/flavor.dart';
import 'package:covidgraph/app.dart';

void main() {
  setupServiceLocator();
  runApp(
    Provider<Flavor>.value(
      value: Flavor.prod,
      child: MyApp(),
    ),
  );
}

import 'package:covidgraph/serviceLocator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covidgraph/flavor.dart';
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

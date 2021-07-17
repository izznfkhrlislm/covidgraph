import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:covidgraph/flavor.dart';
import 'package:covidgraph/app.dart';

void main() => runApp(
  Provider<Flavor>.value(
    child: MyApp(),
    value: Flavor.develop,
  ),
);
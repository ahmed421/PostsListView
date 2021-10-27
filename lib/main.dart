import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:listview_bloc/simple_bloc_observer.dart';

import 'app.dart';
void main() {
  Bloc.observer=SimpleBlocObserver();
  runApp( App());

}


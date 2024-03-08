import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_real_estate/home/bloc/real_estate_bloc.dart';

import 'home/home_page.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => RealEstateBloc()..add(GetAllLandEvent()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mars Real Estate App',
      home: HomePage(),
    );
  }
}

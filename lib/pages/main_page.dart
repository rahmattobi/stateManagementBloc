import 'package:belajar_bloc/bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, bool>(
      bloc: context.read<ThemeBloc>(),
      builder: (context, state) {
        return MaterialApp(
          theme: state == true ? ThemeData.light() : ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
        );
      },
    );
  }
}

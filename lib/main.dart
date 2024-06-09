import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square_repos/Features/home/presentation/manager/cubit/repository_cubit.dart';
import 'package:square_repos/Features/home/presentation/views/home_view.dart';
import 'package:square_repos/core/utils/api_service.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => RepositoryCubit(ApiService(Dio())),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
    );
  }
}

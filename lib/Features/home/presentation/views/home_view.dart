import 'package:flutter/material.dart';
import 'package:square_repos/Features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Square Repos'),
      ),
      body: const HomeViewBody(),
    );
  }
}

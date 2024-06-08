import 'package:flutter/material.dart';
import 'package:square_repos/Features/home/presentation/views/widgets/home_widget.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: defaultFormField(
            controller: searchController,
            type: TextInputType.text,
            validate: (value) {
              if (value == null || value.isEmpty) {
                return 'search must not be empty';
              }
              return null;
            },
            label: 'Search',
            prefix: Icons.search,
          ),
        ),
        Expanded(
          child: repoBuilder(),
        ),
      ],
    );
  }
}

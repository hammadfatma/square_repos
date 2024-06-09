import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:square_repos/Features/home/data/models/reprository_model/reprository_model.dart';
import 'package:square_repos/core/utils/api_service.dart';
part 'repository_state.dart';

class RepositoryCubit extends Cubit<RepositoryStates> {
  RepositoryCubit(this.apiService) : super(RepositoryInitialState());
  static RepositoryCubit get(context) => BlocProvider.of(context);
  final ApiService apiService;
  List<ReprositoryModel> repos = [];
  Future<void> fetchRepositories() async {
    emit(RepositoryLoadingState());
    await apiService.getRepos().then((value) {
      var data =
          value.map((element) => ReprositoryModel.fromJson(element)).toList();
      repos = data;
      emit(RepositorySuccessState());
    }).catchError((error) {
      emit(RepositoryFailureState());
    });
  }
}

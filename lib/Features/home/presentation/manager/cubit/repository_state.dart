part of 'repository_cubit.dart';

@immutable
abstract class RepositoryStates {}

class RepositoryInitialState extends RepositoryStates {}

class RepositoryLoadingState extends RepositoryStates {}

class RepositorySuccessState extends RepositoryStates {}

class RepositoryFailureState extends RepositoryStates {}

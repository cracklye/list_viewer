import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_viewer_test/bloc/test_bloc_event.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';
import 'package:list_viewer_test/bloc/test_case.dart';
import 'package:list_viewer_test/test_definition.dart';

class TestBloc extends Bloc<TestBlocEvent, TestBlocState> {
  TestBloc(List<TestGroup> tests, TestEnvironment env)
      : super(TestBlocState(tests, env)) {
    on<TestBlocEventSelectEnvironment>(_onTestBlocEventSelectEnvironment);
    on<TestBlocEventSelectTestCase>(_onTestBlocEventSelectTestCase);
  }

  Future<void> _onTestBlocEventSelectEnvironment(
      TestBlocEventSelectEnvironment event, Emitter<TestBlocState> emit) async {
    emit(state.copy(testEnvironment: event.environment));
  }

  Future<void> _onTestBlocEventSelectTestCase(
      TestBlocEventSelectTestCase event, Emitter<TestBlocState> emit) async {}
}

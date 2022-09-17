

import 'package:list_viewer_test/bloc/test_bloc_state.dart';
import 'package:list_viewer_test/bloc/test_case.dart';
import 'package:list_viewer_test/test_definition.dart';

class TestBlocEvent{

}


class TestBlocEventSelectEnvironment extends TestBlocEvent{
  final TestEnvironment environment; 
  TestBlocEventSelectEnvironment(this.environment);

}class TestBlocEventSelectTestCase extends TestBlocEvent{
  final TestGroup? testGroup; 
  final TestDefinition? test; 
  TestBlocEventSelectTestCase({this.test, this.testGroup});

}
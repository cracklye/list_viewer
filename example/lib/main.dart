import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:list_viewer_test/app/cupertino_app.dart';
import 'package:list_viewer_test/app/fluent_app.dart';
import 'package:list_viewer_test/app/macos_app.dart';
import 'package:list_viewer_test/app/material_app.dart';
import 'package:list_viewer_test/app/yaru_app.dart';
import 'package:list_viewer_test/bloc/test_bloc.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_viewer_test/tests/test_cases_tests.dart';
import 'package:list_viewer_test/test_definition.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:window_manager/window_manager.dart';

import 'bloc/test_bloc_state.dart';

bool get isDesktop {
  if (kIsWeb) return false;
  return [
    TargetPlatform.windows,
    TargetPlatform.linux,
    TargetPlatform.macOS,
  ].contains(defaultTargetPlatform);
}

void main() async {
  Map<TestEnvironment, Widget Function(BuildContext)> map = {
    TestEnvironment.cuppachino: (BuildContext context) => CupertinoStoreApp(),
    TestEnvironment.material: (BuildContext context) => AppMaterial(),
    TestEnvironment.yaru: (BuildContext context) => AppYaru(),
    TestEnvironment.fluent: (BuildContext context) => AppFluent(),
    TestEnvironment.macos: (BuildContext context) => AppMacos(),
  };

  /// Checks if the current environment is a desktop environment.

  WidgetsFlutterBinding.ensureInitialized();

  // if it's on the web, windows or android, load the accent color
  if (kIsWeb ||
      [TargetPlatform.windows, TargetPlatform.android]
          .contains(defaultTargetPlatform)) {
    //SystemTheme.accentColor.load();
  }

  setPathUrlStrategy();

  if (isDesktop) {
    //await flutter_acrylic.Window.initialize();
    // await WindowManager.instance.ensureInitialized();
    // windowManager.waitUntilReadyToShow().then((_) async {
    //   await windowManager.setTitleBarStyle(
    //     TitleBarStyle.hidden,
    //     windowButtonVisibility: false,
    //   );
    //   await windowManager.setSize(const Size(755, 545));
    //   await windowManager.setMinimumSize(const Size(755, 545));
    //   await windowManager.center();
    //   await windowManager.show();
    //   await windowManager.setPreventClose(true);
    //   await windowManager.setSkipTaskbar(false);
    // });
  }

  runApp(TestApp(map, allTests));
}

class TestApp extends StatelessWidget {
  final Map<TestEnvironment, Widget Function(BuildContext)> testEnvironments;
  final List<TestGroup> tests;

  const TestApp(this.testEnvironments, this.tests, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TestBloc(tests, testEnvironments.keys.first),
      child: SelectEnvironment(testEnvironments),
    );
  }
}

class SelectEnvironment extends StatelessWidget {
  const SelectEnvironment(this.testEnvironments, {Key? key}) : super(key: key);
  final Map<TestEnvironment, Widget Function(BuildContext)> testEnvironments;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TestBloc, TestBlocState>(builder: (context, state) {
      //Get the matching..

      var fn = testEnvironments[state.testEnvironment];
      if (fn != null) {
        return fn(context);
      }
      return Text("Unknown type");
      // return widget here based on BlocA's state
    });
  }
}

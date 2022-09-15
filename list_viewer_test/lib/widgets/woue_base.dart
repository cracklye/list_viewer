import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/cupertino.dart' as c;

import 'package:flutter/material.dart' as m;
import 'package:flutter/widgets.dart' as w;
import 'package:list_viewer_test/bloc/test_bloc_state.dart';


abstract class WOUEBase {
  static TestEnvironment environment = TestEnvironment.material;

  static bool isFluent(BuildContext context) {
    if (FluentTheme.maybeOf(context) == null) {
      return false;
    }
    return true;
  }

  static bool isMaterial(BuildContext context) {
    return environment == TestEnvironment.material;
  }

  static bool isMacos(BuildContext context) {
    return environment == TestEnvironment.macos;
  }

  static bool isCupertino(BuildContext context) {
    return environment == TestEnvironment.cuppachino;
  }

  Widget build(BuildContext context) {
    if (isMaterial(context)) {
      return buildMaterial(context);
    } else if (isFluent(context)) {
      return buildFluent(context);
    } else if (isCupertino(context)) {
      return buildCupertino(context);
    } else if (isMacos(context)) {
      return buildMacos(context);
    }
    return Container();
  }

  Widget buildMaterial(BuildContext context);
  Widget buildFluent(BuildContext context);
  Widget buildCupertino(BuildContext context);
  Widget buildMacos(BuildContext context);
}

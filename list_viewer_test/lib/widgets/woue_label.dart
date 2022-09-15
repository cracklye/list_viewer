import 'package:flutter/widgets.dart';
import 'package:list_viewer_test/widgets/woue_base.dart';
import 'package:list_viewer_test/widgets/woue_button.dart';

class WOUELabel extends StatelessWidget with WOUEBase {
  const WOUELabel({Key? key}) : super(key: key);

  @override
  Widget buildCupertino(BuildContext context) {
    return const Text("Cupertino");
  }

  @override
  Widget buildFluent(BuildContext context) {
    return const Text("Fluent");
  }

  @override
  Widget buildMacos(BuildContext context) {
    return const Text("Macos");
  }

  @override
  Widget buildMaterial(BuildContext context) {
    return const Text("Material");
  }
}

import 'package:fluent_ui/fluent_ui.dart';

class WindowsTestPageEmpty extends StatelessWidget {
  const WindowsTestPageEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldPage(content: buildContent(context));
  }

  Widget buildContent(BuildContext context) {
    return const Text("Empty");
  }
}

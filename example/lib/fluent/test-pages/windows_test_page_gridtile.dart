import 'package:fluent_ui/fluent_ui.dart';

class WindowsTestPageGridTile extends StatefulWidget {
  const WindowsTestPageGridTile(
      {Key? key, required this.tests, required this.title})
      : super(key: key);

  final List<Widget Function(BuildContext, int)> tests;
  final String title;
  @override
  State<WindowsTestPageGridTile> createState() =>
      _WindowsTestPageGridTileState();
}

class _WindowsTestPageGridTileState extends State<WindowsTestPageGridTile> {
  int currentIndex = 0;
  double currentWidth = 800;
  double crossAxisCount = 2.0;

  @override
  Widget build(BuildContext context) {
    final Orientation orientation = MediaQuery.of(context).orientation;
    return
        // ScaffoldPage(
        //     header: Text(widget.title),
        //     content:
        Row(
      children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                InfoLabel(
                    label: 'No of Columns ${crossAxisCount.toInt()}',
                    child: Slider(
                        max: 10.0,
                        min: 1.0,
                        value: crossAxisCount,
                        onChanged: (value) => setState(() {
                              crossAxisCount = value;
                            }))),
                InfoLabel(
                    label: 'Width ${currentWidth.toInt()}',
                    child: Slider(
                        max: 1000.0,
                        min: 50.0,
                        value: currentWidth,
                        onChanged: (value) => setState(() {
                              currentWidth = value;
                            }))),
              ],
            )),
        SizedBox(
            height: double.infinity,
            width: currentWidth,
            child: GridView.count(
              crossAxisCount: crossAxisCount
                  .toInt(), // (orientation == Orientation.portrait) ? 2 : 3,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
              childAspectRatio:
                  (orientation == Orientation.portrait) ? 1.0 : 1.3,
              children: widget.tests.map<Widget>((callfunction) {
                return callfunction(context, 0);
              }).toList(),
            )),
      ],
    );
  }
}

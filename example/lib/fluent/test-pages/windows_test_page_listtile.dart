import 'package:fluent_ui/fluent_ui.dart';

class WindowsTestPageListTile extends StatefulWidget {
  const WindowsTestPageListTile(
      {Key? key, required this.tests, required this.title})
      : super(key: key);

  final List<Widget Function(BuildContext, int)> tests;
  final String title;
  @override
  State<WindowsTestPageListTile> createState() =>
      _WindowsTestPageListTileState();
}

List<int> tabWidths = [100, 200, 400, 600, 800];

class _WindowsTestPageListTileState extends State<WindowsTestPageListTile> {
  int currentIndex = 0;
  double currentWidth = 500;

  @override
  Widget build(BuildContext context) {
   // final Orientation orientation = MediaQuery.of(context).orientation;
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
        Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: SizedBox(
                height: double.infinity,
                width: currentWidth,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: widget.tests.length,
                    itemBuilder: (context, index) => //Text("Hi")
                        widget.tests[index](context, index))))
        // GridView.count(
        //   crossAxisCount: crossAxisCount
        //       .toInt(), // (orientation == Orientation.portrait) ? 2 : 3,
        //   mainAxisSpacing: 4.0,
        //   crossAxisSpacing: 4.0,
        //   padding: const EdgeInsets.all(4.0),
        //   childAspectRatio:
        //       (orientation == Orientation.portrait) ? 1.0 : 1.3,
        //   children: widget.tests.map<Widget>((callfunction) {
        //     return callfunction(context, 0);
        //   }).toList(),
        // ))
        ,
      ],
    );
  }

  Widget buildOld(BuildContext context) {
    return
        // ScaffoldPage(
        //     header: Text(widget.title),
        //     content:

        SizedBox(
      height: 600,
      child: TabView(
        closeButtonVisibility: CloseButtonVisibilityMode.never,
        currentIndex: currentIndex,
        onChanged: (index) => setState(() => currentIndex = index),
        tabs: List.generate(tabWidths.length, (index) {
          return Tab(
            text: Text('Width ${tabWidths[index]}'),
            //closeIcon: FluentIcons.chrome_close,
          );
        }),
        bodies: List.generate(
            tabWidths.length, (index) => buildTab(context, index)),
      ),
      // )
    );
  }

  Widget buildTab(BuildContext context, int index) {
    int width = tabWidths[index];

    return Container(
        color: Colors.grey[10],
        width: width.toDouble(),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget.tests.length,
            itemBuilder: (context, index) => //Text("Hi")
                widget.tests[index](context, index)));
  }
}

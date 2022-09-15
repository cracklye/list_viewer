import 'package:flutter/material.dart';

enum ListViewType { list, grid, detail }

class ListViewer<T> extends StatefulWidget {
  final List<T> values;
  final List<ListViewType> availableViewTypes;
  final ListViewType defaultViewType;

  final Widget Function(BuildContext context, T item)? buildListItem;
  final Widget Function(BuildContext context, T item)? buildGridItem;
  final Widget Function(BuildContext context, T item)? buildDataTable;
  final bool Function(T item, String filter)? filter;

  final Widget Function(BuildContext context)? buildNoRows;

  final bool isLoading;

  const ListViewer({
    Key? key,
    required this.values,
    this.defaultViewType = ListViewType.list,
    this.availableViewTypes = ListViewType.values,
    this.buildDataTable,
    this.buildListItem,
    this.buildGridItem,
    this.buildNoRows,
    this.filter,
    this.isLoading = false,
  }) : super(key: key);

  @override
  State<ListViewer<T>> createState() => _ListViewState();
}

class _ListViewState<T> extends State<ListViewer<T>> {
  ListViewType listViewType = ListViewType.list;
  double columns = 4;

  @override
  void initState() {
    super.initState();
    listViewType = widget.defaultViewType;
  }

  @override
  Widget build(BuildContext context) {
    //Build header....
    return Column(children: [
      buildHeader(context),
      buildContent(context),
    ]);
  }

  Widget buildHeader(BuildContext context) {
    List<Widget> allItems = [];
    allItems.addAll(buildHeaderButtons(context));
    allItems.add(buildSlider(context));
    allItems.add(Text("$columns"));
    return Column(
      children: allItems,
    );
  }

  Widget buildSearch(BuildContext context) {
    return Text("Search");
  }

  Widget buildSlider(BuildContext context) {
    //TODO need to handle separate material and fluent...
    // return Slider(
    //     min: 1,
    //     max: 8,
    //     divisions: 7,
    //     value: columns,
    //     onChanged: (val) => {setColumnsValue(val)});
    return Text("Need a slider");
  }

  List<Widget> buildHeaderButtons(BuildContext context) {
    List<Widget> buttons = [];
    for (var type in widget.availableViewTypes) {
      buttons.add(ElevatedButton(
          onPressed: type == listViewType
              ? null
              : () {
                  setViewType(type);
                },
          child: Text(type.toString())));
    }
    return buttons;
  }

  void setColumnsValue(double value) {
    setState(() {
      columns = value;
    });
  }

  void setViewType(ListViewType type) {
    setState(() {
      listViewType = type;
    });
  }

  Widget buildContent(BuildContext context) {
    if (widget.values.isEmpty) {
      return buildEmpty(context);
    }

    if (listViewType == ListViewType.list) {
      return buildList(context);
    } else if (listViewType == ListViewType.grid) {
      return buildGrid(context);
    } else if (listViewType == ListViewType.detail) {
      return buildDetails(context);
    }

    return Text("Hi");
  }

  Widget buildList(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      children: widget.values
          .map<Widget>((e) => widget.buildListItem != null
              ? widget.buildListItem!(context, e)
              : _defaultBuildListItem(context, e))
          .toList(),
    );
  }

  Widget buildGrid(BuildContext context) {
    return GridView.count(
        shrinkWrap: true,
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: columns.toInt(),
        children: widget.values
            .map<Widget>((e) => widget.buildGridItem != null
                ? widget.buildGridItem!(context, e)
                : _defaultBuildGridItem(context, e))
            .toList());
  }

  Widget buildDetails(BuildContext context) {
    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Age',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Role',
              style: TextStyle(fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Sarah')),
            DataCell(Text('19')),
            DataCell(Text('Student')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Janine')),
            DataCell(Text('43')),
            DataCell(Text('Professor')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('William')),
            DataCell(Text('27')),
            DataCell(Text('Associate Professor')),
          ],
        ),
      ],
    );
  }

  Widget buildEmpty(BuildContext context) {
    if (widget.buildNoRows != null) return widget.buildNoRows!(context);
    return Text("No rows have been found");
  }

  Widget _defaultBuildTable(BuildContext context, T item) {
    return Text("Item");
  }

  Widget _defaultBuildListItem(BuildContext context, T item) {
    return Container(
      height: 50,
      child: Center(child: Text(item.toString())),
    );
  }

  Widget _defaultBuildGridItem(BuildContext context, T item) {
    return Container(
      padding: const EdgeInsets.all(8),
      //color: Colors.teal[500],
      child: Text(item.toString()),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:list_viewer_test/app/test_tool_bar.dart';
import 'package:list_viewer_test/bloc/test_bloc.dart';
import 'package:list_viewer_test/bloc/test_bloc_event.dart';
import 'package:list_viewer_test/bloc/test_bloc_state.dart';
import 'package:list_viewer_test/framework/test_widget_macos.dart';
import 'package:macos_ui/macos_ui.dart';

class AppMacos extends StatelessWidget {
  const AppMacos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This app is designed only to work vertically, so we limit
    // orientations to portrait up and down.
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MacosApp(
      title: 'macos_ui Widget Gallery',
      theme: MacosThemeData.light(),
      darkTheme: MacosThemeData.dark(),

      //themeMode: appTheme.mode,
      debugShowCheckedModeBanner: false,
      home: const AppMacosHomePage(),
    );
  }
}

class AppMacosHomePage extends StatelessWidget {
  const AppMacosHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MacosWindow(
        child: MacosScaffold(
      toolBar: ToolBar(
        title: Text("Test Harness"),
        leading: Text("Test"),
        actions: [
          ToolBarIconButton(
              label: "Test",
              icon: Icon(Icons.android),
              showLabel: false,
              onPressed: () => BlocProvider.of<TestBloc>(context).add(
                  TestBlocEventSelectEnvironment(TestEnvironment.material))),
          ToolBarIconButton(
              label: "Test",
              icon: Icon(Icons.window_sharp),
              showLabel: false,
              onPressed: () => BlocProvider.of<TestBloc>(context)
                  .add(TestBlocEventSelectEnvironment(TestEnvironment.fluent))),
          ToolBarIconButton(
            label: "Test",
            icon: Icon(Icons.apple),
            showLabel: false,
            onPressed: () => BlocProvider.of<TestBloc>(context)
                .add(TestBlocEventSelectEnvironment(TestEnvironment.macos)),
          ),
          ToolBarIconButton(
              label: "Test",
              icon: Icon(Icons.mobile_friendly_sharp),
              showLabel: false,
              onPressed: () => BlocProvider.of<TestBloc>(context).add(
                  TestBlocEventSelectEnvironment(TestEnvironment.cuppachino))),

                    ToolBarIconButton(
              label: "Test",
              icon: Icon(Icons.library_books_sharp),
              showLabel: false,
              onPressed: () => BlocProvider.of<TestBloc>(context).add(
                  TestBlocEventSelectEnvironment(TestEnvironment.yaru))),

        ],
      ),
      children: [
        ContentArea(
            builder: ((context, scrollController) => TestPageWidgetMacos()))
      ],
    ));
  }
}

// class WidgetGallery extends StatefulWidget {
//   const WidgetGallery({super.key});

//   @override
//   State<WidgetGallery> createState() => _WidgetGalleryState();
// }

// class _WidgetGalleryState extends State<WidgetGallery> {
//   double ratingValue = 0;
//   double sliderValue = 0;
//   bool value = false;

//   int pageIndex = 0;

//   late final searchFieldController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return PlatformMenuBar(
//       menus: const [
//         PlatformMenu(
//           label: 'macos_ui Widget Gallery',
//           menus: [
//             PlatformProvidedMenuItem(
//               type: PlatformProvidedMenuItemType.about,
//             ),
//             PlatformProvidedMenuItem(
//               type: PlatformProvidedMenuItemType.quit,
//             ),
//           ],
//         ),
//         PlatformMenu(
//           label: 'View',
//           menus: [
//             PlatformProvidedMenuItem(
//               type: PlatformProvidedMenuItemType.toggleFullScreen,
//             ),
//           ],
//         ),
//         PlatformMenu(
//           label: 'Window',
//           menus: [
//             PlatformProvidedMenuItem(
//               type: PlatformProvidedMenuItemType.minimizeWindow,
//             ),
//             PlatformProvidedMenuItem(
//               type: PlatformProvidedMenuItemType.zoomWindow,
//             ),
//           ],
//         ),
//       ],
//       child: MacosWindow(
//         sidebar: Sidebar(
//           top: MacosSearchField(
//             placeholder: 'Search',
//             controller: searchFieldController,
//             onResultSelected: (result) {
//               switch (result.searchKey) {
//                 case 'Buttons':
//                   setState(() {
//                     pageIndex = 0;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 case 'Indicators':
//                   setState(() {
//                     pageIndex = 1;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 case 'Fields':
//                   setState(() {
//                     pageIndex = 2;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 case 'Colors':
//                   setState(() {
//                     pageIndex = 3;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 case 'Dialogs and Sheets':
//                   setState(() {
//                     pageIndex = 5;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 case 'Toolbar':
//                   setState(() {
//                     pageIndex = 6;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 case 'Selectors':
//                   setState(() {
//                     pageIndex = 7;
//                     searchFieldController.clear();
//                   });
//                   break;
//                 default:
//                   searchFieldController.clear();
//               }
//             },
//             results: const [
//               SearchResultItem('Buttons'),
//               SearchResultItem('Indicators'),
//               SearchResultItem('Fields'),
//               SearchResultItem('Colors'),
//               SearchResultItem('Dialogs and Sheets'),
//               SearchResultItem('Toolbar'),
//               SearchResultItem('Selectors'),
//             ],
//           ),
//           minWidth: 200,
//           builder: (context, controller) {
//             return SidebarItems(
//               currentIndex: pageIndex,
//               onChanged: (i) => setState(() => pageIndex = i),
//               scrollController: controller,
//               itemSize: SidebarItemSize.large,
//               items: [
//                 const SidebarItem(
//                   // leading: MacosIcon(CupertinoIcons.square_on_circle),
//                   leading: MacosImageIcon(
//                     AssetImage(
//                       'assets/sf_symbols/button_programmable_2x.png',
//                     ),
//                   ),
//                   label: Text('Buttons'),
//                 ),
//                 const SidebarItem(
//                   leading: MacosImageIcon(
//                     AssetImage(
//                       'assets/sf_symbols/lines_measurement_horizontal_2x.png',
//                     ),
//                   ),
//                   label: Text('Indicators'),
//                 ),
//                 const SidebarItem(
//                   leading: MacosImageIcon(
//                     AssetImage(
//                       'assets/sf_symbols/character_cursor_ibeam_2x.png',
//                     ),
//                   ),
//                   label: Text('Fields'),
//                 ),
//                 SidebarItem(
//                   leading: const MacosIcon(CupertinoIcons.folder),
//                   label: const Text('Disclosure'),
//                   trailing: Text(
//                     '2',
//                     style: TextStyle(
//                       color: MacosTheme.brightnessOf(context) == Brightness.dark
//                           ? MacosColors.tertiaryLabelColor.darkColor
//                           : MacosColors.tertiaryLabelColor,
//                     ),
//                   ),
//                   disclosureItems: [
//                     const SidebarItem(
//                       leading: MacosImageIcon(
//                         AssetImage(
//                           'assets/sf_symbols/rectangle_3_group_2x.png',
//                         ),
//                       ),
//                       label: Text('Colors'),
//                     ),
//                     const SidebarItem(
//                       leading: MacosIcon(CupertinoIcons.infinite),
//                       label: Text('Item 3'),
//                     ),
//                   ],
//                 ),
//                 const SidebarItem(
//                   leading: MacosIcon(CupertinoIcons.square_on_square),
//                   label: Text('Dialogs & Sheets'),
//                 ),
//                 const SidebarItem(
//                   leading: MacosIcon(CupertinoIcons.macwindow),
//                   label: Text('Toolbar'),
//                 ),
//                 const SidebarItem(
//                   leading: MacosImageIcon(
//                     AssetImage(
//                       'assets/sf_symbols/filemenu_and_selection_2x.png',
//                     ),
//                   ),
//                   label: Text('Selectors'),
//                 ),
//                 const SidebarItem(
//                   leading: MacosIcon(CupertinoIcons.uiwindow_split_2x1),
//                   label: Text('TabView'),
//                 ),
//               ],
//             );
//           },
//           bottom: const MacosListTile(
//             leading: MacosIcon(CupertinoIcons.profile_circled),
//             title: Text('Tim Apple'),
//             subtitle: Text('tim@apple.com'),
//           ),
//         ),
//         endSidebar: Sidebar(
//           startWidth: 200,
//           minWidth: 200,
//           maxWidth: 300,
//           shownByDefault: false,
//           builder: (context, scrollController) {
//             return const Center(
//               child: Text('End Sidebar'),
//             );
//           },
//         ),
//         child: IndexedStack(
//           index: pageIndex,
//           children: pages,
//         ),
//       ),
//     );
//   }
// }

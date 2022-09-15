import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:list_viewer_test/app/test_tool_bar.dart';
import 'package:list_viewer_test/main.dart';
import 'package:list_viewer_test/material/test-pages/windows_test_page_empty.dart';
import 'package:list_viewer_test/page.dart';

class AppMaterial extends StatelessWidget {
  const AppMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material Test App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material Test App'),
          actions: [
            TestToolBar()
          ],
        ),
        body: const Center(
          child: MaterialTestPage(),
        ),
      ),
    );
  }
}

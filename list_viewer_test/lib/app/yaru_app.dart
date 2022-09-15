import 'package:flutter/material.dart';
import 'package:list_viewer_test/main.dart';
import 'package:list_viewer_test/material/test-pages/windows_test_page_empty.dart';
import 'package:list_viewer_test/page.dart';
import 'package:yaru/yaru.dart';

class AppYaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => YaruTheme(
          data: AppTheme.of(context),
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Material Test App'),
            ),
            body: const Center(
              child: MaterialTestPage(),
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppTheme {
  static YaruThemeData of(BuildContext context) {
    return SharedAppData.getValue(context, 'theme', () => YaruThemeData());
  }

  static void apply(
    BuildContext context, {
    YaruVariant? variant,
    bool? highContrast,
    ThemeMode? themeMode,
  }) {
    SharedAppData.setValue(
      context,
      'theme',
      AppTheme.of(context).copyWith(
        themeMode: themeMode,
        variant: variant,
        highContrast: highContrast,
      ),
    );
  }
}



// class AppMaterial extends StatelessWidget {
//   const AppMaterial({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Material Test App',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Material Test App'),
//         ),
//         body: const Center(
//           child: MaterialTestPage(),
//         ),
//       ),
//     );
//   }
// }

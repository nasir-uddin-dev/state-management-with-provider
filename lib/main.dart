// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:state_management_with_provider/counter_notifier.dart';
// import 'package:state_management_with_provider/screens/my_home_page.dart';
// import 'package:state_management_with_provider/theme_controller.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   CounterNotifier counterNotifier = CounterNotifier();
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//         providers: [
//           ChangeNotifierProvider(
//             create: (_) => ThemeController(),
//           ),
//           ChangeNotifierProvider(create: (_) => counterNotifier)
//         ],
//         child:
//             Consumer<ThemeController>(builder: (context, themeController, _) {
//           return MaterialApp(
//               debugShowCheckedModeBanner: false,
//               title: "Counter App",
//               theme: ThemeData(
//                   brightness: Brightness.light, colorSchemeSeed: Colors.blue),
//               home: HomePage(),
//               themeMode: themeController.themeMode,
//               darkTheme: ThemeData(
//                 brightness: Brightness.dark,
//               ));
//         }));
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:state_management_with_provider/provider/todo_provider.dart';
// import 'package:state_management_with_provider/todo_screen/todo_home.dart';
//
// void main() {
//   runApp(
//       MultiProvider(
//         providers: [
//         ChangeNotifierProvider(create: (_) =>ToDoProvider()),
//       ],
//         child: MyApp(),)
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: TodoHome(),
//     );
//   }
// }

//------------------------------------- ProductListScreen-----------------------

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/product_app/product_list_screen.dart';
import 'package:state_management_with_provider/product_app/product_service.dart';

void main() {
  runApp(const ProductListApp());
}

class ProductListApp extends StatelessWidget {
  const ProductListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductListProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          colorSchemeSeed: Colors.blueAccent,
          filledButtonTheme: FilledButtonThemeData(

          )
        ),
        home: ProductListScreen(),
      ),
    );
  }
}

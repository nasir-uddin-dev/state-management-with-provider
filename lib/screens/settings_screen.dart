import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/counter_notifier.dart';
import 'package:state_management_with_provider/theme_controller.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Center(
        child: Column(
          children: [
            Consumer<CounterNotifier>(
              builder: (context, controller, child) {
                return Text('${controller.counter}');
              },
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context.read<CounterNotifier>().decrement();
                    },
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      context.read<CounterNotifier>().increment();
                      setState(() {});
                    },
                    icon: Icon(Icons.add)),

                IconButton(onPressed: () {
                  context.read<ThemeController>().toggleThemeMode();
                }, icon: Icon(Icons.sunny))
              ],
            )
          ],
        ),
      ),
    );
  }
}

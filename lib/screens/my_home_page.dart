import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_with_provider/counter_notifier.dart';
import 'package:state_management_with_provider/screens/profile_screen.dart';
import 'package:state_management_with_provider/screens/settings_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CounterNotifier>(
              builder: ( context, controller, child) {
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
                    onPressed: context.read<CounterNotifier>().decrement,
                    icon: Icon(Icons.remove)),
                IconButton(
                    onPressed: context.read<CounterNotifier>().increment,
                    icon: Icon(Icons.add)),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SettingsScreen()));
            },
            child: Icon(Icons.arrow_forward_ios),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: Icon(Icons.person),
          ),
        ],
      ),
    );
  }
}

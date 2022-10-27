// ignore_for_file: must_be_immutable
///////////////////////////////////////////////////////////////
///                                                         ///
///                                                         ///
///                                                         ///
///             ReUsable Counter Screen                     ///
///                                                         ///
///                  Abid Wali                              ///
///                                                         ///
///                                                         ///
///                                                         ///
///////////////////////////////////////////////////////////////




import 'package:flutter/material.dart';
import 'package:flutter_counter_app/count_provider.dart';
import 'package:provider/provider.dart';

class CounterScreens extends StatefulWidget {
  const CounterScreens({super.key});

  @override
  State<CounterScreens> createState() => _CounterScreensState();
}

class _CounterScreensState extends State<CounterScreens> {
  @override
  Widget build(BuildContext context) {
    debugPrint("Debug 1");
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Displaying The Index of Counter Screen/ Navigation Bar  Button
            Consumer<CountProvider>(builder: (context, value, child) {
              return Text("Counter Screen ${value.selectedItem}");
            }),
            ////////////////////////////////////////////////////////// ///
            const SizedBox(height: 10),
            // Displaying the counter increment here
            Consumer<CountProvider>(builder: (context, value, child) {
              return Text(
                value.count.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            ////////////////////////////////////////////////////////// ///
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                countProvider.setCount();
              },
              child: const Text("Increment Me!"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_counter_app/count_provider.dart';
import 'package:flutter_counter_app/counter_screen_widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountProvider(),
      child: MaterialApp(
        title: 'Counter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Counter App"),
        centerTitle: true,
      ),


      //Here i am displaying the Counter screen while the user presses navigator bar item
      body: const CounterScreens(),

      ////////////////////////////////////////////////////////// ///
     

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.countertops), label: "Counter One"),
          BottomNavigationBarItem(
              icon: Icon(Icons.countertops), label: "Counter Two"),
          BottomNavigationBarItem(
              icon: Icon(Icons.countertops), label: "Counter Three"),
        ],

        // Changing the index of nav bar icon with provider
        currentIndex: countProvider.selectedItem,
        ////////////////////////////////////////////////////////// ///
   
        // Changing the value of Counter to zero while pressing nav bar icon and setting new value of index
        onTap: (setValue) {
          
          setState(() {
            countProvider.setCounterValue();
            countProvider.setIndexrValue(setValue);
          });
          
        },
        ////////////////////////////////////////////////////////// ///
      ),
    );
  }
}

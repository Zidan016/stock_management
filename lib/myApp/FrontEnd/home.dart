import 'package:flutter/material.dart';
import 'package:stock_management/myApp/FrontEnd/action.dart';
import 'package:stock_management/myApp/FrontEnd/data.dart';
import 'package:stock_management/myApp/FrontEnd/history.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  final List<Widget> body = const[
    Data(),
    ActionV(),
    History()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stock Management'),
        automaticallyImplyLeading: false,
        leading: Builder(
          builder: (BuildContext context){
            return IconButton(
              onPressed: (){
                Scaffold.of(context).openDrawer();
              }, 
              icon: Icon(Icons.menu), color: Colors.white,
            );
          }
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [

            ListTile(
              leading: const Icon(Icons.storage_outlined),
              title: const Text("Data"),
              selected: currentIndex == 0,
              onTap: () {
                setState(() {
                  currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 6,),

            ListTile(
              leading: const Icon(Icons.pending_actions_outlined),
              title: const Text("Management"),
              selected: currentIndex == 1,
              onTap: () {
                setState(() {
                  currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 6,),

            ListTile(
              leading: const Icon(Icons.history_edu_outlined),
              title: const Text("History Stock"),
              selected: currentIndex == 2,
              onTap: () {
                setState(() {
                  currentIndex = 2;
                });
                Navigator.pop(context);
              },
            ),

            const SizedBox(height: 6,),

          ],
        ),
      ),

      body: body[currentIndex],
    );
  }
}
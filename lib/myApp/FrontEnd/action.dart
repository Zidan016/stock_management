import 'package:flutter/material.dart';
import 'package:stock_management/myApp/FrontEnd/stockInV.dart';
import 'package:stock_management/myApp/FrontEnd/stockOutV.dart';

class ActionV extends StatefulWidget {
  const ActionV({super.key});

  @override
  State<ActionV> createState() => _ActionVState();
}

class _ActionVState extends State<ActionV> with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController?.addListener((){
      Stockinv();
    });
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      Center(
        child: Padding(
          padding: EdgeInsets.all(25),
          child: DefaultTabController(
            length: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TabBar(
                  controller: tabController,
                  tabs: const[
                  Tab(
                    text: 'Stock In',
                  ),
                  Tab(
                    text: 'Stock Out',
                  ),
                ]),
                Expanded(child: TabBarView(
                  controller: tabController,
                  children: const [
                    Stockinv(),
                    Stockoutv()
                  ]
                  )
                )
              ],
            )
          )
        ),
      ),
    );
  }
}
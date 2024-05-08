import 'package:flutter/material.dart';
import 'package:varsata/widget/common_widget.dart';

class toptabPage extends StatefulWidget {
  const toptabPage({super.key});

  @override
  State<toptabPage> createState() => _toptabPageState();
}

class _toptabPageState extends State<toptabPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,
          child:  Scaffold(
            body: Column(
              children: [
               const TabBar(
                   indicatorColor: Colors.black,
                   indicatorSize: TabBarIndicatorSize.tab,
                   automaticIndicatorColorAdjustment: true,
                   tabs: [
                  Tab(icon:Icon(
                    Icons.home,
                    color: Colors.deepPurple,
                  ),),
                  Tab(icon:Icon(
                    Icons.search,
                    color: Colors.deepPurple,
                  ),),
                  Tab(icon:Icon(
                    Icons.music_note,
                    color: Colors.deepPurple,
                  ),)
                ]),
                Expanded(
                    child: TabBarView(
                      children: [
                        Container(
                          color:Colors.purpleAccent,
                          child: Text('1st Tab'),
                        ),
                        Container(
                          color:Colors.purple,
                          child: Text('2nd Tab'),
                        ),
                        Container(
                          color:Colors.deepPurple,
                          child: Text('3rd Tab'),
                        )
                      ],
                    ))
              ],
            ) ,
          )
      );

  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varsata/controller/bottomtab_controller.dart';

class bottomtab_navigation extends StatefulWidget {
  const bottomtab_navigation({super.key});

  @override
  State<bottomtab_navigation> createState() => _bottomtab_navigationState();
}

class _bottomtab_navigationState extends State<bottomtab_navigation> {
  final controllerr = Get.put(bottomtabController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: false,
        title: const Text('Varsata', ),

        // actions: [
        //   Builder(
        //     builder: (BuildContext context) {
        //       return Padding(
        //           padding: EdgeInsets.only(right: 20),
        //           child: IconButton(
        //             icon:Icon(Icons.menu),
        //               onPressed: () {
        //                 Scaffold.of(context).openDrawer();
        //               },
        //               tooltip: MaterialLocalizations.of(context)
        //                   .openAppDrawerTooltip,
        //             ),
        //           );
        //     },
        //   ),
        // ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                // otherAccountsPictures: [
                //   Image.asset('assets/images/community_3.png',fit: BoxFit.contain,)
                // ],
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('assets/images/community_3.png',fit: BoxFit.contain,)
                )),
                accountName: Padding(
                  padding: EdgeInsets.only(top: 10),child:  Text("John Doe",style: TextStyle(color: Colors.white,fontSize: 18),)), 
                accountEmail:Text( "johnaddd@doe.com",style: TextStyle(color: Colors.white,fontSize: 14),),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(image: AssetImage('assets/images/backimage.jpg',),fit: BoxFit.cover),
                ),
                ),
            ListTile(
              leading: Icon(Icons.home,),
              title: Padding(
                  padding: EdgeInsets.only(left: 10),child:Text("Home")),
              onTap: () {
                controllerr.currentIndex.value = 0;
              },
              // trailing: Icon(Icons.,
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Padding(
                  padding: EdgeInsets.only(left: 10),child:Text("Shop")),
              onTap: () {
                controllerr.currentIndex.value = 1;
              }
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Padding(
                  padding: EdgeInsets.only(left: 10),child:Text("Person")),
              onTap: () {
                controllerr.currentIndex.value = 2;
              }
            ),
          ],
        ),
      ),
      bottomNavigationBar: Obx(() => NavigationBar(
            height: 70,
            elevation: 2,
            selectedIndex: controllerr.currentIndex.value,
            onDestinationSelected: (value) {
              print(value);
              controllerr.currentIndex.value = value;
            },
            destinations: [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: "Home",
              ),
              NavigationDestination(icon: Icon(Icons.shop), label: "Shop"),
              NavigationDestination(icon: Icon(Icons.person), label: "Profile")
            ],
          )),
      body:Obx(() => controllerr.tabs[controllerr.currentIndex.value]),
    );
  }
}

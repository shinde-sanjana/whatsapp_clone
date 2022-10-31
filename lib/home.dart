import 'package:flutter/material.dart';
import 'package:whatsapp/calls.dart';
import 'package:whatsapp/chats.dart';
import 'package:whatsapp/status.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = new TabController(length: 4, initialIndex: 1, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        backgroundColor: Color(0xFF075E55),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {})
        ],
        bottom: TabBar(
          isScrollable: true,
          controller: _tabController,
          indicatorColor: Colors.white,
          labelPadding: EdgeInsets.all(12),
          tabs: [
            Icon(Icons.camera_alt),
            Container(
                width: 90, alignment: Alignment.center, child: Text('CHATS')),
            Container(
                width: 90, alignment: Alignment.center, child: Text('STATUS')),
            Container(
                width: 90, alignment: Alignment.center, child: Text('CALLS'))
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Text('CAMERA'),
          // START CHATS
          ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ChatScreen(
                      images: 'user/jerry.jpg',
                      title: 'Rahul',
                    ),
                    ChatScreen(
                      images: 'user/tom.jpg',
                      title: 'Sahu',
                    ),
                    ChatScreen(
                      images: 'user/nobita.jpg',
                      title: 'aditi',
                    ),
                    ChatScreen(
                      images: 'user/doremon.jpg',
                      title: 'Jaggu',
                    ),
                  ],
                );
              }),

          //  START STATUS
          ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    StatusScreen(
                      images: 'user/jerry.jpg',
                    ),
                  ],
                );
              }),

          // START CALLS
          ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CallsScreen(
                      images: 'user/jerry.jpg',
                      title: 'Rahul',
                    ),
                    CallsScreen(
                      images: 'user/tom.jpg',
                      title: 'Sahu',
                    ),
                    CallsScreen(
                      images: 'user/nobita.jpg',
                      title: 'aditi',
                    )
                  ],
                );
              }),
        ],
      ),
      floatingActionButton: _tabController.index == 1
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColorLight,
              child: Icon(Icons.message),
            )
          : FloatingActionButton(
              onPressed: () {},
              backgroundColor: Theme.of(context).primaryColorLight,
              child: Icon(Icons.camera_alt),
            ),
    );
  }
}

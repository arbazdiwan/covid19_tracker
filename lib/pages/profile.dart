import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
//            title: Text('Profile'),
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                decoration: BoxDecoration(),
                margin: EdgeInsets.only(left: 0),
                child: Text('Arbaz Diwan'),
                alignment: Alignment.bottomLeft,
              ),
              background: Image.asset(
                'images/avatar.PNG',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverFillRemaining(
            child: Container(),
          ),
        ],
      ),
    );
  }
}

//
//Scaffold(
//backgroundColor: Colors.orange,
//appBar: AppBar(
//title: Text('Arbaz Diwan'),
//leading: IconButton(
//icon: Icon(Icons.arrow_back_ios),
//onPressed: () {
//Navigator.pop(context);
//},
//),
//),
//body: Column(
//children: [
//Hero(
//tag: 'profilepic',
//child: Image.asset('images/avatar.PNG'),
//),
//],
//),
//);

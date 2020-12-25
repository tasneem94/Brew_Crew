import 'package:arpan_brew_crew/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:arpan_brew_crew/services/auth.dart';
import 'package:arpan_brew_crew/services/database.dart';
import 'package:provider/provider.dart';
import 'package:arpan_brew_crew/home/brew_list.dart';
import 'package:arpan_brew_crew/models/brew.dart';

class Home extends StatelessWidget {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    void _showSettingsPanel(){
      showModalBottomSheet(context: context, builder: (context){
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
          child: Text("Bottom sheet"),
        );
      });

    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
           title: Text(
             "Brew Crew"
           ),
          elevation: 0,
          actions: [
            FlatButton.icon(
                onPressed: () async{
                  await _auth.signOut();
                },
                icon: Icon(Icons.person),
                label: Text("logout"),
            ),
            FlatButton.icon(onPressed: () => _showSettingsPanel(), icon: Icon(Icons.settings), label: Text("Settings")),
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}


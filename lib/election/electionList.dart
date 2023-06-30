import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vote_me/election/electionModel.dart';
import 'package:vote_me/election/election_button.dart';
// import 'package:vote_me/model.dart';

class ElectionList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ElementionList();
  }
}g

class _ElementionList extends State<ElectionList> {
  final ElectionDTO _stream = ElectionDTO('libele', 'code', DateTime.now(), 1);

  @override
  void initState() {
    super.initState();
    _stream.getAllElection();
  }

  @override
  void dispose() {
    _stream.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _stream.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          print(snapshot.data);
          var data = jsonDecode(snapshot.data);
          return ListView(
            children: [
              for (var i = 0; i < data.length; i++)
                ElectionListTile(ElectionDTO.http(data[i])),
            ],
          );
          // Afficher les données
          return Text(snapshot.data);
        } else if (snapshot.hasError) {
          // Afficher une erreur
          return Text('Error: ${snapshot.error}');
        } else {
          // Afficher un indicateur de chargement
          return CircularProgressIndicator();
        }
      },
    );
  }
}

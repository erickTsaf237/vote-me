import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vote_me/candidat/candidat_button.dart';
import 'package:vote_me/candidat/candidat_model.dart';
import 'package:vote_me/election/electionModel.dart';
// import 'package:vote_me/model.dart';

class CandidatList extends StatefulWidget {
  late ElectionDTO electionDTO;

  CandidatList(this.electionDTO);

  @override
  State<StatefulWidget> createState() {
    return _CandidatList(electionDTO);
  }
}

class _CandidatList extends State<CandidatList> {
  late ElectionDTO electionDTO;

  _CandidatList(this.electionDTO){
    _stream =  CandidatDTO(nom: 'nom', prenom: 'prenom', parti: 'parti', id_election: this.electionDTO.id!);
  }
  late CandidatDTO _stream ;

  @override
  void initState() {
    super.initState();
    _stream.getAllCandidat();
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
            scrollDirection: Axis.horizontal,
            children: [
              for (var i = 0; i < data.length; i++)
                CandidatButton(CandidatDTO.toCandidat(data[i])),
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

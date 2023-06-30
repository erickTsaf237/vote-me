


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vote_me/candidat/cadidat_list.dart';
import 'package:vote_me/candidat/candidat_model.dart';
import 'package:vote_me/election/electionModel.dart';

import '../model.dart';

class CandidatPage extends StatefulWidget{
  late CandidatDTO candidatDTO;

  CandidatPage(this.candidatDTO);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _CandidatPage(candidatDTO);
  }

}

class _CandidatPage extends State<CandidatPage>{

  late CandidatDTO candidatDTO;

  _CandidatPage(this.candidatDTO);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${candidatDTO.nom} ${candidatDTO.prenom}'),
      ),
      body: ListView(children: [
        Container(child:candidatDTO.image.isEmpty
            ? Container(
          color: Colors.white,
          child:  Icon(Icons.person, color: Colors.black,size: MediaQuery.of(context).size.width * 0.5),
        )
            : Image.network(
          '${Model.host}/${candidatDTO.image}',
          fit: BoxFit.fitWidth,
          // height: 100.0,
          height: MediaQuery.of(context).size.width * 0.7,
        ))
      ],),
    );
  }
}
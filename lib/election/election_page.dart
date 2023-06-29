
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vote_me/candidat/cadidat_list.dart';
import 'package:vote_me/election/electionModel.dart';

class ElectionPage extends StatefulWidget{
  late ElectionDTO electionDTO;

  ElectionPage(this.electionDTO);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ElectionPage(electionDTO);
  }

}

class _ElectionPage extends State<ElectionPage>{

  late ElectionDTO electionDTO;

  _ElectionPage(this.electionDTO);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${electionDTO.libele}'),
      ),
      body:CandidatList(electionDTO),
    );
  }
}
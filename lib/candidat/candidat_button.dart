import 'package:flutter/material.dart';
import 'package:vote_me/candidat/candidat_model.dart';
import 'package:vote_me/candidat/candidat_page.dart';

import '../model.dart';

class CandidatButton extends StatefulWidget {
  late CandidatDTO candidatDTO;

  CandidatButton(this.candidatDTO);

  @override
  State<StatefulWidget> createState() {
    return _CandidatButton(candidatDTO);
  }
}

class _CandidatButton extends State<CandidatButton> {
  late CandidatDTO candidatDTO;

  _CandidatButton(this.candidatDTO);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 25,
      width: 150,
      // height: 500,
      child: InkWell(child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            candidatDTO.image.isEmpty
                ? Container(
              color: Colors.white,
              height: 100,
              width: 150,
              child: const Icon(Icons.person, color: Colors.black,size: 120),
            )
                : Image.network(
              '${Model.host}/${candidatDTO.image}',
              fit: BoxFit.cover,
              height: 100.0,
              width: 150,
            ),
            Container(
              // decoration: BoxDecoration(border: Border.all(color: const Color.fromRGBO(225, 225, 220, 0.8))),
              color: Color.fromRGBO(225, 225, 220, 0.3),
              // height: 30,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${candidatDTO.nom} ${candidatDTO.prenom}',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '${candidatDTO.parti}: ${candidatDTO.lien}',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>CandidatPage(candidatDTO)));
      },
      ),
    );
  }
}

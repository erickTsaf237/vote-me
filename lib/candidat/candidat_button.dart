import 'package:flutter/material.dart';
import 'package:vote_me/candidat/candidat_model.dart';

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
      child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0.0),
      ),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Image.network(
            'https://images.pexels.com/photos/56876/queen-cup-honeycomb-honey-bee-new-queen-rearing-compartment-56876.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
            fit: BoxFit.cover,
            height: 200.0,
          ),
          Container(
            // height: 30,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '${candidatDTO.nom}',
                    style: TextStyle(
                      fontSize: 20.0,
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
    ),);
  }
}

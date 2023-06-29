import 'package:flutter/material.dart';
import 'package:vote_me/election/electionModel.dart';
import 'package:vote_me/election/election_page.dart';

class ElectionListTile extends StatefulWidget {
  late ElectionDTO electionDTO;

  ElectionListTile(this.electionDTO);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ElectionListTile(electionDTO);
  }
}

class _ElectionListTile extends State<ElectionListTile> {
  late ElectionDTO electionDTO;

  _ElectionListTile(this.electionDTO);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.how_to_vote, color: Colors.green),
        title: Text(electionDTO.libele),
        subtitle: Text(electionDTO.description),
        trailing: const Text('Voting day', style: TextStyle(height: 7)),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:(context)=>  ElectionPage(electionDTO)));
    },
    );
  }
}

/*
Row(
children: const [
Icon(Icons.how_to_vote),
Text(
'Voting day',
style: TextStyle(height: 7),
)
],
)*/

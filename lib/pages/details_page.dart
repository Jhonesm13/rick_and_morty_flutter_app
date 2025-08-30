import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/models/character_list.dart';
import 'package:rick_and_morty_flutter/repositories/character_repository.dart';
import 'package:rick_and_morty_flutter/widgets/app_bar_widget.dart';
import 'package:rick_and_morty_flutter/widgets/detailed_character.dart';

class DetailsPage extends StatefulWidget {
  static const String routeId = '/details';

  const DetailsPage({super.key, required this.characterId});

  final int characterId;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Future<Result>? characterData;
  
  @override
  initState() {
    super.initState();
    characterData = CharacterRepository.getDetailedCharacterWithFirstEpisodeName(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      backgroundColor: Colors.black,
      body: FutureBuilder(future: characterData, builder: (context, snapshot) {
          if (snapshot.hasData) {
            final data = snapshot.data!;

            return Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 17, 20, 109),
                child: DetailedCharacterCard(detailedCharacter: data, firstEpisodeName: data.firstEpisodeName),
              ),
            );
          } else if (snapshot.hasError) {
              return Text(
                'Erro: ${snapshot.error}',
                style: TextStyle(color: Colors.red),
              );
            }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
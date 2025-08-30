import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/models/character_list.dart';
import 'package:rick_and_morty_flutter/pages/details_page.dart';
import 'package:rick_and_morty_flutter/repositories/character_repository.dart';
import 'package:rick_and_morty_flutter/widgets/app_bar_widget.dart';
import 'package:rick_and_morty_flutter/widgets/character_card.dart';

class HomePage extends StatefulWidget {
  static const String routeId = '/';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Result> allCharacters = [];
  List<Result> filteredCharacters = [];
  bool isLoading = true;
  String searchQuery = "";

  @override
  void initState() {
    super.initState();
    _loadCharacters();
  }

  Future<void> _loadCharacters() async {
    final characters = await CharacterRepository.getCharacters();
    setState(() {
      allCharacters = characters;
      filteredCharacters = characters;
      isLoading = false;
    });
  }

  void _filterCharacters(String query) {
    final filtered = allCharacters.where((character) {
      final nameLower = character.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();

    setState(() {
      searchQuery = query;
      filteredCharacters = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBarWidget(isHomePage: true),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Column(
            children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search a Character',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      filled: true,
                      fillColor: Color(0xFF1C1B1F),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: _filterCharacters,
                  ),
                ),
                Expanded(
                  child: filteredCharacters.isEmpty
                      ? const Center(
                          child: Text(
                            'Nenhum personagem encontrado',
                            style: TextStyle(color: Colors.white),
                          ),
                        )
                      : ListView.builder(
                          itemCount: filteredCharacters.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                              child: CharacterCard(
                                character: filteredCharacters[index],
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                    DetailsPage.routeId,
                                    arguments: filteredCharacters[index].id,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
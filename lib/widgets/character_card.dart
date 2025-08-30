import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty_flutter/models/character_list.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({required this.character, required this.onTap, Key? key})
      : super(key: key);

  final Result character;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      height: 160,
      child: Card(
        clipBehavior: Clip.antiAlias,
        margin: EdgeInsets.zero, 
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: double.infinity,
                child: Image.network(
                  character.image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    alignment: Alignment.center,
                    child: Icon(Icons.broken_image, color: Colors.white),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                color: const Color(0xFF87A1FA),
                alignment: Alignment.centerLeft,
                child: Text(
                  character.name.toUpperCase(),
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 14.5,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
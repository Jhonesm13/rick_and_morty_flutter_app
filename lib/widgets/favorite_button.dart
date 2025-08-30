import 'package:flutter/material.dart';
import 'package:rick_and_morty_flutter/services/favorites_service.dart';

class FavoriteButton extends StatefulWidget {
  final int characterId;

  const FavoriteButton({
    required this.characterId,
    Key? key,
  }) : super(key: key);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  late Future<bool> _isFavoriteFuture;

  @override
  void initState() {
    super.initState();
    _isFavoriteFuture = FavoritesService.isFavorite(widget.characterId);
  }

  void _toggleFavorite() async {
    await FavoritesService.toggleFavorite(widget.characterId);
    setState(() {
      _isFavoriteFuture = FavoritesService.isFavorite(widget.characterId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: _isFavoriteFuture,
      builder: (context, snapshot) {
        final isFavorite = snapshot.data ?? false;
        return GestureDetector(
          onTap: _toggleFavorite,
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : Colors.white,
            size: 28,
          ),
        );
      },
    );
  }
}
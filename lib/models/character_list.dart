import 'dart:convert';

class CharacterListModel {
  final Info info;
  final List<Result> results;

  CharacterListModel({
    required this.info,
    required this.results,
  });

  factory CharacterListModel.fromMap(Map<String, dynamic> map) {
    return CharacterListModel(
      info: Info.fromMap(map['info'] ?? {}),
      results: (map['results'] as List<dynamic>?)
              ?.map((x) => Result.fromMap(x))
              .toList() ??
          [],
    );
  }

  factory CharacterListModel.fromJson(String source) =>
      CharacterListModel.fromMap(json.decode(source));
}

class Info {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  Info({
    required this.count,
    required this.pages,
    this.next,
    this.prev,
  });

  factory Info.fromMap(Map<String, dynamic> map) {
    return Info(
      count: map['count'] ?? 0,
      pages: map['pages'] ?? 0,
      next: map['next'],
      prev: map['prev'],
    );
  }
}

class Result {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;
  String? firstEpisodeName;

  Result({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
    this.firstEpisodeName,
  });

  factory Result.fromMap(Map<String, dynamic> map) {
    return Result(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      status: map['status'] ?? '',
      species: map['species'] ?? '',
      type: map['type'] ?? '',
      gender: map['gender'] ?? '',
      origin: Origin.fromMap(map['origin'] ?? {}),
      location: Location.fromMap(map['location'] ?? {}),
      image: map['image'] ?? '',
      episode: List<String>.from(map['episode'] ?? []),
      url: map['url'] ?? '',
      created: map['created'] ?? '',
      firstEpisodeName: null,
    );
  }
}

class Origin {
  final String name;
  final String url;

  Origin({
    required this.name,
    required this.url,
  });

  factory Origin.fromMap(Map<String, dynamic> map) {
    return Origin(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }
}

class Location {
  final String name;
  final String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromMap(Map<String, dynamic> map) {
    return Location(
      name: map['name'] ?? '',
      url: map['url'] ?? '',
    );
  }
}

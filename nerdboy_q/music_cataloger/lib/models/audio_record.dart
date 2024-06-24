import 'dart:ffi';

class AudioRecord {
  final String trackName;
  final String albumName;
  final String albumType;
  final String artistName;
  final Float frequency;
  final String releaseType;
  final String genre;

  AudioRecord({
    required this.trackName,
    required this.albumName,
    required this.albumType,
    required this.artistName,
    required this.frequency,
    required this.releaseType,
    required this.genre
  });

  Map<String, dynamic> toMap() {
    return {
        "trackName" : trackName,
        "albumName" : albumName,
        "albumType" : albumType,
        "artistName" : artistName,
        "frequency" : frequency,
        "releaseType" : releaseType,
        "genre" : genre,
    };
  }

  AudioRecord copyWith({
    String? trackName,
    String? albumName,
    String? albumType,
    String? artistName,
    Float? frequency,
    String? releaseType,
    String? genre,
  }) {
    return AudioRecord(
      trackName: trackName ?? this.trackName, 
      albumName: albumName ?? this.albumName, 
      albumType: albumType ?? this.albumType, 
      artistName: artistName ?? this.artistName, 
      frequency: frequency ?? this.frequency, 
      releaseType: releaseType ?? this.releaseType, 
      genre: genre ?? this.genre
    );
  }

  factory AudioRecord.fromMap(Map<String, dynamic> map) {
    return AudioRecord(
      trackName: map['trackName'] ?? '', 
      albumName: map['albumName'] ?? '', 
      albumType: map['albumType'] ?? '', 
      artistName: map['artistName'] ?? '', 
      frequency: map['frequency'] ?? 0.00, 
      releaseType: map['releaseType'] ?? '', 
      genre: map['genre'] ?? ''
    );
  }
}
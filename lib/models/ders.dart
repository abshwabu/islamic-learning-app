class DersModel {
  const DersModel({
    required this.id,
    required this.title,
    required this.speaker,
    required this.audioUrl,
    this.description,
    this.thumbnailUrl,
    this.durationSeconds = 0,
  });

  final int id;
  final String title;
  final String speaker;
  final String audioUrl;
  final String? description;
  final String? thumbnailUrl;
  final int durationSeconds;

  String get formattedDuration {
    final minutes = durationSeconds ~/ 60;
    final seconds = durationSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  factory DersModel.fromJson(Map<String, dynamic> json) {
    return DersModel(
      id: json['id'] as int,
      title: json['title'] as String,
      speaker: json['speaker'] as String,
      audioUrl: json['audioUrl'] as String,
      description: json['description'] as String?,
      thumbnailUrl: json['thumbnailUrl'] as String?,
      durationSeconds: json['durationSeconds'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'speaker': speaker,
      'audioUrl': audioUrl,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'durationSeconds': durationSeconds,
    };
  }
}

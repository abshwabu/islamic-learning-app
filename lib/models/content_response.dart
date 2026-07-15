class ContentResponse {
  const ContentResponse({
    required this.ustazes,
    required this.topics,
    required this.derses,
  });

  final List<UstazDto> ustazes;
  final List<TopicDto> topics;
  final List<DersDto> derses;

  factory ContentResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>? ?? json;

    return ContentResponse(
      ustazes: _parseList(data['ustazes'], UstazDto.fromJson),
      topics: _parseList(data['topics'], TopicDto.fromJson),
      derses: _parseList(data['derses'], DersDto.fromJson),
    );
  }

  static List<T> _parseList<T>(
    Object? value,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    if (value is! List) return [];
    return value
        .whereType<Map>()
        .map((item) => fromJson(Map<String, dynamic>.from(item)))
        .toList();
  }
}

class UstazDto {
  const UstazDto({
    required this.id,
    required this.name,
    required this.slug,
    this.bio,
    this.photoUrl,
    this.sortOrder = 0,
    this.isActive = true,
  });

  final int id;
  final String name;
  final String slug;
  final String? bio;
  final String? photoUrl;
  final int sortOrder;
  final bool isActive;

  factory UstazDto.fromJson(Map<String, dynamic> json) {
    return UstazDto(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      bio: json['bio'] as String?,
      photoUrl: json['photo_url'] as String?,
      sortOrder: json['sort_order'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
    );
  }
}

class TopicDto {
  const TopicDto({
    required this.id,
    required this.name,
    required this.slug,
    this.icon,
    this.color,
    this.sortOrder = 0,
    this.isActive = true,
  });

  final int id;
  final String name;
  final String slug;
  final String? icon;
  final String? color;
  final int sortOrder;
  final bool isActive;

  factory TopicDto.fromJson(Map<String, dynamic> json) {
    return TopicDto(
      id: json['id'] as int,
      name: json['name'] as String,
      slug: json['slug'] as String,
      icon: json['icon'] as String?,
      color: json['color'] as String?,
      sortOrder: json['sort_order'] as int? ?? 0,
      isActive: json['is_active'] as bool? ?? true,
    );
  }
}

class DersDto {
  const DersDto({
    required this.id,
    required this.title,
    required this.slug,
    required this.ustazId,
    this.description,
    this.coverImageUrl,
    this.pdfUrl,
    this.pdfPageCount = 0,
    this.topicId,
    this.sortOrder = 0,
    this.isPublished = false,
    this.episodes = const [],
  });

  final int id;
  final String title;
  final String slug;
  final String? description;
  final String? coverImageUrl;
  final String? pdfUrl;
  final int pdfPageCount;
  final int ustazId;
  final int? topicId;
  final int sortOrder;
  final bool isPublished;
  final List<EpisodeDto> episodes;

  factory DersDto.fromJson(Map<String, dynamic> json) {
    return DersDto(
      id: json['id'] as int,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String?,
      coverImageUrl: json['cover_image_url'] as String?,
      pdfUrl: json['pdf_url'] as String?,
      pdfPageCount: json['pdf_page_count'] as int? ?? 0,
      ustazId: json['ustaz_id'] as int,
      topicId: json['topic_id'] as int?,
      sortOrder: json['sort_order'] as int? ?? 0,
      isPublished: json['is_published'] as bool? ?? false,
      episodes: ContentResponse._parseList(
        json['episodes'],
        EpisodeDto.fromJson,
      ),
    );
  }
}

class EpisodeDto {
  const EpisodeDto({
    required this.id,
    required this.dersId,
    required this.title,
    required this.audioUrl,
    required this.startPage,
    this.endPage = 0,
    this.durationSeconds = 0,
    this.sortOrder = 0,
    this.isPublished = false,
  });

  final int id;
  final int dersId;
  final String title;
  final String audioUrl;
  final int startPage;
  final int endPage;
  final int durationSeconds;
  final int sortOrder;
  final bool isPublished;

  factory EpisodeDto.fromJson(Map<String, dynamic> json) {
    return EpisodeDto(
      id: json['id'] as int,
      dersId: json['ders_id'] as int,
      title: json['title'] as String,
      audioUrl: json['audio_url'] as String,
      startPage: json['start_page'] as int,
      endPage: json['end_page'] as int? ?? 0,
      durationSeconds: json['duration_seconds'] as int? ?? 0,
      sortOrder: json['sort_order'] as int? ?? 0,
      isPublished: json['is_published'] as bool? ?? false,
    );
  }
}

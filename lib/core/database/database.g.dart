// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DersesTable extends Derses with TableInfo<$DersesTable, Ders> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DersesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _speakerMeta = const VerificationMeta(
    'speaker',
  );
  @override
  late final GeneratedColumn<String> speaker = GeneratedColumn<String>(
    'speaker',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _audioUrlMeta = const VerificationMeta(
    'audioUrl',
  );
  @override
  late final GeneratedColumn<String> audioUrl = GeneratedColumn<String>(
    'audio_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _thumbnailUrlMeta = const VerificationMeta(
    'thumbnailUrl',
  );
  @override
  late final GeneratedColumn<String> thumbnailUrl = GeneratedColumn<String>(
    'thumbnail_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _durationSecondsMeta = const VerificationMeta(
    'durationSeconds',
  );
  @override
  late final GeneratedColumn<int> durationSeconds = GeneratedColumn<int>(
    'duration_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    speaker,
    description,
    audioUrl,
    thumbnailUrl,
    durationSeconds,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'derses';
  @override
  VerificationContext validateIntegrity(
    Insertable<Ders> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('speaker')) {
      context.handle(
        _speakerMeta,
        speaker.isAcceptableOrUnknown(data['speaker']!, _speakerMeta),
      );
    } else if (isInserting) {
      context.missing(_speakerMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('thumbnail_url')) {
      context.handle(
        _thumbnailUrlMeta,
        thumbnailUrl.isAcceptableOrUnknown(
          data['thumbnail_url']!,
          _thumbnailUrlMeta,
        ),
      );
    }
    if (data.containsKey('duration_seconds')) {
      context.handle(
        _durationSecondsMeta,
        durationSeconds.isAcceptableOrUnknown(
          data['duration_seconds']!,
          _durationSecondsMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Ders map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Ders(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      speaker: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}speaker'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      )!,
      thumbnailUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}thumbnail_url'],
      ),
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DersesTable createAlias(String alias) {
    return $DersesTable(attachedDatabase, alias);
  }
}

class Ders extends DataClass implements Insertable<Ders> {
  final int id;
  final String title;
  final String speaker;
  final String? description;
  final String audioUrl;
  final String? thumbnailUrl;
  final int durationSeconds;
  final DateTime createdAt;
  const Ders({
    required this.id,
    required this.title,
    required this.speaker,
    this.description,
    required this.audioUrl,
    this.thumbnailUrl,
    required this.durationSeconds,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['speaker'] = Variable<String>(speaker);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['audio_url'] = Variable<String>(audioUrl);
    if (!nullToAbsent || thumbnailUrl != null) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl);
    }
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DersesCompanion toCompanion(bool nullToAbsent) {
    return DersesCompanion(
      id: Value(id),
      title: Value(title),
      speaker: Value(speaker),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      audioUrl: Value(audioUrl),
      thumbnailUrl: thumbnailUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(thumbnailUrl),
      durationSeconds: Value(durationSeconds),
      createdAt: Value(createdAt),
    );
  }

  factory Ders.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Ders(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      speaker: serializer.fromJson<String>(json['speaker']),
      description: serializer.fromJson<String?>(json['description']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      thumbnailUrl: serializer.fromJson<String?>(json['thumbnailUrl']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'speaker': serializer.toJson<String>(speaker),
      'description': serializer.toJson<String?>(description),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'thumbnailUrl': serializer.toJson<String?>(thumbnailUrl),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Ders copyWith({
    int? id,
    String? title,
    String? speaker,
    Value<String?> description = const Value.absent(),
    String? audioUrl,
    Value<String?> thumbnailUrl = const Value.absent(),
    int? durationSeconds,
    DateTime? createdAt,
  }) => Ders(
    id: id ?? this.id,
    title: title ?? this.title,
    speaker: speaker ?? this.speaker,
    description: description.present ? description.value : this.description,
    audioUrl: audioUrl ?? this.audioUrl,
    thumbnailUrl: thumbnailUrl.present ? thumbnailUrl.value : this.thumbnailUrl,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    createdAt: createdAt ?? this.createdAt,
  );
  Ders copyWithCompanion(DersesCompanion data) {
    return Ders(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      speaker: data.speaker.present ? data.speaker.value : this.speaker,
      description: data.description.present
          ? data.description.value
          : this.description,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      thumbnailUrl: data.thumbnailUrl.present
          ? data.thumbnailUrl.value
          : this.thumbnailUrl,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Ders(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('speaker: $speaker, ')
          ..write('description: $description, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    speaker,
    description,
    audioUrl,
    thumbnailUrl,
    durationSeconds,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Ders &&
          other.id == this.id &&
          other.title == this.title &&
          other.speaker == this.speaker &&
          other.description == this.description &&
          other.audioUrl == this.audioUrl &&
          other.thumbnailUrl == this.thumbnailUrl &&
          other.durationSeconds == this.durationSeconds &&
          other.createdAt == this.createdAt);
}

class DersesCompanion extends UpdateCompanion<Ders> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> speaker;
  final Value<String?> description;
  final Value<String> audioUrl;
  final Value<String?> thumbnailUrl;
  final Value<int> durationSeconds;
  final Value<DateTime> createdAt;
  const DersesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.speaker = const Value.absent(),
    this.description = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.thumbnailUrl = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DersesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String speaker,
    this.description = const Value.absent(),
    required String audioUrl,
    this.thumbnailUrl = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : title = Value(title),
       speaker = Value(speaker),
       audioUrl = Value(audioUrl);
  static Insertable<Ders> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? speaker,
    Expression<String>? description,
    Expression<String>? audioUrl,
    Expression<String>? thumbnailUrl,
    Expression<int>? durationSeconds,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (speaker != null) 'speaker': speaker,
      if (description != null) 'description': description,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (thumbnailUrl != null) 'thumbnail_url': thumbnailUrl,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DersesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? speaker,
    Value<String?>? description,
    Value<String>? audioUrl,
    Value<String?>? thumbnailUrl,
    Value<int>? durationSeconds,
    Value<DateTime>? createdAt,
  }) {
    return DersesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      speaker: speaker ?? this.speaker,
      description: description ?? this.description,
      audioUrl: audioUrl ?? this.audioUrl,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (speaker.present) {
      map['speaker'] = Variable<String>(speaker.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (thumbnailUrl.present) {
      map['thumbnail_url'] = Variable<String>(thumbnailUrl.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DersesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('speaker: $speaker, ')
          ..write('description: $description, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('thumbnailUrl: $thumbnailUrl, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $FavoritesTable extends Favorites
    with TableInfo<$FavoritesTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoritesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dersIdMeta = const VerificationMeta('dersId');
  @override
  late final GeneratedColumn<int> dersId = GeneratedColumn<int>(
    'ders_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES derses (id)',
    ),
  );
  static const VerificationMeta _addedAtMeta = const VerificationMeta(
    'addedAt',
  );
  @override
  late final GeneratedColumn<DateTime> addedAt = GeneratedColumn<DateTime>(
    'added_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, dersId, addedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Favorite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ders_id')) {
      context.handle(
        _dersIdMeta,
        dersId.isAcceptableOrUnknown(data['ders_id']!, _dersIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dersIdMeta);
    }
    if (data.containsKey('added_at')) {
      context.handle(
        _addedAtMeta,
        addedAt.isAcceptableOrUnknown(data['added_at']!, _addedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dersId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ders_id'],
      )!,
      addedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}added_at'],
      )!,
    );
  }

  @override
  $FavoritesTable createAlias(String alias) {
    return $FavoritesTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int dersId;
  final DateTime addedAt;
  const Favorite({
    required this.id,
    required this.dersId,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ders_id'] = Variable<int>(dersId);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      dersId: Value(dersId),
      addedAt: Value(addedAt),
    );
  }

  factory Favorite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      dersId: serializer.fromJson<int>(json['dersId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dersId': serializer.toJson<int>(dersId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favorite copyWith({int? id, int? dersId, DateTime? addedAt}) => Favorite(
    id: id ?? this.id,
    dersId: dersId ?? this.dersId,
    addedAt: addedAt ?? this.addedAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      dersId: data.dersId.present ? data.dersId.value : this.dersId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('dersId: $dersId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dersId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.dersId == this.dersId &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> dersId;
  final Value<DateTime> addedAt;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.dersId = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required int dersId,
    this.addedAt = const Value.absent(),
  }) : dersId = Value(dersId);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? dersId,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dersId != null) 'ders_id': dersId,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavoritesCompanion copyWith({
    Value<int>? id,
    Value<int>? dersId,
    Value<DateTime>? addedAt,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      dersId: dersId ?? this.dersId,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dersId.present) {
      map['ders_id'] = Variable<int>(dersId.value);
    }
    if (addedAt.present) {
      map['added_at'] = Variable<DateTime>(addedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoritesCompanion(')
          ..write('id: $id, ')
          ..write('dersId: $dersId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $DownloadsTable extends Downloads
    with TableInfo<$DownloadsTable, Download> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DownloadsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _dersIdMeta = const VerificationMeta('dersId');
  @override
  late final GeneratedColumn<int> dersId = GeneratedColumn<int>(
    'ders_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES derses (id)',
    ),
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _downloadedAtMeta = const VerificationMeta(
    'downloadedAt',
  );
  @override
  late final GeneratedColumn<DateTime> downloadedAt = GeneratedColumn<DateTime>(
    'downloaded_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, dersId, localPath, downloadedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'downloads';
  @override
  VerificationContext validateIntegrity(
    Insertable<Download> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('ders_id')) {
      context.handle(
        _dersIdMeta,
        dersId.isAcceptableOrUnknown(data['ders_id']!, _dersIdMeta),
      );
    } else if (isInserting) {
      context.missing(_dersIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('downloaded_at')) {
      context.handle(
        _downloadedAtMeta,
        downloadedAt.isAcceptableOrUnknown(
          data['downloaded_at']!,
          _downloadedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Download map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Download(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dersId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ders_id'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      downloadedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}downloaded_at'],
      )!,
    );
  }

  @override
  $DownloadsTable createAlias(String alias) {
    return $DownloadsTable(attachedDatabase, alias);
  }
}

class Download extends DataClass implements Insertable<Download> {
  final int id;
  final int dersId;
  final String localPath;
  final DateTime downloadedAt;
  const Download({
    required this.id,
    required this.dersId,
    required this.localPath,
    required this.downloadedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ders_id'] = Variable<int>(dersId);
    map['local_path'] = Variable<String>(localPath);
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  DownloadsCompanion toCompanion(bool nullToAbsent) {
    return DownloadsCompanion(
      id: Value(id),
      dersId: Value(dersId),
      localPath: Value(localPath),
      downloadedAt: Value(downloadedAt),
    );
  }

  factory Download.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Download(
      id: serializer.fromJson<int>(json['id']),
      dersId: serializer.fromJson<int>(json['dersId']),
      localPath: serializer.fromJson<String>(json['localPath']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dersId': serializer.toJson<int>(dersId),
      'localPath': serializer.toJson<String>(localPath),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  Download copyWith({
    int? id,
    int? dersId,
    String? localPath,
    DateTime? downloadedAt,
  }) => Download(
    id: id ?? this.id,
    dersId: dersId ?? this.dersId,
    localPath: localPath ?? this.localPath,
    downloadedAt: downloadedAt ?? this.downloadedAt,
  );
  Download copyWithCompanion(DownloadsCompanion data) {
    return Download(
      id: data.id.present ? data.id.value : this.id,
      dersId: data.dersId.present ? data.dersId.value : this.dersId,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      downloadedAt: data.downloadedAt.present
          ? data.downloadedAt.value
          : this.downloadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Download(')
          ..write('id: $id, ')
          ..write('dersId: $dersId, ')
          ..write('localPath: $localPath, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, dersId, localPath, downloadedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Download &&
          other.id == this.id &&
          other.dersId == this.dersId &&
          other.localPath == this.localPath &&
          other.downloadedAt == this.downloadedAt);
}

class DownloadsCompanion extends UpdateCompanion<Download> {
  final Value<int> id;
  final Value<int> dersId;
  final Value<String> localPath;
  final Value<DateTime> downloadedAt;
  const DownloadsCompanion({
    this.id = const Value.absent(),
    this.dersId = const Value.absent(),
    this.localPath = const Value.absent(),
    this.downloadedAt = const Value.absent(),
  });
  DownloadsCompanion.insert({
    this.id = const Value.absent(),
    required int dersId,
    required String localPath,
    this.downloadedAt = const Value.absent(),
  }) : dersId = Value(dersId),
       localPath = Value(localPath);
  static Insertable<Download> custom({
    Expression<int>? id,
    Expression<int>? dersId,
    Expression<String>? localPath,
    Expression<DateTime>? downloadedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dersId != null) 'ders_id': dersId,
      if (localPath != null) 'local_path': localPath,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
    });
  }

  DownloadsCompanion copyWith({
    Value<int>? id,
    Value<int>? dersId,
    Value<String>? localPath,
    Value<DateTime>? downloadedAt,
  }) {
    return DownloadsCompanion(
      id: id ?? this.id,
      dersId: dersId ?? this.dersId,
      localPath: localPath ?? this.localPath,
      downloadedAt: downloadedAt ?? this.downloadedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (dersId.present) {
      map['ders_id'] = Variable<int>(dersId.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (downloadedAt.present) {
      map['downloaded_at'] = Variable<DateTime>(downloadedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DownloadsCompanion(')
          ..write('id: $id, ')
          ..write('dersId: $dersId, ')
          ..write('localPath: $localPath, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DersesTable derses = $DersesTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $DownloadsTable downloads = $DownloadsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    derses,
    favorites,
    downloads,
  ];
}

typedef $$DersesTableCreateCompanionBuilder =
    DersesCompanion Function({
      Value<int> id,
      required String title,
      required String speaker,
      Value<String?> description,
      required String audioUrl,
      Value<String?> thumbnailUrl,
      Value<int> durationSeconds,
      Value<DateTime> createdAt,
    });
typedef $$DersesTableUpdateCompanionBuilder =
    DersesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> speaker,
      Value<String?> description,
      Value<String> audioUrl,
      Value<String?> thumbnailUrl,
      Value<int> durationSeconds,
      Value<DateTime> createdAt,
    });

final class $$DersesTableReferences
    extends BaseReferences<_$AppDatabase, $DersesTable, Ders> {
  $$DersesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$FavoritesTable, List<Favorite>>
  _favoritesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.favorites,
    aliasName: $_aliasNameGenerator(db.derses.id, db.favorites.dersId),
  );

  $$FavoritesTableProcessedTableManager get favoritesRefs {
    final manager = $$FavoritesTableTableManager(
      $_db,
      $_db.favorites,
    ).filter((f) => f.dersId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_favoritesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DownloadsTable, List<Download>>
  _downloadsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.downloads,
    aliasName: $_aliasNameGenerator(db.derses.id, db.downloads.dersId),
  );

  $$DownloadsTableProcessedTableManager get downloadsRefs {
    final manager = $$DownloadsTableTableManager(
      $_db,
      $_db.downloads,
    ).filter((f) => f.dersId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_downloadsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DersesTableFilterComposer
    extends Composer<_$AppDatabase, $DersesTable> {
  $$DersesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get speaker => $composableBuilder(
    column: $table.speaker,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> favoritesRefs(
    Expression<bool> Function($$FavoritesTableFilterComposer f) f,
  ) {
    final $$FavoritesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.dersId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableFilterComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> downloadsRefs(
    Expression<bool> Function($$DownloadsTableFilterComposer f) f,
  ) {
    final $$DownloadsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.downloads,
      getReferencedColumn: (t) => t.dersId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DownloadsTableFilterComposer(
            $db: $db,
            $table: $db.downloads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DersesTableOrderingComposer
    extends Composer<_$AppDatabase, $DersesTable> {
  $$DersesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get speaker => $composableBuilder(
    column: $table.speaker,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DersesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DersesTable> {
  $$DersesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get speaker =>
      $composableBuilder(column: $table.speaker, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<String> get thumbnailUrl => $composableBuilder(
    column: $table.thumbnailUrl,
    builder: (column) => column,
  );

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> favoritesRefs<T extends Object>(
    Expression<T> Function($$FavoritesTableAnnotationComposer a) f,
  ) {
    final $$FavoritesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.favorites,
      getReferencedColumn: (t) => t.dersId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$FavoritesTableAnnotationComposer(
            $db: $db,
            $table: $db.favorites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> downloadsRefs<T extends Object>(
    Expression<T> Function($$DownloadsTableAnnotationComposer a) f,
  ) {
    final $$DownloadsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.downloads,
      getReferencedColumn: (t) => t.dersId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DownloadsTableAnnotationComposer(
            $db: $db,
            $table: $db.downloads,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DersesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DersesTable,
          Ders,
          $$DersesTableFilterComposer,
          $$DersesTableOrderingComposer,
          $$DersesTableAnnotationComposer,
          $$DersesTableCreateCompanionBuilder,
          $$DersesTableUpdateCompanionBuilder,
          (Ders, $$DersesTableReferences),
          Ders,
          PrefetchHooks Function({bool favoritesRefs, bool downloadsRefs})
        > {
  $$DersesTableTableManager(_$AppDatabase db, $DersesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DersesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DersesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DersesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> speaker = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> audioUrl = const Value.absent(),
                Value<String?> thumbnailUrl = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DersesCompanion(
                id: id,
                title: title,
                speaker: speaker,
                description: description,
                audioUrl: audioUrl,
                thumbnailUrl: thumbnailUrl,
                durationSeconds: durationSeconds,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String speaker,
                Value<String?> description = const Value.absent(),
                required String audioUrl,
                Value<String?> thumbnailUrl = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DersesCompanion.insert(
                id: id,
                title: title,
                speaker: speaker,
                description: description,
                audioUrl: audioUrl,
                thumbnailUrl: thumbnailUrl,
                durationSeconds: durationSeconds,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$DersesTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback:
              ({favoritesRefs = false, downloadsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (favoritesRefs) db.favorites,
                    if (downloadsRefs) db.downloads,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (favoritesRefs)
                        await $_getPrefetchedData<Ders, $DersesTable, Favorite>(
                          currentTable: table,
                          referencedTable: $$DersesTableReferences
                              ._favoritesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DersesTableReferences(
                                db,
                                table,
                                p0,
                              ).favoritesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dersId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (downloadsRefs)
                        await $_getPrefetchedData<Ders, $DersesTable, Download>(
                          currentTable: table,
                          referencedTable: $$DersesTableReferences
                              ._downloadsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DersesTableReferences(
                                db,
                                table,
                                p0,
                              ).downloadsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.dersId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DersesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DersesTable,
      Ders,
      $$DersesTableFilterComposer,
      $$DersesTableOrderingComposer,
      $$DersesTableAnnotationComposer,
      $$DersesTableCreateCompanionBuilder,
      $$DersesTableUpdateCompanionBuilder,
      (Ders, $$DersesTableReferences),
      Ders,
      PrefetchHooks Function({bool favoritesRefs, bool downloadsRefs})
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      required int dersId,
      Value<DateTime> addedAt,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      Value<int> dersId,
      Value<DateTime> addedAt,
    });

final class $$FavoritesTableReferences
    extends BaseReferences<_$AppDatabase, $FavoritesTable, Favorite> {
  $$FavoritesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DersesTable _dersIdTable(_$AppDatabase db) => db.derses.createAlias(
    $_aliasNameGenerator(db.favorites.dersId, db.derses.id),
  );

  $$DersesTableProcessedTableManager get dersId {
    final $_column = $_itemColumn<int>('ders_id')!;

    final manager = $$DersesTableTableManager(
      $_db,
      $_db.derses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dersIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$FavoritesTableFilterComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DersesTableFilterComposer get dersId {
    final $$DersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.derses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DersesTableFilterComposer(
            $db: $db,
            $table: $db.derses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DersesTableOrderingComposer get dersId {
    final $$DersesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.derses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DersesTableOrderingComposer(
            $db: $db,
            $table: $db.derses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoritesTable> {
  $$FavoritesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);

  $$DersesTableAnnotationComposer get dersId {
    final $$DersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.derses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DersesTableAnnotationComposer(
            $db: $db,
            $table: $db.derses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$FavoritesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $FavoritesTable,
          Favorite,
          $$FavoritesTableFilterComposer,
          $$FavoritesTableOrderingComposer,
          $$FavoritesTableAnnotationComposer,
          $$FavoritesTableCreateCompanionBuilder,
          $$FavoritesTableUpdateCompanionBuilder,
          (Favorite, $$FavoritesTableReferences),
          Favorite,
          PrefetchHooks Function({bool dersId})
        > {
  $$FavoritesTableTableManager(_$AppDatabase db, $FavoritesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoritesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoritesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoritesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dersId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) =>
                  FavoritesCompanion(id: id, dersId: dersId, addedAt: addedAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dersId,
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                dersId: dersId,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$FavoritesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dersId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dersId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dersId,
                                referencedTable: $$FavoritesTableReferences
                                    ._dersIdTable(db),
                                referencedColumn: $$FavoritesTableReferences
                                    ._dersIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$FavoritesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $FavoritesTable,
      Favorite,
      $$FavoritesTableFilterComposer,
      $$FavoritesTableOrderingComposer,
      $$FavoritesTableAnnotationComposer,
      $$FavoritesTableCreateCompanionBuilder,
      $$FavoritesTableUpdateCompanionBuilder,
      (Favorite, $$FavoritesTableReferences),
      Favorite,
      PrefetchHooks Function({bool dersId})
    >;
typedef $$DownloadsTableCreateCompanionBuilder =
    DownloadsCompanion Function({
      Value<int> id,
      required int dersId,
      required String localPath,
      Value<DateTime> downloadedAt,
    });
typedef $$DownloadsTableUpdateCompanionBuilder =
    DownloadsCompanion Function({
      Value<int> id,
      Value<int> dersId,
      Value<String> localPath,
      Value<DateTime> downloadedAt,
    });

final class $$DownloadsTableReferences
    extends BaseReferences<_$AppDatabase, $DownloadsTable, Download> {
  $$DownloadsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DersesTable _dersIdTable(_$AppDatabase db) => db.derses.createAlias(
    $_aliasNameGenerator(db.downloads.dersId, db.derses.id),
  );

  $$DersesTableProcessedTableManager get dersId {
    final $_column = $_itemColumn<int>('ders_id')!;

    final manager = $$DersesTableTableManager(
      $_db,
      $_db.derses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dersIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DownloadsTableFilterComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DersesTableFilterComposer get dersId {
    final $$DersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.derses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DersesTableFilterComposer(
            $db: $db,
            $table: $db.derses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DownloadsTableOrderingComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DersesTableOrderingComposer get dersId {
    final $$DersesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.derses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DersesTableOrderingComposer(
            $db: $db,
            $table: $db.derses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DownloadsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DownloadsTable> {
  $$DownloadsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => column,
  );

  $$DersesTableAnnotationComposer get dersId {
    final $$DersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.derses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DersesTableAnnotationComposer(
            $db: $db,
            $table: $db.derses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DownloadsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DownloadsTable,
          Download,
          $$DownloadsTableFilterComposer,
          $$DownloadsTableOrderingComposer,
          $$DownloadsTableAnnotationComposer,
          $$DownloadsTableCreateCompanionBuilder,
          $$DownloadsTableUpdateCompanionBuilder,
          (Download, $$DownloadsTableReferences),
          Download,
          PrefetchHooks Function({bool dersId})
        > {
  $$DownloadsTableTableManager(_$AppDatabase db, $DownloadsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DownloadsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DownloadsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DownloadsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dersId = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
              }) => DownloadsCompanion(
                id: id,
                dersId: dersId,
                localPath: localPath,
                downloadedAt: downloadedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dersId,
                required String localPath,
                Value<DateTime> downloadedAt = const Value.absent(),
              }) => DownloadsCompanion.insert(
                id: id,
                dersId: dersId,
                localPath: localPath,
                downloadedAt: downloadedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DownloadsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({dersId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (dersId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.dersId,
                                referencedTable: $$DownloadsTableReferences
                                    ._dersIdTable(db),
                                referencedColumn: $$DownloadsTableReferences
                                    ._dersIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DownloadsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DownloadsTable,
      Download,
      $$DownloadsTableFilterComposer,
      $$DownloadsTableOrderingComposer,
      $$DownloadsTableAnnotationComposer,
      $$DownloadsTableCreateCompanionBuilder,
      $$DownloadsTableUpdateCompanionBuilder,
      (Download, $$DownloadsTableReferences),
      Download,
      PrefetchHooks Function({bool dersId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DersesTableTableManager get derses =>
      $$DersesTableTableManager(_db, _db.derses);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$DownloadsTableTableManager get downloads =>
      $$DownloadsTableTableManager(_db, _db.downloads);
}

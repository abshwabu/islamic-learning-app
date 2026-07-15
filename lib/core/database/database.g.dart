// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CachedUstazesTable extends CachedUstazes
    with TableInfo<$CachedUstazesTable, CachedUstaze> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedUstazesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _bioMeta = const VerificationMeta('bio');
  @override
  late final GeneratedColumn<String> bio = GeneratedColumn<String>(
    'bio',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _photoUrlMeta = const VerificationMeta(
    'photoUrl',
  );
  @override
  late final GeneratedColumn<String> photoUrl = GeneratedColumn<String>(
    'photo_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    slug,
    bio,
    photoUrl,
    sortOrder,
    isActive,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_ustazes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedUstaze> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('bio')) {
      context.handle(
        _bioMeta,
        bio.isAcceptableOrUnknown(data['bio']!, _bioMeta),
      );
    }
    if (data.containsKey('photo_url')) {
      context.handle(
        _photoUrlMeta,
        photoUrl.isAcceptableOrUnknown(data['photo_url']!, _photoUrlMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedUstaze map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedUstaze(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      bio: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}bio'],
      ),
      photoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_url'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedUstazesTable createAlias(String alias) {
    return $CachedUstazesTable(attachedDatabase, alias);
  }
}

class CachedUstaze extends DataClass implements Insertable<CachedUstaze> {
  final int id;
  final String name;
  final String slug;
  final String? bio;
  final String? photoUrl;
  final int sortOrder;
  final bool isActive;
  final DateTime cachedAt;
  const CachedUstaze({
    required this.id,
    required this.name,
    required this.slug,
    this.bio,
    this.photoUrl,
    required this.sortOrder,
    required this.isActive,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['slug'] = Variable<String>(slug);
    if (!nullToAbsent || bio != null) {
      map['bio'] = Variable<String>(bio);
    }
    if (!nullToAbsent || photoUrl != null) {
      map['photo_url'] = Variable<String>(photoUrl);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_active'] = Variable<bool>(isActive);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedUstazesCompanion toCompanion(bool nullToAbsent) {
    return CachedUstazesCompanion(
      id: Value(id),
      name: Value(name),
      slug: Value(slug),
      bio: bio == null && nullToAbsent ? const Value.absent() : Value(bio),
      photoUrl: photoUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(photoUrl),
      sortOrder: Value(sortOrder),
      isActive: Value(isActive),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedUstaze.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedUstaze(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      slug: serializer.fromJson<String>(json['slug']),
      bio: serializer.fromJson<String?>(json['bio']),
      photoUrl: serializer.fromJson<String?>(json['photoUrl']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'slug': serializer.toJson<String>(slug),
      'bio': serializer.toJson<String?>(bio),
      'photoUrl': serializer.toJson<String?>(photoUrl),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isActive': serializer.toJson<bool>(isActive),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedUstaze copyWith({
    int? id,
    String? name,
    String? slug,
    Value<String?> bio = const Value.absent(),
    Value<String?> photoUrl = const Value.absent(),
    int? sortOrder,
    bool? isActive,
    DateTime? cachedAt,
  }) => CachedUstaze(
    id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
    bio: bio.present ? bio.value : this.bio,
    photoUrl: photoUrl.present ? photoUrl.value : this.photoUrl,
    sortOrder: sortOrder ?? this.sortOrder,
    isActive: isActive ?? this.isActive,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedUstaze copyWithCompanion(CachedUstazesCompanion data) {
    return CachedUstaze(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      slug: data.slug.present ? data.slug.value : this.slug,
      bio: data.bio.present ? data.bio.value : this.bio,
      photoUrl: data.photoUrl.present ? data.photoUrl.value : this.photoUrl,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedUstaze(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('bio: $bio, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isActive: $isActive, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, slug, bio, photoUrl, sortOrder, isActive, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedUstaze &&
          other.id == this.id &&
          other.name == this.name &&
          other.slug == this.slug &&
          other.bio == this.bio &&
          other.photoUrl == this.photoUrl &&
          other.sortOrder == this.sortOrder &&
          other.isActive == this.isActive &&
          other.cachedAt == this.cachedAt);
}

class CachedUstazesCompanion extends UpdateCompanion<CachedUstaze> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> slug;
  final Value<String?> bio;
  final Value<String?> photoUrl;
  final Value<int> sortOrder;
  final Value<bool> isActive;
  final Value<DateTime> cachedAt;
  const CachedUstazesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.slug = const Value.absent(),
    this.bio = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CachedUstazesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String slug,
    this.bio = const Value.absent(),
    this.photoUrl = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.cachedAt = const Value.absent(),
  }) : name = Value(name),
       slug = Value(slug);
  static Insertable<CachedUstaze> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? slug,
    Expression<String>? bio,
    Expression<String>? photoUrl,
    Expression<int>? sortOrder,
    Expression<bool>? isActive,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (bio != null) 'bio': bio,
      if (photoUrl != null) 'photo_url': photoUrl,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isActive != null) 'is_active': isActive,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CachedUstazesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? slug,
    Value<String?>? bio,
    Value<String?>? photoUrl,
    Value<int>? sortOrder,
    Value<bool>? isActive,
    Value<DateTime>? cachedAt,
  }) {
    return CachedUstazesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      bio: bio ?? this.bio,
      photoUrl: photoUrl ?? this.photoUrl,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (bio.present) {
      map['bio'] = Variable<String>(bio.value);
    }
    if (photoUrl.present) {
      map['photo_url'] = Variable<String>(photoUrl.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedUstazesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('bio: $bio, ')
          ..write('photoUrl: $photoUrl, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isActive: $isActive, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CachedTopicsTable extends CachedTopics
    with TableInfo<$CachedTopicsTable, CachedTopic> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedTopicsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isActiveMeta = const VerificationMeta(
    'isActive',
  );
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
    'is_active',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_active" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    slug,
    icon,
    color,
    sortOrder,
    isActive,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_topics';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedTopic> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_active')) {
      context.handle(
        _isActiveMeta,
        isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedTopic map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedTopic(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}color'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isActive: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_active'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedTopicsTable createAlias(String alias) {
    return $CachedTopicsTable(attachedDatabase, alias);
  }
}

class CachedTopic extends DataClass implements Insertable<CachedTopic> {
  final int id;
  final String name;
  final String slug;
  final String? icon;
  final String? color;
  final int sortOrder;
  final bool isActive;
  final DateTime cachedAt;
  const CachedTopic({
    required this.id,
    required this.name,
    required this.slug,
    this.icon,
    this.color,
    required this.sortOrder,
    required this.isActive,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['slug'] = Variable<String>(slug);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<String>(icon);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_active'] = Variable<bool>(isActive);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedTopicsCompanion toCompanion(bool nullToAbsent) {
    return CachedTopicsCompanion(
      id: Value(id),
      name: Value(name),
      slug: Value(slug),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      sortOrder: Value(sortOrder),
      isActive: Value(isActive),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedTopic.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedTopic(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      slug: serializer.fromJson<String>(json['slug']),
      icon: serializer.fromJson<String?>(json['icon']),
      color: serializer.fromJson<String?>(json['color']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'slug': serializer.toJson<String>(slug),
      'icon': serializer.toJson<String?>(icon),
      'color': serializer.toJson<String?>(color),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isActive': serializer.toJson<bool>(isActive),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedTopic copyWith({
    int? id,
    String? name,
    String? slug,
    Value<String?> icon = const Value.absent(),
    Value<String?> color = const Value.absent(),
    int? sortOrder,
    bool? isActive,
    DateTime? cachedAt,
  }) => CachedTopic(
    id: id ?? this.id,
    name: name ?? this.name,
    slug: slug ?? this.slug,
    icon: icon.present ? icon.value : this.icon,
    color: color.present ? color.value : this.color,
    sortOrder: sortOrder ?? this.sortOrder,
    isActive: isActive ?? this.isActive,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedTopic copyWithCompanion(CachedTopicsCompanion data) {
    return CachedTopic(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      slug: data.slug.present ? data.slug.value : this.slug,
      icon: data.icon.present ? data.icon.value : this.icon,
      color: data.color.present ? data.color.value : this.color,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedTopic(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isActive: $isActive, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, slug, icon, color, sortOrder, isActive, cachedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedTopic &&
          other.id == this.id &&
          other.name == this.name &&
          other.slug == this.slug &&
          other.icon == this.icon &&
          other.color == this.color &&
          other.sortOrder == this.sortOrder &&
          other.isActive == this.isActive &&
          other.cachedAt == this.cachedAt);
}

class CachedTopicsCompanion extends UpdateCompanion<CachedTopic> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> slug;
  final Value<String?> icon;
  final Value<String?> color;
  final Value<int> sortOrder;
  final Value<bool> isActive;
  final Value<DateTime> cachedAt;
  const CachedTopicsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.slug = const Value.absent(),
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CachedTopicsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String slug,
    this.icon = const Value.absent(),
    this.color = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isActive = const Value.absent(),
    this.cachedAt = const Value.absent(),
  }) : name = Value(name),
       slug = Value(slug);
  static Insertable<CachedTopic> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? slug,
    Expression<String>? icon,
    Expression<String>? color,
    Expression<int>? sortOrder,
    Expression<bool>? isActive,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      if (icon != null) 'icon': icon,
      if (color != null) 'color': color,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isActive != null) 'is_active': isActive,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CachedTopicsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? slug,
    Value<String?>? icon,
    Value<String?>? color,
    Value<int>? sortOrder,
    Value<bool>? isActive,
    Value<DateTime>? cachedAt,
  }) {
    return CachedTopicsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      sortOrder: sortOrder ?? this.sortOrder,
      isActive: isActive ?? this.isActive,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedTopicsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('slug: $slug, ')
          ..write('icon: $icon, ')
          ..write('color: $color, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isActive: $isActive, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CachedDersesTable extends CachedDerses
    with TableInfo<$CachedDersesTable, CachedDers> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedDersesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _slugMeta = const VerificationMeta('slug');
  @override
  late final GeneratedColumn<String> slug = GeneratedColumn<String>(
    'slug',
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
  static const VerificationMeta _coverImageUrlMeta = const VerificationMeta(
    'coverImageUrl',
  );
  @override
  late final GeneratedColumn<String> coverImageUrl = GeneratedColumn<String>(
    'cover_image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pdfUrlMeta = const VerificationMeta('pdfUrl');
  @override
  late final GeneratedColumn<String> pdfUrl = GeneratedColumn<String>(
    'pdf_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pdfPageCountMeta = const VerificationMeta(
    'pdfPageCount',
  );
  @override
  late final GeneratedColumn<int> pdfPageCount = GeneratedColumn<int>(
    'pdf_page_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _ustazIdMeta = const VerificationMeta(
    'ustazId',
  );
  @override
  late final GeneratedColumn<int> ustazId = GeneratedColumn<int>(
    'ustaz_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_ustazes (id)',
    ),
  );
  static const VerificationMeta _topicIdMeta = const VerificationMeta(
    'topicId',
  );
  @override
  late final GeneratedColumn<int> topicId = GeneratedColumn<int>(
    'topic_id',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_topics (id)',
    ),
  );
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPublishedMeta = const VerificationMeta(
    'isPublished',
  );
  @override
  late final GeneratedColumn<bool> isPublished = GeneratedColumn<bool>(
    'is_published',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_published" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
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
    slug,
    description,
    coverImageUrl,
    pdfUrl,
    pdfPageCount,
    ustazId,
    topicId,
    sortOrder,
    isPublished,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_derses';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedDers> instance, {
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
    if (data.containsKey('slug')) {
      context.handle(
        _slugMeta,
        slug.isAcceptableOrUnknown(data['slug']!, _slugMeta),
      );
    } else if (isInserting) {
      context.missing(_slugMeta);
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
    if (data.containsKey('cover_image_url')) {
      context.handle(
        _coverImageUrlMeta,
        coverImageUrl.isAcceptableOrUnknown(
          data['cover_image_url']!,
          _coverImageUrlMeta,
        ),
      );
    }
    if (data.containsKey('pdf_url')) {
      context.handle(
        _pdfUrlMeta,
        pdfUrl.isAcceptableOrUnknown(data['pdf_url']!, _pdfUrlMeta),
      );
    }
    if (data.containsKey('pdf_page_count')) {
      context.handle(
        _pdfPageCountMeta,
        pdfPageCount.isAcceptableOrUnknown(
          data['pdf_page_count']!,
          _pdfPageCountMeta,
        ),
      );
    }
    if (data.containsKey('ustaz_id')) {
      context.handle(
        _ustazIdMeta,
        ustazId.isAcceptableOrUnknown(data['ustaz_id']!, _ustazIdMeta),
      );
    } else if (isInserting) {
      context.missing(_ustazIdMeta);
    }
    if (data.containsKey('topic_id')) {
      context.handle(
        _topicIdMeta,
        topicId.isAcceptableOrUnknown(data['topic_id']!, _topicIdMeta),
      );
    }
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_published')) {
      context.handle(
        _isPublishedMeta,
        isPublished.isAcceptableOrUnknown(
          data['is_published']!,
          _isPublishedMeta,
        ),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedDers map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedDers(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      slug: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}slug'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      coverImageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cover_image_url'],
      ),
      pdfUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pdf_url'],
      ),
      pdfPageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}pdf_page_count'],
      )!,
      ustazId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ustaz_id'],
      )!,
      topicId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}topic_id'],
      ),
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isPublished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_published'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedDersesTable createAlias(String alias) {
    return $CachedDersesTable(attachedDatabase, alias);
  }
}

class CachedDers extends DataClass implements Insertable<CachedDers> {
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
  final DateTime cachedAt;
  const CachedDers({
    required this.id,
    required this.title,
    required this.slug,
    this.description,
    this.coverImageUrl,
    this.pdfUrl,
    required this.pdfPageCount,
    required this.ustazId,
    this.topicId,
    required this.sortOrder,
    required this.isPublished,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    map['slug'] = Variable<String>(slug);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || coverImageUrl != null) {
      map['cover_image_url'] = Variable<String>(coverImageUrl);
    }
    if (!nullToAbsent || pdfUrl != null) {
      map['pdf_url'] = Variable<String>(pdfUrl);
    }
    map['pdf_page_count'] = Variable<int>(pdfPageCount);
    map['ustaz_id'] = Variable<int>(ustazId);
    if (!nullToAbsent || topicId != null) {
      map['topic_id'] = Variable<int>(topicId);
    }
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_published'] = Variable<bool>(isPublished);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedDersesCompanion toCompanion(bool nullToAbsent) {
    return CachedDersesCompanion(
      id: Value(id),
      title: Value(title),
      slug: Value(slug),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      coverImageUrl: coverImageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(coverImageUrl),
      pdfUrl: pdfUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(pdfUrl),
      pdfPageCount: Value(pdfPageCount),
      ustazId: Value(ustazId),
      topicId: topicId == null && nullToAbsent
          ? const Value.absent()
          : Value(topicId),
      sortOrder: Value(sortOrder),
      isPublished: Value(isPublished),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedDers.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedDers(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      slug: serializer.fromJson<String>(json['slug']),
      description: serializer.fromJson<String?>(json['description']),
      coverImageUrl: serializer.fromJson<String?>(json['coverImageUrl']),
      pdfUrl: serializer.fromJson<String?>(json['pdfUrl']),
      pdfPageCount: serializer.fromJson<int>(json['pdfPageCount']),
      ustazId: serializer.fromJson<int>(json['ustazId']),
      topicId: serializer.fromJson<int?>(json['topicId']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isPublished: serializer.fromJson<bool>(json['isPublished']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'slug': serializer.toJson<String>(slug),
      'description': serializer.toJson<String?>(description),
      'coverImageUrl': serializer.toJson<String?>(coverImageUrl),
      'pdfUrl': serializer.toJson<String?>(pdfUrl),
      'pdfPageCount': serializer.toJson<int>(pdfPageCount),
      'ustazId': serializer.toJson<int>(ustazId),
      'topicId': serializer.toJson<int?>(topicId),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isPublished': serializer.toJson<bool>(isPublished),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedDers copyWith({
    int? id,
    String? title,
    String? slug,
    Value<String?> description = const Value.absent(),
    Value<String?> coverImageUrl = const Value.absent(),
    Value<String?> pdfUrl = const Value.absent(),
    int? pdfPageCount,
    int? ustazId,
    Value<int?> topicId = const Value.absent(),
    int? sortOrder,
    bool? isPublished,
    DateTime? cachedAt,
  }) => CachedDers(
    id: id ?? this.id,
    title: title ?? this.title,
    slug: slug ?? this.slug,
    description: description.present ? description.value : this.description,
    coverImageUrl: coverImageUrl.present
        ? coverImageUrl.value
        : this.coverImageUrl,
    pdfUrl: pdfUrl.present ? pdfUrl.value : this.pdfUrl,
    pdfPageCount: pdfPageCount ?? this.pdfPageCount,
    ustazId: ustazId ?? this.ustazId,
    topicId: topicId.present ? topicId.value : this.topicId,
    sortOrder: sortOrder ?? this.sortOrder,
    isPublished: isPublished ?? this.isPublished,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedDers copyWithCompanion(CachedDersesCompanion data) {
    return CachedDers(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      slug: data.slug.present ? data.slug.value : this.slug,
      description: data.description.present
          ? data.description.value
          : this.description,
      coverImageUrl: data.coverImageUrl.present
          ? data.coverImageUrl.value
          : this.coverImageUrl,
      pdfUrl: data.pdfUrl.present ? data.pdfUrl.value : this.pdfUrl,
      pdfPageCount: data.pdfPageCount.present
          ? data.pdfPageCount.value
          : this.pdfPageCount,
      ustazId: data.ustazId.present ? data.ustazId.value : this.ustazId,
      topicId: data.topicId.present ? data.topicId.value : this.topicId,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isPublished: data.isPublished.present
          ? data.isPublished.value
          : this.isPublished,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedDers(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('slug: $slug, ')
          ..write('description: $description, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('pdfUrl: $pdfUrl, ')
          ..write('pdfPageCount: $pdfPageCount, ')
          ..write('ustazId: $ustazId, ')
          ..write('topicId: $topicId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isPublished: $isPublished, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    slug,
    description,
    coverImageUrl,
    pdfUrl,
    pdfPageCount,
    ustazId,
    topicId,
    sortOrder,
    isPublished,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedDers &&
          other.id == this.id &&
          other.title == this.title &&
          other.slug == this.slug &&
          other.description == this.description &&
          other.coverImageUrl == this.coverImageUrl &&
          other.pdfUrl == this.pdfUrl &&
          other.pdfPageCount == this.pdfPageCount &&
          other.ustazId == this.ustazId &&
          other.topicId == this.topicId &&
          other.sortOrder == this.sortOrder &&
          other.isPublished == this.isPublished &&
          other.cachedAt == this.cachedAt);
}

class CachedDersesCompanion extends UpdateCompanion<CachedDers> {
  final Value<int> id;
  final Value<String> title;
  final Value<String> slug;
  final Value<String?> description;
  final Value<String?> coverImageUrl;
  final Value<String?> pdfUrl;
  final Value<int> pdfPageCount;
  final Value<int> ustazId;
  final Value<int?> topicId;
  final Value<int> sortOrder;
  final Value<bool> isPublished;
  final Value<DateTime> cachedAt;
  const CachedDersesCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.slug = const Value.absent(),
    this.description = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.pdfUrl = const Value.absent(),
    this.pdfPageCount = const Value.absent(),
    this.ustazId = const Value.absent(),
    this.topicId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isPublished = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CachedDersesCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    required String slug,
    this.description = const Value.absent(),
    this.coverImageUrl = const Value.absent(),
    this.pdfUrl = const Value.absent(),
    this.pdfPageCount = const Value.absent(),
    required int ustazId,
    this.topicId = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isPublished = const Value.absent(),
    this.cachedAt = const Value.absent(),
  }) : title = Value(title),
       slug = Value(slug),
       ustazId = Value(ustazId);
  static Insertable<CachedDers> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? slug,
    Expression<String>? description,
    Expression<String>? coverImageUrl,
    Expression<String>? pdfUrl,
    Expression<int>? pdfPageCount,
    Expression<int>? ustazId,
    Expression<int>? topicId,
    Expression<int>? sortOrder,
    Expression<bool>? isPublished,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (slug != null) 'slug': slug,
      if (description != null) 'description': description,
      if (coverImageUrl != null) 'cover_image_url': coverImageUrl,
      if (pdfUrl != null) 'pdf_url': pdfUrl,
      if (pdfPageCount != null) 'pdf_page_count': pdfPageCount,
      if (ustazId != null) 'ustaz_id': ustazId,
      if (topicId != null) 'topic_id': topicId,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isPublished != null) 'is_published': isPublished,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CachedDersesCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String>? slug,
    Value<String?>? description,
    Value<String?>? coverImageUrl,
    Value<String?>? pdfUrl,
    Value<int>? pdfPageCount,
    Value<int>? ustazId,
    Value<int?>? topicId,
    Value<int>? sortOrder,
    Value<bool>? isPublished,
    Value<DateTime>? cachedAt,
  }) {
    return CachedDersesCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      slug: slug ?? this.slug,
      description: description ?? this.description,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      pdfPageCount: pdfPageCount ?? this.pdfPageCount,
      ustazId: ustazId ?? this.ustazId,
      topicId: topicId ?? this.topicId,
      sortOrder: sortOrder ?? this.sortOrder,
      isPublished: isPublished ?? this.isPublished,
      cachedAt: cachedAt ?? this.cachedAt,
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
    if (slug.present) {
      map['slug'] = Variable<String>(slug.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (coverImageUrl.present) {
      map['cover_image_url'] = Variable<String>(coverImageUrl.value);
    }
    if (pdfUrl.present) {
      map['pdf_url'] = Variable<String>(pdfUrl.value);
    }
    if (pdfPageCount.present) {
      map['pdf_page_count'] = Variable<int>(pdfPageCount.value);
    }
    if (ustazId.present) {
      map['ustaz_id'] = Variable<int>(ustazId.value);
    }
    if (topicId.present) {
      map['topic_id'] = Variable<int>(topicId.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isPublished.present) {
      map['is_published'] = Variable<bool>(isPublished.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedDersesCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('slug: $slug, ')
          ..write('description: $description, ')
          ..write('coverImageUrl: $coverImageUrl, ')
          ..write('pdfUrl: $pdfUrl, ')
          ..write('pdfPageCount: $pdfPageCount, ')
          ..write('ustazId: $ustazId, ')
          ..write('topicId: $topicId, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isPublished: $isPublished, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CachedEpisodesTable extends CachedEpisodes
    with TableInfo<$CachedEpisodesTable, CachedEpisode> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedEpisodesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
      'REFERENCES cached_derses (id)',
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
  static const VerificationMeta _startPageMeta = const VerificationMeta(
    'startPage',
  );
  @override
  late final GeneratedColumn<int> startPage = GeneratedColumn<int>(
    'start_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endPageMeta = const VerificationMeta(
    'endPage',
  );
  @override
  late final GeneratedColumn<int> endPage = GeneratedColumn<int>(
    'end_page',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
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
  static const VerificationMeta _sortOrderMeta = const VerificationMeta(
    'sortOrder',
  );
  @override
  late final GeneratedColumn<int> sortOrder = GeneratedColumn<int>(
    'sort_order',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isPublishedMeta = const VerificationMeta(
    'isPublished',
  );
  @override
  late final GeneratedColumn<bool> isPublished = GeneratedColumn<bool>(
    'is_published',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_published" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    dersId,
    title,
    audioUrl,
    startPage,
    endPage,
    durationSeconds,
    sortOrder,
    isPublished,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_episodes';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedEpisode> instance, {
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('audio_url')) {
      context.handle(
        _audioUrlMeta,
        audioUrl.isAcceptableOrUnknown(data['audio_url']!, _audioUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_audioUrlMeta);
    }
    if (data.containsKey('start_page')) {
      context.handle(
        _startPageMeta,
        startPage.isAcceptableOrUnknown(data['start_page']!, _startPageMeta),
      );
    } else if (isInserting) {
      context.missing(_startPageMeta);
    }
    if (data.containsKey('end_page')) {
      context.handle(
        _endPageMeta,
        endPage.isAcceptableOrUnknown(data['end_page']!, _endPageMeta),
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
    if (data.containsKey('sort_order')) {
      context.handle(
        _sortOrderMeta,
        sortOrder.isAcceptableOrUnknown(data['sort_order']!, _sortOrderMeta),
      );
    }
    if (data.containsKey('is_published')) {
      context.handle(
        _isPublishedMeta,
        isPublished.isAcceptableOrUnknown(
          data['is_published']!,
          _isPublishedMeta,
        ),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedEpisode map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedEpisode(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      dersId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}ders_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      audioUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}audio_url'],
      )!,
      startPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_page'],
      )!,
      endPage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_page'],
      )!,
      durationSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_seconds'],
      )!,
      sortOrder: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}sort_order'],
      )!,
      isPublished: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_published'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $CachedEpisodesTable createAlias(String alias) {
    return $CachedEpisodesTable(attachedDatabase, alias);
  }
}

class CachedEpisode extends DataClass implements Insertable<CachedEpisode> {
  final int id;
  final int dersId;
  final String title;
  final String audioUrl;
  final int startPage;
  final int endPage;
  final int durationSeconds;
  final int sortOrder;
  final bool isPublished;
  final DateTime cachedAt;
  const CachedEpisode({
    required this.id,
    required this.dersId,
    required this.title,
    required this.audioUrl,
    required this.startPage,
    required this.endPage,
    required this.durationSeconds,
    required this.sortOrder,
    required this.isPublished,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['ders_id'] = Variable<int>(dersId);
    map['title'] = Variable<String>(title);
    map['audio_url'] = Variable<String>(audioUrl);
    map['start_page'] = Variable<int>(startPage);
    map['end_page'] = Variable<int>(endPage);
    map['duration_seconds'] = Variable<int>(durationSeconds);
    map['sort_order'] = Variable<int>(sortOrder);
    map['is_published'] = Variable<bool>(isPublished);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  CachedEpisodesCompanion toCompanion(bool nullToAbsent) {
    return CachedEpisodesCompanion(
      id: Value(id),
      dersId: Value(dersId),
      title: Value(title),
      audioUrl: Value(audioUrl),
      startPage: Value(startPage),
      endPage: Value(endPage),
      durationSeconds: Value(durationSeconds),
      sortOrder: Value(sortOrder),
      isPublished: Value(isPublished),
      cachedAt: Value(cachedAt),
    );
  }

  factory CachedEpisode.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedEpisode(
      id: serializer.fromJson<int>(json['id']),
      dersId: serializer.fromJson<int>(json['dersId']),
      title: serializer.fromJson<String>(json['title']),
      audioUrl: serializer.fromJson<String>(json['audioUrl']),
      startPage: serializer.fromJson<int>(json['startPage']),
      endPage: serializer.fromJson<int>(json['endPage']),
      durationSeconds: serializer.fromJson<int>(json['durationSeconds']),
      sortOrder: serializer.fromJson<int>(json['sortOrder']),
      isPublished: serializer.fromJson<bool>(json['isPublished']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'dersId': serializer.toJson<int>(dersId),
      'title': serializer.toJson<String>(title),
      'audioUrl': serializer.toJson<String>(audioUrl),
      'startPage': serializer.toJson<int>(startPage),
      'endPage': serializer.toJson<int>(endPage),
      'durationSeconds': serializer.toJson<int>(durationSeconds),
      'sortOrder': serializer.toJson<int>(sortOrder),
      'isPublished': serializer.toJson<bool>(isPublished),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  CachedEpisode copyWith({
    int? id,
    int? dersId,
    String? title,
    String? audioUrl,
    int? startPage,
    int? endPage,
    int? durationSeconds,
    int? sortOrder,
    bool? isPublished,
    DateTime? cachedAt,
  }) => CachedEpisode(
    id: id ?? this.id,
    dersId: dersId ?? this.dersId,
    title: title ?? this.title,
    audioUrl: audioUrl ?? this.audioUrl,
    startPage: startPage ?? this.startPage,
    endPage: endPage ?? this.endPage,
    durationSeconds: durationSeconds ?? this.durationSeconds,
    sortOrder: sortOrder ?? this.sortOrder,
    isPublished: isPublished ?? this.isPublished,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  CachedEpisode copyWithCompanion(CachedEpisodesCompanion data) {
    return CachedEpisode(
      id: data.id.present ? data.id.value : this.id,
      dersId: data.dersId.present ? data.dersId.value : this.dersId,
      title: data.title.present ? data.title.value : this.title,
      audioUrl: data.audioUrl.present ? data.audioUrl.value : this.audioUrl,
      startPage: data.startPage.present ? data.startPage.value : this.startPage,
      endPage: data.endPage.present ? data.endPage.value : this.endPage,
      durationSeconds: data.durationSeconds.present
          ? data.durationSeconds.value
          : this.durationSeconds,
      sortOrder: data.sortOrder.present ? data.sortOrder.value : this.sortOrder,
      isPublished: data.isPublished.present
          ? data.isPublished.value
          : this.isPublished,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedEpisode(')
          ..write('id: $id, ')
          ..write('dersId: $dersId, ')
          ..write('title: $title, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('startPage: $startPage, ')
          ..write('endPage: $endPage, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isPublished: $isPublished, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    dersId,
    title,
    audioUrl,
    startPage,
    endPage,
    durationSeconds,
    sortOrder,
    isPublished,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedEpisode &&
          other.id == this.id &&
          other.dersId == this.dersId &&
          other.title == this.title &&
          other.audioUrl == this.audioUrl &&
          other.startPage == this.startPage &&
          other.endPage == this.endPage &&
          other.durationSeconds == this.durationSeconds &&
          other.sortOrder == this.sortOrder &&
          other.isPublished == this.isPublished &&
          other.cachedAt == this.cachedAt);
}

class CachedEpisodesCompanion extends UpdateCompanion<CachedEpisode> {
  final Value<int> id;
  final Value<int> dersId;
  final Value<String> title;
  final Value<String> audioUrl;
  final Value<int> startPage;
  final Value<int> endPage;
  final Value<int> durationSeconds;
  final Value<int> sortOrder;
  final Value<bool> isPublished;
  final Value<DateTime> cachedAt;
  const CachedEpisodesCompanion({
    this.id = const Value.absent(),
    this.dersId = const Value.absent(),
    this.title = const Value.absent(),
    this.audioUrl = const Value.absent(),
    this.startPage = const Value.absent(),
    this.endPage = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isPublished = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  CachedEpisodesCompanion.insert({
    this.id = const Value.absent(),
    required int dersId,
    required String title,
    required String audioUrl,
    required int startPage,
    this.endPage = const Value.absent(),
    this.durationSeconds = const Value.absent(),
    this.sortOrder = const Value.absent(),
    this.isPublished = const Value.absent(),
    this.cachedAt = const Value.absent(),
  }) : dersId = Value(dersId),
       title = Value(title),
       audioUrl = Value(audioUrl),
       startPage = Value(startPage);
  static Insertable<CachedEpisode> custom({
    Expression<int>? id,
    Expression<int>? dersId,
    Expression<String>? title,
    Expression<String>? audioUrl,
    Expression<int>? startPage,
    Expression<int>? endPage,
    Expression<int>? durationSeconds,
    Expression<int>? sortOrder,
    Expression<bool>? isPublished,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (dersId != null) 'ders_id': dersId,
      if (title != null) 'title': title,
      if (audioUrl != null) 'audio_url': audioUrl,
      if (startPage != null) 'start_page': startPage,
      if (endPage != null) 'end_page': endPage,
      if (durationSeconds != null) 'duration_seconds': durationSeconds,
      if (sortOrder != null) 'sort_order': sortOrder,
      if (isPublished != null) 'is_published': isPublished,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  CachedEpisodesCompanion copyWith({
    Value<int>? id,
    Value<int>? dersId,
    Value<String>? title,
    Value<String>? audioUrl,
    Value<int>? startPage,
    Value<int>? endPage,
    Value<int>? durationSeconds,
    Value<int>? sortOrder,
    Value<bool>? isPublished,
    Value<DateTime>? cachedAt,
  }) {
    return CachedEpisodesCompanion(
      id: id ?? this.id,
      dersId: dersId ?? this.dersId,
      title: title ?? this.title,
      audioUrl: audioUrl ?? this.audioUrl,
      startPage: startPage ?? this.startPage,
      endPage: endPage ?? this.endPage,
      durationSeconds: durationSeconds ?? this.durationSeconds,
      sortOrder: sortOrder ?? this.sortOrder,
      isPublished: isPublished ?? this.isPublished,
      cachedAt: cachedAt ?? this.cachedAt,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (audioUrl.present) {
      map['audio_url'] = Variable<String>(audioUrl.value);
    }
    if (startPage.present) {
      map['start_page'] = Variable<int>(startPage.value);
    }
    if (endPage.present) {
      map['end_page'] = Variable<int>(endPage.value);
    }
    if (durationSeconds.present) {
      map['duration_seconds'] = Variable<int>(durationSeconds.value);
    }
    if (sortOrder.present) {
      map['sort_order'] = Variable<int>(sortOrder.value);
    }
    if (isPublished.present) {
      map['is_published'] = Variable<bool>(isPublished.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedEpisodesCompanion(')
          ..write('id: $id, ')
          ..write('dersId: $dersId, ')
          ..write('title: $title, ')
          ..write('audioUrl: $audioUrl, ')
          ..write('startPage: $startPage, ')
          ..write('endPage: $endPage, ')
          ..write('durationSeconds: $durationSeconds, ')
          ..write('sortOrder: $sortOrder, ')
          ..write('isPublished: $isPublished, ')
          ..write('cachedAt: $cachedAt')
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
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<int> episodeId = GeneratedColumn<int>(
    'episode_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_episodes (id)',
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
  static const VerificationMeta _fileSizeBytesMeta = const VerificationMeta(
    'fileSizeBytes',
  );
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
    'file_size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('completed'),
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
  List<GeneratedColumn> get $columns => [
    id,
    episodeId,
    localPath,
    fileSizeBytes,
    status,
    downloadedAt,
  ];
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
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_episodeIdMeta);
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    } else if (isInserting) {
      context.missing(_localPathMeta);
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
        _fileSizeBytesMeta,
        fileSizeBytes.isAcceptableOrUnknown(
          data['file_size_bytes']!,
          _fileSizeBytesMeta,
        ),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
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
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_id'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      fileSizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size_bytes'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
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
  final int episodeId;
  final String localPath;
  final int fileSizeBytes;
  final String status;
  final DateTime downloadedAt;
  const Download({
    required this.id,
    required this.episodeId,
    required this.localPath,
    required this.fileSizeBytes,
    required this.status,
    required this.downloadedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['episode_id'] = Variable<int>(episodeId);
    map['local_path'] = Variable<String>(localPath);
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    map['status'] = Variable<String>(status);
    map['downloaded_at'] = Variable<DateTime>(downloadedAt);
    return map;
  }

  DownloadsCompanion toCompanion(bool nullToAbsent) {
    return DownloadsCompanion(
      id: Value(id),
      episodeId: Value(episodeId),
      localPath: Value(localPath),
      fileSizeBytes: Value(fileSizeBytes),
      status: Value(status),
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
      episodeId: serializer.fromJson<int>(json['episodeId']),
      localPath: serializer.fromJson<String>(json['localPath']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      status: serializer.fromJson<String>(json['status']),
      downloadedAt: serializer.fromJson<DateTime>(json['downloadedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'episodeId': serializer.toJson<int>(episodeId),
      'localPath': serializer.toJson<String>(localPath),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'status': serializer.toJson<String>(status),
      'downloadedAt': serializer.toJson<DateTime>(downloadedAt),
    };
  }

  Download copyWith({
    int? id,
    int? episodeId,
    String? localPath,
    int? fileSizeBytes,
    String? status,
    DateTime? downloadedAt,
  }) => Download(
    id: id ?? this.id,
    episodeId: episodeId ?? this.episodeId,
    localPath: localPath ?? this.localPath,
    fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
    status: status ?? this.status,
    downloadedAt: downloadedAt ?? this.downloadedAt,
  );
  Download copyWithCompanion(DownloadsCompanion data) {
    return Download(
      id: data.id.present ? data.id.value : this.id,
      episodeId: data.episodeId.present ? data.episodeId.value : this.episodeId,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      status: data.status.present ? data.status.value : this.status,
      downloadedAt: data.downloadedAt.present
          ? data.downloadedAt.value
          : this.downloadedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Download(')
          ..write('id: $id, ')
          ..write('episodeId: $episodeId, ')
          ..write('localPath: $localPath, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('status: $status, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    episodeId,
    localPath,
    fileSizeBytes,
    status,
    downloadedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Download &&
          other.id == this.id &&
          other.episodeId == this.episodeId &&
          other.localPath == this.localPath &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.status == this.status &&
          other.downloadedAt == this.downloadedAt);
}

class DownloadsCompanion extends UpdateCompanion<Download> {
  final Value<int> id;
  final Value<int> episodeId;
  final Value<String> localPath;
  final Value<int> fileSizeBytes;
  final Value<String> status;
  final Value<DateTime> downloadedAt;
  const DownloadsCompanion({
    this.id = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.localPath = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.status = const Value.absent(),
    this.downloadedAt = const Value.absent(),
  });
  DownloadsCompanion.insert({
    this.id = const Value.absent(),
    required int episodeId,
    required String localPath,
    this.fileSizeBytes = const Value.absent(),
    this.status = const Value.absent(),
    this.downloadedAt = const Value.absent(),
  }) : episodeId = Value(episodeId),
       localPath = Value(localPath);
  static Insertable<Download> custom({
    Expression<int>? id,
    Expression<int>? episodeId,
    Expression<String>? localPath,
    Expression<int>? fileSizeBytes,
    Expression<String>? status,
    Expression<DateTime>? downloadedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (episodeId != null) 'episode_id': episodeId,
      if (localPath != null) 'local_path': localPath,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (status != null) 'status': status,
      if (downloadedAt != null) 'downloaded_at': downloadedAt,
    });
  }

  DownloadsCompanion copyWith({
    Value<int>? id,
    Value<int>? episodeId,
    Value<String>? localPath,
    Value<int>? fileSizeBytes,
    Value<String>? status,
    Value<DateTime>? downloadedAt,
  }) {
    return DownloadsCompanion(
      id: id ?? this.id,
      episodeId: episodeId ?? this.episodeId,
      localPath: localPath ?? this.localPath,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      status: status ?? this.status,
      downloadedAt: downloadedAt ?? this.downloadedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<int>(episodeId.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
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
          ..write('episodeId: $episodeId, ')
          ..write('localPath: $localPath, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('status: $status, ')
          ..write('downloadedAt: $downloadedAt')
          ..write(')'))
        .toString();
  }
}

class $ProgressTable extends Progress
    with TableInfo<$ProgressTable, PlaybackProgress> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProgressTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _episodeIdMeta = const VerificationMeta(
    'episodeId',
  );
  @override
  late final GeneratedColumn<int> episodeId = GeneratedColumn<int>(
    'episode_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES cached_episodes (id)',
    ),
  );
  static const VerificationMeta _positionSecondsMeta = const VerificationMeta(
    'positionSeconds',
  );
  @override
  late final GeneratedColumn<int> positionSeconds = GeneratedColumn<int>(
    'position_seconds',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isCompletedMeta = const VerificationMeta(
    'isCompleted',
  );
  @override
  late final GeneratedColumn<bool> isCompleted = GeneratedColumn<bool>(
    'is_completed',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_completed" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    episodeId,
    positionSeconds,
    isCompleted,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'progress';
  @override
  VerificationContext validateIntegrity(
    Insertable<PlaybackProgress> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('episode_id')) {
      context.handle(
        _episodeIdMeta,
        episodeId.isAcceptableOrUnknown(data['episode_id']!, _episodeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_episodeIdMeta);
    }
    if (data.containsKey('position_seconds')) {
      context.handle(
        _positionSecondsMeta,
        positionSeconds.isAcceptableOrUnknown(
          data['position_seconds']!,
          _positionSecondsMeta,
        ),
      );
    }
    if (data.containsKey('is_completed')) {
      context.handle(
        _isCompletedMeta,
        isCompleted.isAcceptableOrUnknown(
          data['is_completed']!,
          _isCompletedMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlaybackProgress map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlaybackProgress(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      episodeId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}episode_id'],
      )!,
      positionSeconds: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position_seconds'],
      )!,
      isCompleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_completed'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $ProgressTable createAlias(String alias) {
    return $ProgressTable(attachedDatabase, alias);
  }
}

class PlaybackProgress extends DataClass
    implements Insertable<PlaybackProgress> {
  final int id;
  final int episodeId;
  final int positionSeconds;
  final bool isCompleted;
  final DateTime updatedAt;
  const PlaybackProgress({
    required this.id,
    required this.episodeId,
    required this.positionSeconds,
    required this.isCompleted,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['episode_id'] = Variable<int>(episodeId);
    map['position_seconds'] = Variable<int>(positionSeconds);
    map['is_completed'] = Variable<bool>(isCompleted);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ProgressCompanion toCompanion(bool nullToAbsent) {
    return ProgressCompanion(
      id: Value(id),
      episodeId: Value(episodeId),
      positionSeconds: Value(positionSeconds),
      isCompleted: Value(isCompleted),
      updatedAt: Value(updatedAt),
    );
  }

  factory PlaybackProgress.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlaybackProgress(
      id: serializer.fromJson<int>(json['id']),
      episodeId: serializer.fromJson<int>(json['episodeId']),
      positionSeconds: serializer.fromJson<int>(json['positionSeconds']),
      isCompleted: serializer.fromJson<bool>(json['isCompleted']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'episodeId': serializer.toJson<int>(episodeId),
      'positionSeconds': serializer.toJson<int>(positionSeconds),
      'isCompleted': serializer.toJson<bool>(isCompleted),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PlaybackProgress copyWith({
    int? id,
    int? episodeId,
    int? positionSeconds,
    bool? isCompleted,
    DateTime? updatedAt,
  }) => PlaybackProgress(
    id: id ?? this.id,
    episodeId: episodeId ?? this.episodeId,
    positionSeconds: positionSeconds ?? this.positionSeconds,
    isCompleted: isCompleted ?? this.isCompleted,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PlaybackProgress copyWithCompanion(ProgressCompanion data) {
    return PlaybackProgress(
      id: data.id.present ? data.id.value : this.id,
      episodeId: data.episodeId.present ? data.episodeId.value : this.episodeId,
      positionSeconds: data.positionSeconds.present
          ? data.positionSeconds.value
          : this.positionSeconds,
      isCompleted: data.isCompleted.present
          ? data.isCompleted.value
          : this.isCompleted,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlaybackProgress(')
          ..write('id: $id, ')
          ..write('episodeId: $episodeId, ')
          ..write('positionSeconds: $positionSeconds, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, episodeId, positionSeconds, isCompleted, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlaybackProgress &&
          other.id == this.id &&
          other.episodeId == this.episodeId &&
          other.positionSeconds == this.positionSeconds &&
          other.isCompleted == this.isCompleted &&
          other.updatedAt == this.updatedAt);
}

class ProgressCompanion extends UpdateCompanion<PlaybackProgress> {
  final Value<int> id;
  final Value<int> episodeId;
  final Value<int> positionSeconds;
  final Value<bool> isCompleted;
  final Value<DateTime> updatedAt;
  const ProgressCompanion({
    this.id = const Value.absent(),
    this.episodeId = const Value.absent(),
    this.positionSeconds = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProgressCompanion.insert({
    this.id = const Value.absent(),
    required int episodeId,
    this.positionSeconds = const Value.absent(),
    this.isCompleted = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : episodeId = Value(episodeId);
  static Insertable<PlaybackProgress> custom({
    Expression<int>? id,
    Expression<int>? episodeId,
    Expression<int>? positionSeconds,
    Expression<bool>? isCompleted,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (episodeId != null) 'episode_id': episodeId,
      if (positionSeconds != null) 'position_seconds': positionSeconds,
      if (isCompleted != null) 'is_completed': isCompleted,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProgressCompanion copyWith({
    Value<int>? id,
    Value<int>? episodeId,
    Value<int>? positionSeconds,
    Value<bool>? isCompleted,
    Value<DateTime>? updatedAt,
  }) {
    return ProgressCompanion(
      id: id ?? this.id,
      episodeId: episodeId ?? this.episodeId,
      positionSeconds: positionSeconds ?? this.positionSeconds,
      isCompleted: isCompleted ?? this.isCompleted,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (episodeId.present) {
      map['episode_id'] = Variable<int>(episodeId.value);
    }
    if (positionSeconds.present) {
      map['position_seconds'] = Variable<int>(positionSeconds.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProgressCompanion(')
          ..write('id: $id, ')
          ..write('episodeId: $episodeId, ')
          ..write('positionSeconds: $positionSeconds, ')
          ..write('isCompleted: $isCompleted, ')
          ..write('updatedAt: $updatedAt')
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
  static const VerificationMeta _entityTypeMeta = const VerificationMeta(
    'entityType',
  );
  @override
  late final GeneratedColumn<String> entityType = GeneratedColumn<String>(
    'entity_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _entityIdMeta = const VerificationMeta(
    'entityId',
  );
  @override
  late final GeneratedColumn<int> entityId = GeneratedColumn<int>(
    'entity_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [id, entityType, entityId, addedAt];
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
    if (data.containsKey('entity_type')) {
      context.handle(
        _entityTypeMeta,
        entityType.isAcceptableOrUnknown(data['entity_type']!, _entityTypeMeta),
      );
    } else if (isInserting) {
      context.missing(_entityTypeMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(
        _entityIdMeta,
        entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta),
      );
    } else if (isInserting) {
      context.missing(_entityIdMeta);
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
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {entityType, entityId},
  ];
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      entityType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}entity_type'],
      )!,
      entityId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}entity_id'],
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
  final String entityType;
  final int entityId;
  final DateTime addedAt;
  const Favorite({
    required this.id,
    required this.entityType,
    required this.entityId,
    required this.addedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['entity_type'] = Variable<String>(entityType);
    map['entity_id'] = Variable<int>(entityId);
    map['added_at'] = Variable<DateTime>(addedAt);
    return map;
  }

  FavoritesCompanion toCompanion(bool nullToAbsent) {
    return FavoritesCompanion(
      id: Value(id),
      entityType: Value(entityType),
      entityId: Value(entityId),
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
      entityType: serializer.fromJson<String>(json['entityType']),
      entityId: serializer.fromJson<int>(json['entityId']),
      addedAt: serializer.fromJson<DateTime>(json['addedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'entityType': serializer.toJson<String>(entityType),
      'entityId': serializer.toJson<int>(entityId),
      'addedAt': serializer.toJson<DateTime>(addedAt),
    };
  }

  Favorite copyWith({
    int? id,
    String? entityType,
    int? entityId,
    DateTime? addedAt,
  }) => Favorite(
    id: id ?? this.id,
    entityType: entityType ?? this.entityType,
    entityId: entityId ?? this.entityId,
    addedAt: addedAt ?? this.addedAt,
  );
  Favorite copyWithCompanion(FavoritesCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      entityType: data.entityType.present
          ? data.entityType.value
          : this.entityType,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      addedAt: data.addedAt.present ? data.addedAt.value : this.addedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, entityType, entityId, addedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.entityType == this.entityType &&
          other.entityId == this.entityId &&
          other.addedAt == this.addedAt);
}

class FavoritesCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<String> entityType;
  final Value<int> entityId;
  final Value<DateTime> addedAt;
  const FavoritesCompanion({
    this.id = const Value.absent(),
    this.entityType = const Value.absent(),
    this.entityId = const Value.absent(),
    this.addedAt = const Value.absent(),
  });
  FavoritesCompanion.insert({
    this.id = const Value.absent(),
    required String entityType,
    required int entityId,
    this.addedAt = const Value.absent(),
  }) : entityType = Value(entityType),
       entityId = Value(entityId);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<String>? entityType,
    Expression<int>? entityId,
    Expression<DateTime>? addedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (entityType != null) 'entity_type': entityType,
      if (entityId != null) 'entity_id': entityId,
      if (addedAt != null) 'added_at': addedAt,
    });
  }

  FavoritesCompanion copyWith({
    Value<int>? id,
    Value<String>? entityType,
    Value<int>? entityId,
    Value<DateTime>? addedAt,
  }) {
    return FavoritesCompanion(
      id: id ?? this.id,
      entityType: entityType ?? this.entityType,
      entityId: entityId ?? this.entityId,
      addedAt: addedAt ?? this.addedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (entityType.present) {
      map['entity_type'] = Variable<String>(entityType.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<int>(entityId.value);
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
          ..write('entityType: $entityType, ')
          ..write('entityId: $entityId, ')
          ..write('addedAt: $addedAt')
          ..write(')'))
        .toString();
  }
}

class $SettingsTable extends Settings
    with TableInfo<$SettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $SettingsTable createAlias(String alias) {
    return $SettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  SettingsCompanion toCompanion(bool nullToAbsent) {
    return SettingsCompanion(
      key: Value(key),
      value: Value(value),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({String? key, String? value, DateTime? updatedAt}) =>
      AppSetting(
        key: key ?? this.key,
        value: value ?? this.value,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AppSetting copyWithCompanion(SettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.updatedAt == this.updatedAt);
}

class SettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const SettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SettingsCompanion.insert({
    required String key,
    required String value,
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return SettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedUstazesTable cachedUstazes = $CachedUstazesTable(this);
  late final $CachedTopicsTable cachedTopics = $CachedTopicsTable(this);
  late final $CachedDersesTable cachedDerses = $CachedDersesTable(this);
  late final $CachedEpisodesTable cachedEpisodes = $CachedEpisodesTable(this);
  late final $DownloadsTable downloads = $DownloadsTable(this);
  late final $ProgressTable progress = $ProgressTable(this);
  late final $FavoritesTable favorites = $FavoritesTable(this);
  late final $SettingsTable settings = $SettingsTable(this);
  late final CachedUstazesDao cachedUstazesDao = CachedUstazesDao(
    this as AppDatabase,
  );
  late final CachedTopicsDao cachedTopicsDao = CachedTopicsDao(
    this as AppDatabase,
  );
  late final CachedDersesDao cachedDersesDao = CachedDersesDao(
    this as AppDatabase,
  );
  late final CachedEpisodesDao cachedEpisodesDao = CachedEpisodesDao(
    this as AppDatabase,
  );
  late final DownloadsDao downloadsDao = DownloadsDao(this as AppDatabase);
  late final ProgressDao progressDao = ProgressDao(this as AppDatabase);
  late final FavoritesDao favoritesDao = FavoritesDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    cachedUstazes,
    cachedTopics,
    cachedDerses,
    cachedEpisodes,
    downloads,
    progress,
    favorites,
    settings,
  ];
}

typedef $$CachedUstazesTableCreateCompanionBuilder =
    CachedUstazesCompanion Function({
      Value<int> id,
      required String name,
      required String slug,
      Value<String?> bio,
      Value<String?> photoUrl,
      Value<int> sortOrder,
      Value<bool> isActive,
      Value<DateTime> cachedAt,
    });
typedef $$CachedUstazesTableUpdateCompanionBuilder =
    CachedUstazesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> slug,
      Value<String?> bio,
      Value<String?> photoUrl,
      Value<int> sortOrder,
      Value<bool> isActive,
      Value<DateTime> cachedAt,
    });

final class $$CachedUstazesTableReferences
    extends BaseReferences<_$AppDatabase, $CachedUstazesTable, CachedUstaze> {
  $$CachedUstazesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$CachedDersesTable, List<CachedDers>>
  _cachedDersesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cachedDerses,
    aliasName: $_aliasNameGenerator(
      db.cachedUstazes.id,
      db.cachedDerses.ustazId,
    ),
  );

  $$CachedDersesTableProcessedTableManager get cachedDersesRefs {
    final manager = $$CachedDersesTableTableManager(
      $_db,
      $_db.cachedDerses,
    ).filter((f) => f.ustazId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cachedDersesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedUstazesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedUstazesTable> {
  $$CachedUstazesTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cachedDersesRefs(
    Expression<bool> Function($$CachedDersesTableFilterComposer f) f,
  ) {
    final $$CachedDersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.ustazId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableFilterComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedUstazesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedUstazesTable> {
  $$CachedUstazesTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bio => $composableBuilder(
    column: $table.bio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoUrl => $composableBuilder(
    column: $table.photoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedUstazesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedUstazesTable> {
  $$CachedUstazesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get bio =>
      $composableBuilder(column: $table.bio, builder: (column) => column);

  GeneratedColumn<String> get photoUrl =>
      $composableBuilder(column: $table.photoUrl, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  Expression<T> cachedDersesRefs<T extends Object>(
    Expression<T> Function($$CachedDersesTableAnnotationComposer a) f,
  ) {
    final $$CachedDersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.ustazId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedUstazesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedUstazesTable,
          CachedUstaze,
          $$CachedUstazesTableFilterComposer,
          $$CachedUstazesTableOrderingComposer,
          $$CachedUstazesTableAnnotationComposer,
          $$CachedUstazesTableCreateCompanionBuilder,
          $$CachedUstazesTableUpdateCompanionBuilder,
          (CachedUstaze, $$CachedUstazesTableReferences),
          CachedUstaze,
          PrefetchHooks Function({bool cachedDersesRefs})
        > {
  $$CachedUstazesTableTableManager(_$AppDatabase db, $CachedUstazesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedUstazesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedUstazesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedUstazesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String?> bio = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedUstazesCompanion(
                id: id,
                name: name,
                slug: slug,
                bio: bio,
                photoUrl: photoUrl,
                sortOrder: sortOrder,
                isActive: isActive,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String slug,
                Value<String?> bio = const Value.absent(),
                Value<String?> photoUrl = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedUstazesCompanion.insert(
                id: id,
                name: name,
                slug: slug,
                bio: bio,
                photoUrl: photoUrl,
                sortOrder: sortOrder,
                isActive: isActive,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedUstazesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cachedDersesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cachedDersesRefs) db.cachedDerses],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedDersesRefs)
                    await $_getPrefetchedData<
                      CachedUstaze,
                      $CachedUstazesTable,
                      CachedDers
                    >(
                      currentTable: table,
                      referencedTable: $$CachedUstazesTableReferences
                          ._cachedDersesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CachedUstazesTableReferences(
                            db,
                            table,
                            p0,
                          ).cachedDersesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.ustazId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CachedUstazesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedUstazesTable,
      CachedUstaze,
      $$CachedUstazesTableFilterComposer,
      $$CachedUstazesTableOrderingComposer,
      $$CachedUstazesTableAnnotationComposer,
      $$CachedUstazesTableCreateCompanionBuilder,
      $$CachedUstazesTableUpdateCompanionBuilder,
      (CachedUstaze, $$CachedUstazesTableReferences),
      CachedUstaze,
      PrefetchHooks Function({bool cachedDersesRefs})
    >;
typedef $$CachedTopicsTableCreateCompanionBuilder =
    CachedTopicsCompanion Function({
      Value<int> id,
      required String name,
      required String slug,
      Value<String?> icon,
      Value<String?> color,
      Value<int> sortOrder,
      Value<bool> isActive,
      Value<DateTime> cachedAt,
    });
typedef $$CachedTopicsTableUpdateCompanionBuilder =
    CachedTopicsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> slug,
      Value<String?> icon,
      Value<String?> color,
      Value<int> sortOrder,
      Value<bool> isActive,
      Value<DateTime> cachedAt,
    });

final class $$CachedTopicsTableReferences
    extends BaseReferences<_$AppDatabase, $CachedTopicsTable, CachedTopic> {
  $$CachedTopicsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CachedDersesTable, List<CachedDers>>
  _cachedDersesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cachedDerses,
    aliasName: $_aliasNameGenerator(
      db.cachedTopics.id,
      db.cachedDerses.topicId,
    ),
  );

  $$CachedDersesTableProcessedTableManager get cachedDersesRefs {
    final manager = $$CachedDersesTableTableManager(
      $_db,
      $_db.cachedDerses,
    ).filter((f) => f.topicId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cachedDersesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedTopicsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedTopicsTable> {
  $$CachedTopicsTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> cachedDersesRefs(
    Expression<bool> Function($$CachedDersesTableFilterComposer f) f,
  ) {
    final $$CachedDersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableFilterComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedTopicsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedTopicsTable> {
  $$CachedTopicsTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isActive => $composableBuilder(
    column: $table.isActive,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedTopicsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedTopicsTable> {
  $$CachedTopicsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  Expression<T> cachedDersesRefs<T extends Object>(
    Expression<T> Function($$CachedDersesTableAnnotationComposer a) f,
  ) {
    final $$CachedDersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.topicId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedTopicsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedTopicsTable,
          CachedTopic,
          $$CachedTopicsTableFilterComposer,
          $$CachedTopicsTableOrderingComposer,
          $$CachedTopicsTableAnnotationComposer,
          $$CachedTopicsTableCreateCompanionBuilder,
          $$CachedTopicsTableUpdateCompanionBuilder,
          (CachedTopic, $$CachedTopicsTableReferences),
          CachedTopic,
          PrefetchHooks Function({bool cachedDersesRefs})
        > {
  $$CachedTopicsTableTableManager(_$AppDatabase db, $CachedTopicsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedTopicsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedTopicsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedTopicsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String?> icon = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedTopicsCompanion(
                id: id,
                name: name,
                slug: slug,
                icon: icon,
                color: color,
                sortOrder: sortOrder,
                isActive: isActive,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String slug,
                Value<String?> icon = const Value.absent(),
                Value<String?> color = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isActive = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedTopicsCompanion.insert(
                id: id,
                name: name,
                slug: slug,
                icon: icon,
                color: color,
                sortOrder: sortOrder,
                isActive: isActive,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedTopicsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({cachedDersesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (cachedDersesRefs) db.cachedDerses],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (cachedDersesRefs)
                    await $_getPrefetchedData<
                      CachedTopic,
                      $CachedTopicsTable,
                      CachedDers
                    >(
                      currentTable: table,
                      referencedTable: $$CachedTopicsTableReferences
                          ._cachedDersesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CachedTopicsTableReferences(
                            db,
                            table,
                            p0,
                          ).cachedDersesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.topicId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CachedTopicsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedTopicsTable,
      CachedTopic,
      $$CachedTopicsTableFilterComposer,
      $$CachedTopicsTableOrderingComposer,
      $$CachedTopicsTableAnnotationComposer,
      $$CachedTopicsTableCreateCompanionBuilder,
      $$CachedTopicsTableUpdateCompanionBuilder,
      (CachedTopic, $$CachedTopicsTableReferences),
      CachedTopic,
      PrefetchHooks Function({bool cachedDersesRefs})
    >;
typedef $$CachedDersesTableCreateCompanionBuilder =
    CachedDersesCompanion Function({
      Value<int> id,
      required String title,
      required String slug,
      Value<String?> description,
      Value<String?> coverImageUrl,
      Value<String?> pdfUrl,
      Value<int> pdfPageCount,
      required int ustazId,
      Value<int?> topicId,
      Value<int> sortOrder,
      Value<bool> isPublished,
      Value<DateTime> cachedAt,
    });
typedef $$CachedDersesTableUpdateCompanionBuilder =
    CachedDersesCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String> slug,
      Value<String?> description,
      Value<String?> coverImageUrl,
      Value<String?> pdfUrl,
      Value<int> pdfPageCount,
      Value<int> ustazId,
      Value<int?> topicId,
      Value<int> sortOrder,
      Value<bool> isPublished,
      Value<DateTime> cachedAt,
    });

final class $$CachedDersesTableReferences
    extends BaseReferences<_$AppDatabase, $CachedDersesTable, CachedDers> {
  $$CachedDersesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CachedUstazesTable _ustazIdTable(_$AppDatabase db) =>
      db.cachedUstazes.createAlias(
        $_aliasNameGenerator(db.cachedDerses.ustazId, db.cachedUstazes.id),
      );

  $$CachedUstazesTableProcessedTableManager get ustazId {
    final $_column = $_itemColumn<int>('ustaz_id')!;

    final manager = $$CachedUstazesTableTableManager(
      $_db,
      $_db.cachedUstazes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ustazIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CachedTopicsTable _topicIdTable(_$AppDatabase db) =>
      db.cachedTopics.createAlias(
        $_aliasNameGenerator(db.cachedDerses.topicId, db.cachedTopics.id),
      );

  $$CachedTopicsTableProcessedTableManager? get topicId {
    final $_column = $_itemColumn<int>('topic_id');
    if ($_column == null) return null;
    final manager = $$CachedTopicsTableTableManager(
      $_db,
      $_db.cachedTopics,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_topicIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$CachedEpisodesTable, List<CachedEpisode>>
  _cachedEpisodesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.cachedEpisodes,
    aliasName: $_aliasNameGenerator(
      db.cachedDerses.id,
      db.cachedEpisodes.dersId,
    ),
  );

  $$CachedEpisodesTableProcessedTableManager get cachedEpisodesRefs {
    final manager = $$CachedEpisodesTableTableManager(
      $_db,
      $_db.cachedEpisodes,
    ).filter((f) => f.dersId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_cachedEpisodesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedDersesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedDersesTable> {
  $$CachedDersesTableFilterComposer({
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

  ColumnFilters<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pdfUrl => $composableBuilder(
    column: $table.pdfUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pdfPageCount => $composableBuilder(
    column: $table.pdfPageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPublished => $composableBuilder(
    column: $table.isPublished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedUstazesTableFilterComposer get ustazId {
    final $$CachedUstazesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ustazId,
      referencedTable: $db.cachedUstazes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedUstazesTableFilterComposer(
            $db: $db,
            $table: $db.cachedUstazes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CachedTopicsTableFilterComposer get topicId {
    final $$CachedTopicsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.cachedTopics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedTopicsTableFilterComposer(
            $db: $db,
            $table: $db.cachedTopics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> cachedEpisodesRefs(
    Expression<bool> Function($$CachedEpisodesTableFilterComposer f) f,
  ) {
    final $$CachedEpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.dersId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableFilterComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedDersesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedDersesTable> {
  $$CachedDersesTableOrderingComposer({
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

  ColumnOrderings<String> get slug => $composableBuilder(
    column: $table.slug,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pdfUrl => $composableBuilder(
    column: $table.pdfUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pdfPageCount => $composableBuilder(
    column: $table.pdfPageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPublished => $composableBuilder(
    column: $table.isPublished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedUstazesTableOrderingComposer get ustazId {
    final $$CachedUstazesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ustazId,
      referencedTable: $db.cachedUstazes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedUstazesTableOrderingComposer(
            $db: $db,
            $table: $db.cachedUstazes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CachedTopicsTableOrderingComposer get topicId {
    final $$CachedTopicsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.cachedTopics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedTopicsTableOrderingComposer(
            $db: $db,
            $table: $db.cachedTopics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedDersesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedDersesTable> {
  $$CachedDersesTableAnnotationComposer({
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

  GeneratedColumn<String> get slug =>
      $composableBuilder(column: $table.slug, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get coverImageUrl => $composableBuilder(
    column: $table.coverImageUrl,
    builder: (column) => column,
  );

  GeneratedColumn<String> get pdfUrl =>
      $composableBuilder(column: $table.pdfUrl, builder: (column) => column);

  GeneratedColumn<int> get pdfPageCount => $composableBuilder(
    column: $table.pdfPageCount,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isPublished => $composableBuilder(
    column: $table.isPublished,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  $$CachedUstazesTableAnnotationComposer get ustazId {
    final $$CachedUstazesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ustazId,
      referencedTable: $db.cachedUstazes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedUstazesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedUstazes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CachedTopicsTableAnnotationComposer get topicId {
    final $$CachedTopicsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.topicId,
      referencedTable: $db.cachedTopics,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedTopicsTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedTopics,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> cachedEpisodesRefs<T extends Object>(
    Expression<T> Function($$CachedEpisodesTableAnnotationComposer a) f,
  ) {
    final $$CachedEpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.dersId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedDersesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedDersesTable,
          CachedDers,
          $$CachedDersesTableFilterComposer,
          $$CachedDersesTableOrderingComposer,
          $$CachedDersesTableAnnotationComposer,
          $$CachedDersesTableCreateCompanionBuilder,
          $$CachedDersesTableUpdateCompanionBuilder,
          (CachedDers, $$CachedDersesTableReferences),
          CachedDers,
          PrefetchHooks Function({
            bool ustazId,
            bool topicId,
            bool cachedEpisodesRefs,
          })
        > {
  $$CachedDersesTableTableManager(_$AppDatabase db, $CachedDersesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedDersesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedDersesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedDersesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> slug = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> coverImageUrl = const Value.absent(),
                Value<String?> pdfUrl = const Value.absent(),
                Value<int> pdfPageCount = const Value.absent(),
                Value<int> ustazId = const Value.absent(),
                Value<int?> topicId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isPublished = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedDersesCompanion(
                id: id,
                title: title,
                slug: slug,
                description: description,
                coverImageUrl: coverImageUrl,
                pdfUrl: pdfUrl,
                pdfPageCount: pdfPageCount,
                ustazId: ustazId,
                topicId: topicId,
                sortOrder: sortOrder,
                isPublished: isPublished,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                required String slug,
                Value<String?> description = const Value.absent(),
                Value<String?> coverImageUrl = const Value.absent(),
                Value<String?> pdfUrl = const Value.absent(),
                Value<int> pdfPageCount = const Value.absent(),
                required int ustazId,
                Value<int?> topicId = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isPublished = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedDersesCompanion.insert(
                id: id,
                title: title,
                slug: slug,
                description: description,
                coverImageUrl: coverImageUrl,
                pdfUrl: pdfUrl,
                pdfPageCount: pdfPageCount,
                ustazId: ustazId,
                topicId: topicId,
                sortOrder: sortOrder,
                isPublished: isPublished,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedDersesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({ustazId = false, topicId = false, cachedEpisodesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (cachedEpisodesRefs) db.cachedEpisodes,
                  ],
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
                        if (ustazId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.ustazId,
                                    referencedTable:
                                        $$CachedDersesTableReferences
                                            ._ustazIdTable(db),
                                    referencedColumn:
                                        $$CachedDersesTableReferences
                                            ._ustazIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }
                        if (topicId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.topicId,
                                    referencedTable:
                                        $$CachedDersesTableReferences
                                            ._topicIdTable(db),
                                    referencedColumn:
                                        $$CachedDersesTableReferences
                                            ._topicIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (cachedEpisodesRefs)
                        await $_getPrefetchedData<
                          CachedDers,
                          $CachedDersesTable,
                          CachedEpisode
                        >(
                          currentTable: table,
                          referencedTable: $$CachedDersesTableReferences
                              ._cachedEpisodesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedDersesTableReferences(
                                db,
                                table,
                                p0,
                              ).cachedEpisodesRefs,
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

typedef $$CachedDersesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedDersesTable,
      CachedDers,
      $$CachedDersesTableFilterComposer,
      $$CachedDersesTableOrderingComposer,
      $$CachedDersesTableAnnotationComposer,
      $$CachedDersesTableCreateCompanionBuilder,
      $$CachedDersesTableUpdateCompanionBuilder,
      (CachedDers, $$CachedDersesTableReferences),
      CachedDers,
      PrefetchHooks Function({
        bool ustazId,
        bool topicId,
        bool cachedEpisodesRefs,
      })
    >;
typedef $$CachedEpisodesTableCreateCompanionBuilder =
    CachedEpisodesCompanion Function({
      Value<int> id,
      required int dersId,
      required String title,
      required String audioUrl,
      required int startPage,
      Value<int> endPage,
      Value<int> durationSeconds,
      Value<int> sortOrder,
      Value<bool> isPublished,
      Value<DateTime> cachedAt,
    });
typedef $$CachedEpisodesTableUpdateCompanionBuilder =
    CachedEpisodesCompanion Function({
      Value<int> id,
      Value<int> dersId,
      Value<String> title,
      Value<String> audioUrl,
      Value<int> startPage,
      Value<int> endPage,
      Value<int> durationSeconds,
      Value<int> sortOrder,
      Value<bool> isPublished,
      Value<DateTime> cachedAt,
    });

final class $$CachedEpisodesTableReferences
    extends BaseReferences<_$AppDatabase, $CachedEpisodesTable, CachedEpisode> {
  $$CachedEpisodesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $CachedDersesTable _dersIdTable(_$AppDatabase db) =>
      db.cachedDerses.createAlias(
        $_aliasNameGenerator(db.cachedEpisodes.dersId, db.cachedDerses.id),
      );

  $$CachedDersesTableProcessedTableManager get dersId {
    final $_column = $_itemColumn<int>('ders_id')!;

    final manager = $$CachedDersesTableTableManager(
      $_db,
      $_db.cachedDerses,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_dersIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$DownloadsTable, List<Download>>
  _downloadsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.downloads,
    aliasName: $_aliasNameGenerator(
      db.cachedEpisodes.id,
      db.downloads.episodeId,
    ),
  );

  $$DownloadsTableProcessedTableManager get downloadsRefs {
    final manager = $$DownloadsTableTableManager(
      $_db,
      $_db.downloads,
    ).filter((f) => f.episodeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_downloadsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ProgressTable, List<PlaybackProgress>>
  _progressRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.progress,
    aliasName: $_aliasNameGenerator(
      db.cachedEpisodes.id,
      db.progress.episodeId,
    ),
  );

  $$ProgressTableProcessedTableManager get progressRefs {
    final manager = $$ProgressTableTableManager(
      $_db,
      $_db.progress,
    ).filter((f) => f.episodeId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_progressRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CachedEpisodesTableFilterComposer
    extends Composer<_$AppDatabase, $CachedEpisodesTable> {
  $$CachedEpisodesTableFilterComposer({
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

  ColumnFilters<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get startPage => $composableBuilder(
    column: $table.startPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endPage => $composableBuilder(
    column: $table.endPage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isPublished => $composableBuilder(
    column: $table.isPublished,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedDersesTableFilterComposer get dersId {
    final $$CachedDersesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableFilterComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> downloadsRefs(
    Expression<bool> Function($$DownloadsTableFilterComposer f) f,
  ) {
    final $$DownloadsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.downloads,
      getReferencedColumn: (t) => t.episodeId,
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

  Expression<bool> progressRefs(
    Expression<bool> Function($$ProgressTableFilterComposer f) f,
  ) {
    final $$ProgressTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.progress,
      getReferencedColumn: (t) => t.episodeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressTableFilterComposer(
            $db: $db,
            $table: $db.progress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedEpisodesTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedEpisodesTable> {
  $$CachedEpisodesTableOrderingComposer({
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

  ColumnOrderings<String> get audioUrl => $composableBuilder(
    column: $table.audioUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get startPage => $composableBuilder(
    column: $table.startPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endPage => $composableBuilder(
    column: $table.endPage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get sortOrder => $composableBuilder(
    column: $table.sortOrder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isPublished => $composableBuilder(
    column: $table.isPublished,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedDersesTableOrderingComposer get dersId {
    final $$CachedDersesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableOrderingComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CachedEpisodesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedEpisodesTable> {
  $$CachedEpisodesTableAnnotationComposer({
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

  GeneratedColumn<String> get audioUrl =>
      $composableBuilder(column: $table.audioUrl, builder: (column) => column);

  GeneratedColumn<int> get startPage =>
      $composableBuilder(column: $table.startPage, builder: (column) => column);

  GeneratedColumn<int> get endPage =>
      $composableBuilder(column: $table.endPage, builder: (column) => column);

  GeneratedColumn<int> get durationSeconds => $composableBuilder(
    column: $table.durationSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<int> get sortOrder =>
      $composableBuilder(column: $table.sortOrder, builder: (column) => column);

  GeneratedColumn<bool> get isPublished => $composableBuilder(
    column: $table.isPublished,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  $$CachedDersesTableAnnotationComposer get dersId {
    final $$CachedDersesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.dersId,
      referencedTable: $db.cachedDerses,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedDersesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedDerses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> downloadsRefs<T extends Object>(
    Expression<T> Function($$DownloadsTableAnnotationComposer a) f,
  ) {
    final $$DownloadsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.downloads,
      getReferencedColumn: (t) => t.episodeId,
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

  Expression<T> progressRefs<T extends Object>(
    Expression<T> Function($$ProgressTableAnnotationComposer a) f,
  ) {
    final $$ProgressTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.progress,
      getReferencedColumn: (t) => t.episodeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ProgressTableAnnotationComposer(
            $db: $db,
            $table: $db.progress,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CachedEpisodesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedEpisodesTable,
          CachedEpisode,
          $$CachedEpisodesTableFilterComposer,
          $$CachedEpisodesTableOrderingComposer,
          $$CachedEpisodesTableAnnotationComposer,
          $$CachedEpisodesTableCreateCompanionBuilder,
          $$CachedEpisodesTableUpdateCompanionBuilder,
          (CachedEpisode, $$CachedEpisodesTableReferences),
          CachedEpisode,
          PrefetchHooks Function({
            bool dersId,
            bool downloadsRefs,
            bool progressRefs,
          })
        > {
  $$CachedEpisodesTableTableManager(
    _$AppDatabase db,
    $CachedEpisodesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedEpisodesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedEpisodesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedEpisodesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> dersId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> audioUrl = const Value.absent(),
                Value<int> startPage = const Value.absent(),
                Value<int> endPage = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isPublished = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedEpisodesCompanion(
                id: id,
                dersId: dersId,
                title: title,
                audioUrl: audioUrl,
                startPage: startPage,
                endPage: endPage,
                durationSeconds: durationSeconds,
                sortOrder: sortOrder,
                isPublished: isPublished,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int dersId,
                required String title,
                required String audioUrl,
                required int startPage,
                Value<int> endPage = const Value.absent(),
                Value<int> durationSeconds = const Value.absent(),
                Value<int> sortOrder = const Value.absent(),
                Value<bool> isPublished = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => CachedEpisodesCompanion.insert(
                id: id,
                dersId: dersId,
                title: title,
                audioUrl: audioUrl,
                startPage: startPage,
                endPage: endPage,
                durationSeconds: durationSeconds,
                sortOrder: sortOrder,
                isPublished: isPublished,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CachedEpisodesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({dersId = false, downloadsRefs = false, progressRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (downloadsRefs) db.downloads,
                    if (progressRefs) db.progress,
                  ],
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
                                    referencedTable:
                                        $$CachedEpisodesTableReferences
                                            ._dersIdTable(db),
                                    referencedColumn:
                                        $$CachedEpisodesTableReferences
                                            ._dersIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (downloadsRefs)
                        await $_getPrefetchedData<
                          CachedEpisode,
                          $CachedEpisodesTable,
                          Download
                        >(
                          currentTable: table,
                          referencedTable: $$CachedEpisodesTableReferences
                              ._downloadsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedEpisodesTableReferences(
                                db,
                                table,
                                p0,
                              ).downloadsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (progressRefs)
                        await $_getPrefetchedData<
                          CachedEpisode,
                          $CachedEpisodesTable,
                          PlaybackProgress
                        >(
                          currentTable: table,
                          referencedTable: $$CachedEpisodesTableReferences
                              ._progressRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$CachedEpisodesTableReferences(
                                db,
                                table,
                                p0,
                              ).progressRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.episodeId == item.id,
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

typedef $$CachedEpisodesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedEpisodesTable,
      CachedEpisode,
      $$CachedEpisodesTableFilterComposer,
      $$CachedEpisodesTableOrderingComposer,
      $$CachedEpisodesTableAnnotationComposer,
      $$CachedEpisodesTableCreateCompanionBuilder,
      $$CachedEpisodesTableUpdateCompanionBuilder,
      (CachedEpisode, $$CachedEpisodesTableReferences),
      CachedEpisode,
      PrefetchHooks Function({
        bool dersId,
        bool downloadsRefs,
        bool progressRefs,
      })
    >;
typedef $$DownloadsTableCreateCompanionBuilder =
    DownloadsCompanion Function({
      Value<int> id,
      required int episodeId,
      required String localPath,
      Value<int> fileSizeBytes,
      Value<String> status,
      Value<DateTime> downloadedAt,
    });
typedef $$DownloadsTableUpdateCompanionBuilder =
    DownloadsCompanion Function({
      Value<int> id,
      Value<int> episodeId,
      Value<String> localPath,
      Value<int> fileSizeBytes,
      Value<String> status,
      Value<DateTime> downloadedAt,
    });

final class $$DownloadsTableReferences
    extends BaseReferences<_$AppDatabase, $DownloadsTable, Download> {
  $$DownloadsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CachedEpisodesTable _episodeIdTable(_$AppDatabase db) =>
      db.cachedEpisodes.createAlias(
        $_aliasNameGenerator(db.downloads.episodeId, db.cachedEpisodes.id),
      );

  $$CachedEpisodesTableProcessedTableManager get episodeId {
    final $_column = $_itemColumn<int>('episode_id')!;

    final manager = $$CachedEpisodesTableTableManager(
      $_db,
      $_db.cachedEpisodes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodeIdTable($_db));
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

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedEpisodesTableFilterComposer get episodeId {
    final $$CachedEpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableFilterComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
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

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedEpisodesTableOrderingComposer get episodeId {
    final $$CachedEpisodesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableOrderingComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
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

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get downloadedAt => $composableBuilder(
    column: $table.downloadedAt,
    builder: (column) => column,
  );

  $$CachedEpisodesTableAnnotationComposer get episodeId {
    final $$CachedEpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
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
          PrefetchHooks Function({bool episodeId})
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
                Value<int> episodeId = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<int> fileSizeBytes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
              }) => DownloadsCompanion(
                id: id,
                episodeId: episodeId,
                localPath: localPath,
                fileSizeBytes: fileSizeBytes,
                status: status,
                downloadedAt: downloadedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int episodeId,
                required String localPath,
                Value<int> fileSizeBytes = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> downloadedAt = const Value.absent(),
              }) => DownloadsCompanion.insert(
                id: id,
                episodeId: episodeId,
                localPath: localPath,
                fileSizeBytes: fileSizeBytes,
                status: status,
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
          prefetchHooksCallback: ({episodeId = false}) {
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
                    if (episodeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodeId,
                                referencedTable: $$DownloadsTableReferences
                                    ._episodeIdTable(db),
                                referencedColumn: $$DownloadsTableReferences
                                    ._episodeIdTable(db)
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
      PrefetchHooks Function({bool episodeId})
    >;
typedef $$ProgressTableCreateCompanionBuilder =
    ProgressCompanion Function({
      Value<int> id,
      required int episodeId,
      Value<int> positionSeconds,
      Value<bool> isCompleted,
      Value<DateTime> updatedAt,
    });
typedef $$ProgressTableUpdateCompanionBuilder =
    ProgressCompanion Function({
      Value<int> id,
      Value<int> episodeId,
      Value<int> positionSeconds,
      Value<bool> isCompleted,
      Value<DateTime> updatedAt,
    });

final class $$ProgressTableReferences
    extends BaseReferences<_$AppDatabase, $ProgressTable, PlaybackProgress> {
  $$ProgressTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $CachedEpisodesTable _episodeIdTable(_$AppDatabase db) =>
      db.cachedEpisodes.createAlias(
        $_aliasNameGenerator(db.progress.episodeId, db.cachedEpisodes.id),
      );

  $$CachedEpisodesTableProcessedTableManager get episodeId {
    final $_column = $_itemColumn<int>('episode_id')!;

    final manager = $$CachedEpisodesTableTableManager(
      $_db,
      $_db.cachedEpisodes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_episodeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ProgressTableFilterComposer
    extends Composer<_$AppDatabase, $ProgressTable> {
  $$ProgressTableFilterComposer({
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

  ColumnFilters<int> get positionSeconds => $composableBuilder(
    column: $table.positionSeconds,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$CachedEpisodesTableFilterComposer get episodeId {
    final $$CachedEpisodesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableFilterComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressTableOrderingComposer
    extends Composer<_$AppDatabase, $ProgressTable> {
  $$ProgressTableOrderingComposer({
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

  ColumnOrderings<int> get positionSeconds => $composableBuilder(
    column: $table.positionSeconds,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$CachedEpisodesTableOrderingComposer get episodeId {
    final $$CachedEpisodesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableOrderingComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProgressTable> {
  $$ProgressTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get positionSeconds => $composableBuilder(
    column: $table.positionSeconds,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCompleted => $composableBuilder(
    column: $table.isCompleted,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$CachedEpisodesTableAnnotationComposer get episodeId {
    final $$CachedEpisodesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.episodeId,
      referencedTable: $db.cachedEpisodes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CachedEpisodesTableAnnotationComposer(
            $db: $db,
            $table: $db.cachedEpisodes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ProgressTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProgressTable,
          PlaybackProgress,
          $$ProgressTableFilterComposer,
          $$ProgressTableOrderingComposer,
          $$ProgressTableAnnotationComposer,
          $$ProgressTableCreateCompanionBuilder,
          $$ProgressTableUpdateCompanionBuilder,
          (PlaybackProgress, $$ProgressTableReferences),
          PlaybackProgress,
          PrefetchHooks Function({bool episodeId})
        > {
  $$ProgressTableTableManager(_$AppDatabase db, $ProgressTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProgressTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProgressTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProgressTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> episodeId = const Value.absent(),
                Value<int> positionSeconds = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ProgressCompanion(
                id: id,
                episodeId: episodeId,
                positionSeconds: positionSeconds,
                isCompleted: isCompleted,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int episodeId,
                Value<int> positionSeconds = const Value.absent(),
                Value<bool> isCompleted = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => ProgressCompanion.insert(
                id: id,
                episodeId: episodeId,
                positionSeconds: positionSeconds,
                isCompleted: isCompleted,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ProgressTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({episodeId = false}) {
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
                    if (episodeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.episodeId,
                                referencedTable: $$ProgressTableReferences
                                    ._episodeIdTable(db),
                                referencedColumn: $$ProgressTableReferences
                                    ._episodeIdTable(db)
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

typedef $$ProgressTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProgressTable,
      PlaybackProgress,
      $$ProgressTableFilterComposer,
      $$ProgressTableOrderingComposer,
      $$ProgressTableAnnotationComposer,
      $$ProgressTableCreateCompanionBuilder,
      $$ProgressTableUpdateCompanionBuilder,
      (PlaybackProgress, $$ProgressTableReferences),
      PlaybackProgress,
      PrefetchHooks Function({bool episodeId})
    >;
typedef $$FavoritesTableCreateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      required String entityType,
      required int entityId,
      Value<DateTime> addedAt,
    });
typedef $$FavoritesTableUpdateCompanionBuilder =
    FavoritesCompanion Function({
      Value<int> id,
      Value<String> entityType,
      Value<int> entityId,
      Value<DateTime> addedAt,
    });

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

  ColumnFilters<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnFilters(column),
  );
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

  ColumnOrderings<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get entityId => $composableBuilder(
    column: $table.entityId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get addedAt => $composableBuilder(
    column: $table.addedAt,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<String> get entityType => $composableBuilder(
    column: $table.entityType,
    builder: (column) => column,
  );

  GeneratedColumn<int> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<DateTime> get addedAt =>
      $composableBuilder(column: $table.addedAt, builder: (column) => column);
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
          (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
          Favorite,
          PrefetchHooks Function()
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
                Value<String> entityType = const Value.absent(),
                Value<int> entityId = const Value.absent(),
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoritesCompanion(
                id: id,
                entityType: entityType,
                entityId: entityId,
                addedAt: addedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String entityType,
                required int entityId,
                Value<DateTime> addedAt = const Value.absent(),
              }) => FavoritesCompanion.insert(
                id: id,
                entityType: entityType,
                entityId: entityId,
                addedAt: addedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
      (Favorite, BaseReferences<_$AppDatabase, $FavoritesTable, Favorite>),
      Favorite,
      PrefetchHooks Function()
    >;
typedef $$SettingsTableCreateCompanionBuilder =
    SettingsCompanion Function({
      required String key,
      required String value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$SettingsTableUpdateCompanionBuilder =
    SettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$SettingsTableFilterComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $SettingsTable> {
  $$SettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$SettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $SettingsTable,
          AppSetting,
          $$SettingsTableFilterComposer,
          $$SettingsTableOrderingComposer,
          $$SettingsTableAnnotationComposer,
          $$SettingsTableCreateCompanionBuilder,
          $$SettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $SettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$SettingsTableTableManager(_$AppDatabase db, $SettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => SettingsCompanion.insert(
                key: key,
                value: value,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $SettingsTable,
      AppSetting,
      $$SettingsTableFilterComposer,
      $$SettingsTableOrderingComposer,
      $$SettingsTableAnnotationComposer,
      $$SettingsTableCreateCompanionBuilder,
      $$SettingsTableUpdateCompanionBuilder,
      (AppSetting, BaseReferences<_$AppDatabase, $SettingsTable, AppSetting>),
      AppSetting,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedUstazesTableTableManager get cachedUstazes =>
      $$CachedUstazesTableTableManager(_db, _db.cachedUstazes);
  $$CachedTopicsTableTableManager get cachedTopics =>
      $$CachedTopicsTableTableManager(_db, _db.cachedTopics);
  $$CachedDersesTableTableManager get cachedDerses =>
      $$CachedDersesTableTableManager(_db, _db.cachedDerses);
  $$CachedEpisodesTableTableManager get cachedEpisodes =>
      $$CachedEpisodesTableTableManager(_db, _db.cachedEpisodes);
  $$DownloadsTableTableManager get downloads =>
      $$DownloadsTableTableManager(_db, _db.downloads);
  $$ProgressTableTableManager get progress =>
      $$ProgressTableTableManager(_db, _db.progress);
  $$FavoritesTableTableManager get favorites =>
      $$FavoritesTableTableManager(_db, _db.favorites);
  $$SettingsTableTableManager get settings =>
      $$SettingsTableTableManager(_db, _db.settings);
}

class ModelAgent {
  final int? status;
  final List<Data>? data;

  ModelAgent({
    this.status,
    this.data,
  });

  ModelAgent.fromJson(Map<String, dynamic> json)
      : status = json['status'] as int?,
        data = (json['data'] as List?)
            ?.map((dynamic e) => Data.fromJson(e as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toJson() =>
      {'status': status, 'data': data?.map((e) => e.toJson()).toList()};
}

class Data {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? developerName;
  final dynamic characterTags;
  final String? displayIcon;
  final String? displayIconSmall;
  final String? bustPortrait;
  final String? fullPortrait;
  final String? fullPortraitV2;
  final String? killfeedPortrait;
  final String? background;
  final List<String>? backgroundGradientColors;
  final String? assetPath;
  final bool? isFullPortraitRightFacing;
  final bool? isPlayableCharacter;
  final bool? isAvailableForTest;
  final bool? isBaseContent;
  final Role? role;
  final dynamic recruitmentData;
  final List<Abilities>? abilities;
  final dynamic voiceLine;

  Data({
    this.uuid,
    this.displayName,
    this.description,
    this.developerName,
    this.characterTags,
    this.displayIcon,
    this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    this.killfeedPortrait,
    this.background,
    this.backgroundGradientColors,
    this.assetPath,
    this.isFullPortraitRightFacing,
    this.isPlayableCharacter,
    this.isAvailableForTest,
    this.isBaseContent,
    this.role,
    this.recruitmentData,
    this.abilities,
    this.voiceLine,
  });

  Data.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String?,
        displayName = json['displayName'] as String?,
        description = json['description'] as String?,
        developerName = json['developerName'] as String?,
        characterTags = json['characterTags'],
        displayIcon = json['displayIcon'] as String?,
        displayIconSmall = json['displayIconSmall'] as String?,
        bustPortrait = json['bustPortrait'] as String?,
        fullPortrait = json['fullPortrait'] as String?,
        fullPortraitV2 = json['fullPortraitV2'] as String?,
        killfeedPortrait = json['killfeedPortrait'] as String?,
        background = json['background'] as String?,
        backgroundGradientColors = (json['backgroundGradientColors'] as List?)
            ?.map((dynamic e) => e as String)
            .toList(),
        assetPath = json['assetPath'] as String?,
        isFullPortraitRightFacing = json['isFullPortraitRightFacing'] as bool?,
        isPlayableCharacter = json['isPlayableCharacter'] as bool?,
        isAvailableForTest = json['isAvailableForTest'] as bool?,
        isBaseContent = json['isBaseContent'] as bool?,
        role = (json['role'] as Map<String, dynamic>?) != null
            ? Role.fromJson(json['role'] as Map<String, dynamic>)
            : null,
        recruitmentData = json['recruitmentData'],
        abilities = (json['abilities'] as List?)
            ?.map((dynamic e) => Abilities.fromJson(e as Map<String, dynamic>))
            .toList(),
        voiceLine = json['voiceLine'];

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'description': description,
        'developerName': developerName,
        'characterTags': characterTags,
        'displayIcon': displayIcon,
        'displayIconSmall': displayIconSmall,
        'bustPortrait': bustPortrait,
        'fullPortrait': fullPortrait,
        'fullPortraitV2': fullPortraitV2,
        'killfeedPortrait': killfeedPortrait,
        'background': background,
        'backgroundGradientColors': backgroundGradientColors,
        'assetPath': assetPath,
        'isFullPortraitRightFacing': isFullPortraitRightFacing,
        'isPlayableCharacter': isPlayableCharacter,
        'isAvailableForTest': isAvailableForTest,
        'isBaseContent': isBaseContent,
        'role': role?.toJson(),
        'recruitmentData': recruitmentData,
        'abilities': abilities?.map((e) => e.toJson()).toList(),
        'voiceLine': voiceLine
      };
}

class Role {
  final String? uuid;
  final String? displayName;
  final String? description;
  final String? displayIcon;
  final String? assetPath;

  Role({
    this.uuid,
    this.displayName,
    this.description,
    this.displayIcon,
    this.assetPath,
  });

  Role.fromJson(Map<String, dynamic> json)
      : uuid = json['uuid'] as String?,
        displayName = json['displayName'] as String?,
        description = json['description'] as String?,
        displayIcon = json['displayIcon'] as String?,
        assetPath = json['assetPath'] as String?;

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'displayName': displayName,
        'description': description,
        'displayIcon': displayIcon,
        'assetPath': assetPath
      };
}

class Abilities {
  final String? slot;
  final String? displayName;
  final String? description;
  final String? displayIcon;

  Abilities({
    this.slot,
    this.displayName,
    this.description,
    this.displayIcon,
  });

  Abilities.fromJson(Map<String, dynamic> json)
      : slot = json['slot'] as String?,
        displayName = json['displayName'] as String?,
        description = json['description'] as String?,
        displayIcon = json['displayIcon'] as String?;

  Map<String, dynamic> toJson() => {
        'slot': slot,
        'displayName': displayName,
        'description': description,
        'displayIcon': displayIcon
      };
}

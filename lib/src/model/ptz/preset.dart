import 'dart:convert';

import 'package:easy_onvif/src/util/util.dart';
import 'package:json_annotation/json_annotation.dart';

import 'ptz_position.dart';

part 'preset.g.dart';

@JsonSerializable()
class Preset {
  @JsonKey(name: '@token')
  final String token;

  @JsonKey(name: 'Name', fromJson: OnvifUtil.mappedToString)
  final String name;

  @JsonKey(name: 'PTZPosition')
  final PtzPosition position;

  Preset({required this.token, required this.name, required this.position});

  factory Preset.fromJson(Map<String, dynamic> json) => _$PresetFromJson(json);

  factory Preset.fromToken(String token) =>
      Preset(token: token, name: '', position: PtzPosition());

  Map<String, dynamic> toJson() => _$PresetToJson(this);

  @override
  String toString() => jsonEncode(toJson());
}

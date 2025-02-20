import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'analytics_capabilities.dart';
import 'device_capabilities.dart';
import 'event_capabilities.dart';
import 'imaging_capabilities.dart';
import 'media_capabilities.dart';
import 'ptz_capabilities.dart';

part 'capabilities.g.dart';

/// Capability information.
@JsonSerializable()
class Capabilities {
  /// Analytics capabilities
  @JsonKey(name: 'Analytics')
  final AnalyticsCapabilities? analytics;

  /// Device capabilities
  @JsonKey(name: 'Device')
  final DeviceCapabilities? device;

  /// Event capabilities
  @JsonKey(name: 'Events')
  final EventCapabilities? events;

  /// Imaging capabilities
  @JsonKey(name: 'Imaging')
  final ImagingCapabilities? imaging;

  /// Media capabilities
  @JsonKey(name: 'Media')
  final MediaCapabilities? media;

  /// PTZ capabilities
  @JsonKey(name: 'PTZ')
  final PtzCapabilities? ptz;

  @JsonKey(name: 'Extension')
  Map<String, dynamic>? extension;

  Capabilities(
      {this.analytics,
      this.device,
      this.events,
      this.imaging,
      this.media,
      this.ptz,
      this.extension});

  factory Capabilities.fromJson(Map<String, dynamic> json) =>
      _$CapabilitiesFromJson(json);

  Map<String, dynamic> toJson() => _$CapabilitiesToJson(this);

  @override
  String toString() => json.encode(toJson());
}

@JsonEnum()
enum CapabilityCategory {
  all('All'),
  analytics('Analytics'),
  device('Device'),
  events('Events'),
  imaging('Imaging'),
  media('Media'),
  ptz('PTZ');

  const CapabilityCategory(this.value);
  final String value;
}

// Copyright (c) 2023, Google Inc. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';

/// Alternative serializer for [Duration].
///
/// Install this to use ISO8601 compatible format instead of the default
/// (microseconds). Use [SerializersBuilder.add] to install it.
///
/// Note that this serializer is not 100% compatible with the ISO8601 format
/// due to limitations of the [Duration] class, but is designed to produce and
/// consume reasonable strings that match the standard.
class Iso8601MicrosecondDurationSerializer
    extends PrimitiveSerializer<Duration> {
  @override
  Duration deserialize(Serializers serializers, Object? serialized,
      {FullType specifiedType = FullType.unspecified}) =>
      _parseDuration(serialized as String);

  @override
  Object serialize(Serializers serializers, Duration object,
      {FullType specifiedType = FullType.unspecified}) =>
      _writeIso8601Duration(object);

  @override
  Iterable<Type> get types => BuiltList(const [Duration]);

  @override
  String get wireName => 'Duration';

  Duration _parseDuration(String value) {
    final match = _parseFormat.firstMatch(value);
    if (match == null) {
      throw FormatException('Invalid duration format', value);
    }
    // Iterate through the capture groups to build the unit mappings.
    final unitMappings = <String, double>{};

    // Start iterating at 1, because match[0] is the full match.
    for (var i = 1; i <= match.groupCount; i++) {
      final group = match[i];
      if (group == null) continue;

      double value = double.parse(group.substring(0, group.length - 1));

      // Get last character.
      final unit = group.substring(group.length - 1);

      unitMappings[unit] = value;
    }

    double seconds = unitMappings[_secondToken] ?? 0;
    int milliseconds = (seconds * 1000).floor() % 1000;
    int microseconds = (seconds * 1000000).floor() % 1000;

    return Duration(
      days: unitMappings[_dayToken]?.toInt() ?? 0,
      hours: unitMappings[_hourToken]?.toInt() ?? 0,
      minutes: unitMappings[_minuteToken]?.toInt() ?? 0,
      seconds: seconds.toInt(),
      milliseconds: milliseconds,
      microseconds: microseconds,
    );
  }

  String _writeIso8601Duration(Duration duration) {
    if (duration == Duration.zero) {
      return 'PT0S';
    }
    final days = duration.inDays;
    final hours = (duration - Duration(days: days)).inHours;
    final minutes = (duration - Duration(days: days, hours: hours)).inMinutes;
    final seconds =
        (duration - Duration(days: days, hours: hours, minutes: minutes))
            .inSeconds;
    final milliseconds = (duration -
        Duration(
            days: days, hours: hours, minutes: minutes, seconds: seconds))
        .inMilliseconds;
    final microseconds = (duration -
        Duration(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
        ))
        .inMicroseconds;
    final remainder = duration -
        Duration(
          days: days,
          hours: hours,
          minutes: minutes,
          seconds: seconds,
          milliseconds: milliseconds,
          microseconds: microseconds,
        );

    if (remainder != Duration.zero) {
      throw ArgumentError.value(duration, 'duration',
          'Contains sub-microsecond data which cannot be serialized.');
    }
    final buffer = StringBuffer(_durationToken)
      ..write(days == 0 ? '' : '$days$_dayToken');
    if (!(hours == 0 && minutes == 0 && seconds == 0)) {
      buffer
        ..write(_timeToken)
        ..write(hours == 0 ? '' : '$hours$_hourToken')
        ..write(minutes == 0 ? '' : '$minutes$_minuteToken')
        ..write(seconds == 0
            ? ''
            : '$seconds${milliseconds == 0 && microseconds == 0 ? _secondToken : ''}')
        ..write(
          milliseconds == 0 && microseconds == 0
              ? ''
              : microseconds == 0
              ? '.$milliseconds$_secondToken'
              : milliseconds == 0
              ? '.000$microseconds$_secondToken'
              : '.$milliseconds$microseconds$_secondToken',
        );
    }
    return buffer.toString();
  }

  // The unit tokens.
  static const _durationToken = 'P';
  static const _dayToken = 'D';
  static const _timeToken = 'T';
  static const _hourToken = 'H';
  static const _minuteToken = 'M';
  static const _secondToken = 'S';

  // The parse format for ISO8601 durations.
  static final _parseFormat = RegExp(
    r'^P(\d+D)?(?:T(\d+H)?(\d+M)?(\d+(?:\.?\d+)?S)?)?$',
  );
}
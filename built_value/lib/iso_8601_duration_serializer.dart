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
class Iso8601DurationSerializer extends PrimitiveSerializer<Duration> {
  @override
  Duration deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final String value = serialized;
    return _parseDuration(value);
  }

  @override
  Object serialize(Serializers serializers, Duration object,
      {FullType specifiedType = FullType.unspecified}) {
    return _writeIso8601Duration(object);
  }

  @override
  Iterable<Type> get types => BuiltList(const [Duration]);

  @override
  String get wireName => 'Duration';

  Duration _parseDuration(String value) {
    final match = _parseFormat.firstMatch(value);
    if (match != null) {
      // Iterate through the capture groups to build the unit mappings
      final unitMappings = <String, int>{};

      // Start iterating at 1, because match[0] is the full match
      for (var i = 1; i <= match.groupCount; i++) {
        final group = match[i];
        if (group == null) {
          continue;
        }
        // Get all but last character in group
        // RegExp ensures this must be an int
        final value = int.parse(group.substring(0, group.length - 1));
        // Get last character
        final unit = group.substring(group.length - 1);
        unitMappings[unit] = value;
      }
      return Duration(
        days: unitMappings[_dayToken] ?? 0,
        hours: unitMappings[_hourToken] ?? 0,
        minutes: unitMappings[_minuteToken] ?? 0,
        seconds: unitMappings[_secondToken] ?? 0,
      );
    } else {
      throw FormatException("Invalid duration format", value);
    }
  }

  String _writeIso8601Duration(Duration duration) {
    if (duration == Duration.zero) {
      // format for zero.
      return 'PT0S';
    }
    final days = duration.inDays;
    final hours = (duration - Duration(days: days)).inHours;
    final minutes = (duration - Duration(days: days, hours: hours)).inMinutes;
    final seconds =
        (duration - Duration(days: days, hours: hours, minutes: minutes))
            .inSeconds;
    final buffer = StringBuffer(_durationToken)
      ..write(days == 0 ? '' : '$days$_dayToken');
    if (!(hours == 0 && minutes == 0 && seconds == 0)) {
      buffer
        ..write(_timeToken)
        ..write(hours == 0 ? '' : '$hours$_hourToken')
        ..write(minutes == 0 ? '' : '$minutes$_minuteToken')
        ..write(seconds == 0 ? '' : '$seconds$_secondToken');
    }
    return buffer.toString();
  }

  // Unit tokens
  static const _durationToken = 'P';
  static const _dayToken = 'D';
  static const _timeToken = 'T';
  static const _hourToken = 'H';
  static const _minuteToken = 'M';
  static const _secondToken = 'S';

  // Parse format for ISO8601
  static final _parseFormat = RegExp(
      '^P(?!\$)(0D|[1-9][0-9]*D)?(?:T(?!\$)(0H|[1-9][0-9]*H)?(0M|[1-9][0-9]*M)?(0S|[1-9][0-9]*S)?)?\$');
}

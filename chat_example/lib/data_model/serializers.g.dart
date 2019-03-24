// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Chat.serializer)
      ..add(ListUsers.serializer)
      ..add(ListUsersResponse.serializer)
      ..add(Login.serializer)
      ..add(LoginResponse.serializer)
      ..add(ShowChat.serializer)
      ..add(Status.serializer)
      ..add(StatusType.serializer)
      ..add(Welcome.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Response)]),
          () => new ListBuilder<Response>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Status)]),
          () => new MapBuilder<String, Status>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(StatusType)]),
          () => new SetBuilder<StatusType>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>()))
    .build();

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new

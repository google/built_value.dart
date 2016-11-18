// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library serializers
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add(Chat.serializer)
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => new SetBuilder<String>())
      ..add(Login.serializer)
      ..add(Status.serializer)
      ..add(StatusType.serializer)
      ..add(ListUsers.serializer)
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(StatusType)]),
          () => new SetBuilder<StatusType>())
      ..add(LoginResponse.serializer)
      ..add(ShowChat.serializer)
      ..add(Welcome.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Response)]),
          () => new ListBuilder<Response>())
      ..add(ListUsersResponse.serializer)
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Status)]),
          () => new MapBuilder<String, Status>()))
    .build();

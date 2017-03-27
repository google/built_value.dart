// GENERATED CODE - DO NOT MODIFY BY HAND

part of serializers;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library serializers
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

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (Serializers().toBuilder()
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
          () => ListBuilder<Response>())
      ..addBuilderFactory(
          const FullType(
              BuiltMap, const [const FullType(String), const FullType(Status)]),
          () => MapBuilder<String, Status>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(StatusType)]),
          () => SetBuilder<StatusType>())
      ..addBuilderFactory(
          const FullType(BuiltSet, const [const FullType(String)]),
          () => SetBuilder<String>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

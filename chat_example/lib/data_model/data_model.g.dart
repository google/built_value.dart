// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const StatusType _$online = const StatusType._('online');
const StatusType _$away = const StatusType._('away');
const StatusType _$offline = const StatusType._('offline');

StatusType _$stValueOf(String name) {
  switch (name) {
    case 'online':
      return _$online;
    case 'away':
      return _$away;
    case 'offline':
      return _$offline;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<StatusType> _$stValues =
    new BuiltSet<StatusType>(const <StatusType>[
  _$online,
  _$away,
  _$offline,
]);

const LoginResponse _$success = const LoginResponse._('success');
const LoginResponse _$badPassword = const LoginResponse._('badPassword');
const LoginResponse _$reset = const LoginResponse._('reset');

LoginResponse _$lrValueOf(String name) {
  switch (name) {
    case 'success':
      return _$success;
    case 'badPassword':
      return _$badPassword;
    case 'reset':
      return _$reset;
    default:
      throw new ArgumentError(name);
  }
}

final BuiltSet<LoginResponse> _$lrValues =
    new BuiltSet<LoginResponse>(const <LoginResponse>[
  _$success,
  _$badPassword,
  _$reset,
]);

Serializer<Chat> _$chatSerializer = new _$ChatSerializer();
Serializer<Login> _$loginSerializer = new _$LoginSerializer();
Serializer<Status> _$statusSerializer = new _$StatusSerializer();
Serializer<StatusType> _$statusTypeSerializer = new _$StatusTypeSerializer();
Serializer<ListUsers> _$listUsersSerializer = new _$ListUsersSerializer();
Serializer<LoginResponse> _$loginResponseSerializer =
    new _$LoginResponseSerializer();
Serializer<ShowChat> _$showChatSerializer = new _$ShowChatSerializer();
Serializer<Welcome> _$welcomeSerializer = new _$WelcomeSerializer();
Serializer<ListUsersResponse> _$listUsersResponseSerializer =
    new _$ListUsersResponseSerializer();

class _$ChatSerializer implements StructuredSerializer<Chat> {
  @override
  final Iterable<Type> types = const [Chat, _$Chat];
  @override
  final String wireName = 'Chat';

  @override
  Iterable<Object?> serialize(Serializers serializers, Chat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
      'targets',
      serializers.serialize(object.targets,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(String)])),
    ];

    return result;
  }

  @override
  Chat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'targets':
          result.targets.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltSet, const [const FullType(String)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginSerializer implements StructuredSerializer<Login> {
  @override
  final Iterable<Type> types = const [Login, _$Login];
  @override
  final String wireName = 'Login';

  @override
  Iterable<Object?> serialize(Serializers serializers, Login object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'password',
      serializers.serialize(object.password,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Login deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LoginBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'password':
          result.password = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$StatusSerializer implements StructuredSerializer<Status> {
  @override
  final Iterable<Type> types = const [Status, _$Status];
  @override
  final String wireName = 'Status';

  @override
  Iterable<Object?> serialize(Serializers serializers, Status object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
      'type',
      serializers.serialize(object.type,
          specifiedType: const FullType(StatusType)),
    ];

    return result;
  }

  @override
  Status deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new StatusBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(StatusType))! as StatusType;
          break;
      }
    }

    return result.build();
  }
}

class _$StatusTypeSerializer implements PrimitiveSerializer<StatusType> {
  @override
  final Iterable<Type> types = const <Type>[StatusType];
  @override
  final String wireName = 'StatusType';

  @override
  Object serialize(Serializers serializers, StatusType object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  StatusType deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      StatusType.valueOf(serialized as String);
}

class _$ListUsersSerializer implements StructuredSerializer<ListUsers> {
  @override
  final Iterable<Type> types = const [ListUsers, _$ListUsers];
  @override
  final String wireName = 'ListUsers';

  @override
  Iterable<Object?> serialize(Serializers serializers, ListUsers object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'statusTypes',
      serializers.serialize(object.statusTypes,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(StatusType)])),
    ];

    return result;
  }

  @override
  ListUsers deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListUsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'statusTypes':
          result.statusTypes.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltSet, const [const FullType(StatusType)]))!
              as BuiltSet<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$LoginResponseSerializer implements PrimitiveSerializer<LoginResponse> {
  @override
  final Iterable<Type> types = const <Type>[LoginResponse];
  @override
  final String wireName = 'LoginResponse';

  @override
  Object serialize(Serializers serializers, LoginResponse object,
          {FullType specifiedType = FullType.unspecified}) =>
      object.name;

  @override
  LoginResponse deserialize(Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      LoginResponse.valueOf(serialized as String);
}

class _$ShowChatSerializer implements StructuredSerializer<ShowChat> {
  @override
  final Iterable<Type> types = const [ShowChat, _$ShowChat];
  @override
  final String wireName = 'ShowChat';

  @override
  Iterable<Object?> serialize(Serializers serializers, ShowChat object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'username',
      serializers.serialize(object.username,
          specifiedType: const FullType(String)),
      'private',
      serializers.serialize(object.private,
          specifiedType: const FullType(bool)),
      'text',
      serializers.serialize(object.text, specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  ShowChat deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ShowChatBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
        case 'private':
          result.private = serializers.deserialize(value,
              specifiedType: const FullType(bool))! as bool;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$WelcomeSerializer implements StructuredSerializer<Welcome> {
  @override
  final Iterable<Type> types = const [Welcome, _$Welcome];
  @override
  final String wireName = 'Welcome';

  @override
  Iterable<Object?> serialize(Serializers serializers, Welcome object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'log',
      serializers.serialize(object.log,
          specifiedType:
              const FullType(BuiltList, const [const FullType(Response)])),
      'message',
      serializers.serialize(object.message,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  Welcome deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new WelcomeBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'log':
          result.log.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(Response)]))!
              as BuiltList<Object?>);
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ListUsersResponseSerializer
    implements StructuredSerializer<ListUsersResponse> {
  @override
  final Iterable<Type> types = const [ListUsersResponse, _$ListUsersResponse];
  @override
  final String wireName = 'ListUsersResponse';

  @override
  Iterable<Object?> serialize(Serializers serializers, ListUsersResponse object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'statuses',
      serializers.serialize(object.statuses,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(Status)])),
    ];

    return result;
  }

  @override
  ListUsersResponse deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ListUsersResponseBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'statuses':
          result.statuses.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltMap,
                  const [const FullType(String), const FullType(Status)]))!);
          break;
      }
    }

    return result.build();
  }
}

class _$Chat extends Chat {
  @override
  final String text;
  @override
  final BuiltSet<String> targets;

  factory _$Chat([void Function(ChatBuilder)? updates]) =>
      (new ChatBuilder()..update(updates))._build();

  _$Chat._({required this.text, required this.targets}) : super._() {
    BuiltValueNullFieldError.checkNotNull(text, r'Chat', 'text');
    BuiltValueNullFieldError.checkNotNull(targets, r'Chat', 'targets');
  }

  @override
  Chat rebuild(void Function(ChatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatBuilder toBuilder() => new ChatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Chat && text == other.text && targets == other.targets;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jc(_$hash, targets.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Chat')
          ..add('text', text)
          ..add('targets', targets))
        .toString();
  }
}

class ChatBuilder implements Builder<Chat, ChatBuilder> {
  _$Chat? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  SetBuilder<String>? _targets;
  SetBuilder<String> get targets =>
      _$this._targets ??= new SetBuilder<String>();
  set targets(SetBuilder<String>? targets) => _$this._targets = targets;

  ChatBuilder();

  ChatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _targets = $v.targets.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Chat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Chat;
  }

  @override
  void update(void Function(ChatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Chat build() => _build();

  _$Chat _build() {
    _$Chat _$result;
    try {
      _$result = _$v ??
          new _$Chat._(
              text:
                  BuiltValueNullFieldError.checkNotNull(text, r'Chat', 'text'),
              targets: targets.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'targets';
        targets.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Chat', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Login extends Login {
  @override
  final String username;
  @override
  final String password;

  factory _$Login([void Function(LoginBuilder)? updates]) =>
      (new LoginBuilder()..update(updates))._build();

  _$Login._({required this.username, required this.password}) : super._() {
    BuiltValueNullFieldError.checkNotNull(username, r'Login', 'username');
    BuiltValueNullFieldError.checkNotNull(password, r'Login', 'password');
  }

  @override
  Login rebuild(void Function(LoginBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginBuilder toBuilder() => new LoginBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Login &&
        username == other.username &&
        password == other.password;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, password.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Login')
          ..add('username', username)
          ..add('password', password))
        .toString();
  }
}

class LoginBuilder implements Builder<Login, LoginBuilder> {
  _$Login? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _password;
  String? get password => _$this._password;
  set password(String? password) => _$this._password = password;

  LoginBuilder();

  LoginBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _password = $v.password;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Login other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Login;
  }

  @override
  void update(void Function(LoginBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Login build() => _build();

  _$Login _build() {
    final _$result = _$v ??
        new _$Login._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'Login', 'username'),
            password: BuiltValueNullFieldError.checkNotNull(
                password, r'Login', 'password'));
    replace(_$result);
    return _$result;
  }
}

class _$Status extends Status {
  @override
  final String message;
  @override
  final StatusType type;

  factory _$Status([void Function(StatusBuilder)? updates]) =>
      (new StatusBuilder()..update(updates))._build();

  _$Status._({required this.message, required this.type}) : super._() {
    BuiltValueNullFieldError.checkNotNull(message, r'Status', 'message');
    BuiltValueNullFieldError.checkNotNull(type, r'Status', 'type');
  }

  @override
  Status rebuild(void Function(StatusBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  StatusBuilder toBuilder() => new StatusBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Status && message == other.message && type == other.type;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jc(_$hash, type.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Status')
          ..add('message', message)
          ..add('type', type))
        .toString();
  }
}

class StatusBuilder implements Builder<Status, StatusBuilder> {
  _$Status? _$v;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  StatusType? _type;
  StatusType? get type => _$this._type;
  set type(StatusType? type) => _$this._type = type;

  StatusBuilder();

  StatusBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _message = $v.message;
      _type = $v.type;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Status other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Status;
  }

  @override
  void update(void Function(StatusBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Status build() => _build();

  _$Status _build() {
    final _$result = _$v ??
        new _$Status._(
            message: BuiltValueNullFieldError.checkNotNull(
                message, r'Status', 'message'),
            type:
                BuiltValueNullFieldError.checkNotNull(type, r'Status', 'type'));
    replace(_$result);
    return _$result;
  }
}

class _$ListUsers extends ListUsers {
  @override
  final BuiltSet<StatusType> statusTypes;

  factory _$ListUsers([void Function(ListUsersBuilder)? updates]) =>
      (new ListUsersBuilder()..update(updates))._build();

  _$ListUsers._({required this.statusTypes}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        statusTypes, r'ListUsers', 'statusTypes');
  }

  @override
  ListUsers rebuild(void Function(ListUsersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListUsersBuilder toBuilder() => new ListUsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListUsers && statusTypes == other.statusTypes;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statusTypes.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListUsers')
          ..add('statusTypes', statusTypes))
        .toString();
  }
}

class ListUsersBuilder implements Builder<ListUsers, ListUsersBuilder> {
  _$ListUsers? _$v;

  SetBuilder<StatusType>? _statusTypes;
  SetBuilder<StatusType> get statusTypes =>
      _$this._statusTypes ??= new SetBuilder<StatusType>();
  set statusTypes(SetBuilder<StatusType>? statusTypes) =>
      _$this._statusTypes = statusTypes;

  ListUsersBuilder();

  ListUsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statusTypes = $v.statusTypes.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListUsers other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListUsers;
  }

  @override
  void update(void Function(ListUsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListUsers build() => _build();

  _$ListUsers _build() {
    _$ListUsers _$result;
    try {
      _$result = _$v ?? new _$ListUsers._(statusTypes: statusTypes.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'statusTypes';
        statusTypes.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListUsers', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ShowChat extends ShowChat {
  @override
  final String username;
  @override
  final bool private;
  @override
  final String text;

  factory _$ShowChat([void Function(ShowChatBuilder)? updates]) =>
      (new ShowChatBuilder()..update(updates))._build();

  _$ShowChat._(
      {required this.username, required this.private, required this.text})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(username, r'ShowChat', 'username');
    BuiltValueNullFieldError.checkNotNull(private, r'ShowChat', 'private');
    BuiltValueNullFieldError.checkNotNull(text, r'ShowChat', 'text');
  }

  @override
  ShowChat rebuild(void Function(ShowChatBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ShowChatBuilder toBuilder() => new ShowChatBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ShowChat &&
        username == other.username &&
        private == other.private &&
        text == other.text;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, private.hashCode);
    _$hash = $jc(_$hash, text.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ShowChat')
          ..add('username', username)
          ..add('private', private)
          ..add('text', text))
        .toString();
  }
}

class ShowChatBuilder implements Builder<ShowChat, ShowChatBuilder> {
  _$ShowChat? _$v;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  bool? _private;
  bool? get private => _$this._private;
  set private(bool? private) => _$this._private = private;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  ShowChatBuilder();

  ShowChatBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _username = $v.username;
      _private = $v.private;
      _text = $v.text;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ShowChat other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ShowChat;
  }

  @override
  void update(void Function(ShowChatBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ShowChat build() => _build();

  _$ShowChat _build() {
    final _$result = _$v ??
        new _$ShowChat._(
            username: BuiltValueNullFieldError.checkNotNull(
                username, r'ShowChat', 'username'),
            private: BuiltValueNullFieldError.checkNotNull(
                private, r'ShowChat', 'private'),
            text: BuiltValueNullFieldError.checkNotNull(
                text, r'ShowChat', 'text'));
    replace(_$result);
    return _$result;
  }
}

class _$Welcome extends Welcome {
  @override
  final BuiltList<Response> log;
  @override
  final String message;

  factory _$Welcome([void Function(WelcomeBuilder)? updates]) =>
      (new WelcomeBuilder()..update(updates))._build();

  _$Welcome._({required this.log, required this.message}) : super._() {
    BuiltValueNullFieldError.checkNotNull(log, r'Welcome', 'log');
    BuiltValueNullFieldError.checkNotNull(message, r'Welcome', 'message');
  }

  @override
  Welcome rebuild(void Function(WelcomeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  WelcomeBuilder toBuilder() => new WelcomeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Welcome && log == other.log && message == other.message;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, log.hashCode);
    _$hash = $jc(_$hash, message.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Welcome')
          ..add('log', log)
          ..add('message', message))
        .toString();
  }
}

class WelcomeBuilder implements Builder<Welcome, WelcomeBuilder> {
  _$Welcome? _$v;

  ListBuilder<Response>? _log;
  ListBuilder<Response> get log => _$this._log ??= new ListBuilder<Response>();
  set log(ListBuilder<Response>? log) => _$this._log = log;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  WelcomeBuilder();

  WelcomeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _log = $v.log.toBuilder();
      _message = $v.message;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Welcome other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Welcome;
  }

  @override
  void update(void Function(WelcomeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Welcome build() => _build();

  _$Welcome _build() {
    _$Welcome _$result;
    try {
      _$result = _$v ??
          new _$Welcome._(
              log: log.build(),
              message: BuiltValueNullFieldError.checkNotNull(
                  message, r'Welcome', 'message'));
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'log';
        log.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Welcome', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ListUsersResponse extends ListUsersResponse {
  @override
  final BuiltMap<String, Status> statuses;

  factory _$ListUsersResponse(
          [void Function(ListUsersResponseBuilder)? updates]) =>
      (new ListUsersResponseBuilder()..update(updates))._build();

  _$ListUsersResponse._({required this.statuses}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        statuses, r'ListUsersResponse', 'statuses');
  }

  @override
  ListUsersResponse rebuild(void Function(ListUsersResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ListUsersResponseBuilder toBuilder() =>
      new ListUsersResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ListUsersResponse && statuses == other.statuses;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, statuses.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ListUsersResponse')
          ..add('statuses', statuses))
        .toString();
  }
}

class ListUsersResponseBuilder
    implements Builder<ListUsersResponse, ListUsersResponseBuilder> {
  _$ListUsersResponse? _$v;

  MapBuilder<String, Status>? _statuses;
  MapBuilder<String, Status> get statuses =>
      _$this._statuses ??= new MapBuilder<String, Status>();
  set statuses(MapBuilder<String, Status>? statuses) =>
      _$this._statuses = statuses;

  ListUsersResponseBuilder();

  ListUsersResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _statuses = $v.statuses.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ListUsersResponse other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ListUsersResponse;
  }

  @override
  void update(void Function(ListUsersResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ListUsersResponse build() => _build();

  _$ListUsersResponse _build() {
    _$ListUsersResponse _$result;
    try {
      _$result = _$v ?? new _$ListUsersResponse._(statuses: statuses.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'statuses';
        statuses.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ListUsersResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint

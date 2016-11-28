// GENERATED CODE - DO NOT MODIFY BY HAND

part of data_model;

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: library data_model
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

final BuiltSet<StatusType> _$stValues = new BuiltSet<StatusType>(const [
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

final BuiltSet<LoginResponse> _$lrValues = new BuiltSet<LoginResponse>(const [
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
  final Iterable<Type> types = const [Chat, _$Chat];
  final String wireName = 'Chat';

  @override
  Iterable serialize(Serializers serializers, Chat object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
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
  Chat deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ChatBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'text':
            result.text = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
          case 'targets':
            result.targets.replace(serializers.deserialize(value,
                specifiedType:
                    const FullType(BuiltSet, const [const FullType(String)])));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$LoginSerializer implements StructuredSerializer<Login> {
  final Iterable<Type> types = const [Login, _$Login];
  final String wireName = 'Login';

  @override
  Iterable serialize(Serializers serializers, Login object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
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
  Login deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new LoginBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'username':
            result.username = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
          case 'password':
            result.password = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$StatusSerializer implements StructuredSerializer<Status> {
  final Iterable<Type> types = const [Status, _$Status];
  final String wireName = 'Status';

  @override
  Iterable serialize(Serializers serializers, Status object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
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
  Status deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new StatusBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'message':
            result.message = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
          case 'type':
            result.type = serializers.deserialize(value,
                specifiedType: const FullType(StatusType));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$StatusTypeSerializer implements PrimitiveSerializer<StatusType> {
  final Iterable<Type> types = const [StatusType];
  final String wireName = 'StatusType';

  @override
  Object serialize(Serializers serializers, StatusType object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  StatusType deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return StatusType.valueOf(serialized);
  }
}

class _$ListUsersSerializer implements StructuredSerializer<ListUsers> {
  final Iterable<Type> types = const [ListUsers, _$ListUsers];
  final String wireName = 'ListUsers';

  @override
  Iterable serialize(Serializers serializers, ListUsers object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'statusTypes',
      serializers.serialize(object.statusTypes,
          specifiedType:
              const FullType(BuiltSet, const [const FullType(StatusType)])),
    ];

    return result;
  }

  @override
  ListUsers deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ListUsersBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'statusTypes':
            result.statusTypes.replace(serializers.deserialize(value,
                specifiedType: const FullType(
                    BuiltSet, const [const FullType(StatusType)])));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$LoginResponseSerializer implements PrimitiveSerializer<LoginResponse> {
  final Iterable<Type> types = const [LoginResponse];
  final String wireName = 'LoginResponse';

  @override
  Object serialize(Serializers serializers, LoginResponse object,
      {FullType specifiedType: FullType.unspecified}) {
    return object.name;
  }

  @override
  LoginResponse deserialize(Serializers serializers, Object serialized,
      {FullType specifiedType: FullType.unspecified}) {
    return LoginResponse.valueOf(serialized);
  }
}

class _$ShowChatSerializer implements StructuredSerializer<ShowChat> {
  final Iterable<Type> types = const [ShowChat, _$ShowChat];
  final String wireName = 'ShowChat';

  @override
  Iterable serialize(Serializers serializers, ShowChat object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
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
  ShowChat deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ShowChatBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'username':
            result.username = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
          case 'private':
            result.private = serializers.deserialize(value,
                specifiedType: const FullType(bool));
            break;
          case 'text':
            result.text = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$WelcomeSerializer implements StructuredSerializer<Welcome> {
  final Iterable<Type> types = const [Welcome, _$Welcome];
  final String wireName = 'Welcome';

  @override
  Iterable serialize(Serializers serializers, Welcome object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
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
  Welcome deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new WelcomeBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'log':
            result.log.replace(serializers.deserialize(value,
                specifiedType: const FullType(
                    BuiltList, const [const FullType(Response)])));
            break;
          case 'message':
            result.message = serializers.deserialize(value,
                specifiedType: const FullType(String));
            break;
        }
      }
    }

    return result.build();
  }
}

class _$ListUsersResponseSerializer
    implements StructuredSerializer<ListUsersResponse> {
  final Iterable<Type> types = const [ListUsersResponse, _$ListUsersResponse];
  final String wireName = 'ListUsersResponse';

  @override
  Iterable serialize(Serializers serializers, ListUsersResponse object,
      {FullType specifiedType: FullType.unspecified}) {
    final result = [
      'statuses',
      serializers.serialize(object.statuses,
          specifiedType: const FullType(BuiltMap,
              const [const FullType(String), const FullType(Status)])),
    ];

    return result;
  }

  @override
  ListUsersResponse deserialize(Serializers serializers, Iterable serialized,
      {FullType specifiedType: FullType.unspecified}) {
    final result = new ListUsersResponseBuilder();

    var key;
    var value;
    var expectingKey = true;
    for (final item in serialized) {
      if (expectingKey) {
        key = item;
        expectingKey = false;
      } else {
        value = item;
        expectingKey = true;

        switch (key as String) {
          case 'statuses':
            result.statuses.replace(serializers.deserialize(value,
                specifiedType: const FullType(BuiltMap,
                    const [const FullType(String), const FullType(Status)])));
            break;
        }
      }
    }

    return result.build();
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Chat
// **************************************************************************

class _$Chat extends Chat {
  final String text;
  final BuiltSet<String> targets;

  _$Chat._({this.text, this.targets}) : super._() {
    if (text == null) throw new ArgumentError.notNull('text');
    if (targets == null) throw new ArgumentError.notNull('targets');
  }

  factory _$Chat([updates(ChatBuilder b)]) =>
      (new ChatBuilder()..update(updates)).build();

  Chat rebuild(updates(ChatBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ChatBuilder toBuilder() => new ChatBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Chat) return false;
    return text == other.text && targets == other.targets;
  }

  int get hashCode {
    return $jf($jc($jc(0, text.hashCode), targets.hashCode));
  }

  String toString() {
    return 'Chat {'
        'text=${text.toString()},\n'
        'targets=${targets.toString()},\n'
        '}';
  }
}

class ChatBuilder implements Builder<Chat, ChatBuilder> {
  Chat _$v;

  String _text;
  String get text => _text;
  set text(String text) => _$writableBuilder._text = text;

  SetBuilder<String> _targets;
  SetBuilder<String> get targets =>
      _$writableBuilder._targets ??= new SetBuilder<String>();
  set targets(SetBuilder<String> targets) =>
      _$writableBuilder._targets = targets;

  ChatBuilder();

  ChatBuilder get _$writableBuilder {
    if (_$v != null) {
      _text = _$v.text;
      _targets = _$v.targets?.toBuilder();
      _$v = null;
    }
    return this;
  }

  void replace(Chat other) {
    _$v = other;
  }

  void update(updates(ChatBuilder b)) {
    if (updates != null) updates(this);
  }

  Chat build() {
    final result = _$v ?? new _$Chat._(text: text, targets: targets?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Login
// **************************************************************************

class _$Login extends Login {
  final String username;
  final String password;

  _$Login._({this.username, this.password}) : super._() {
    if (username == null) throw new ArgumentError.notNull('username');
    if (password == null) throw new ArgumentError.notNull('password');
  }

  factory _$Login([updates(LoginBuilder b)]) =>
      (new LoginBuilder()..update(updates)).build();

  Login rebuild(updates(LoginBuilder b)) =>
      (toBuilder()..update(updates)).build();

  LoginBuilder toBuilder() => new LoginBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Login) return false;
    return username == other.username && password == other.password;
  }

  int get hashCode {
    return $jf($jc($jc(0, username.hashCode), password.hashCode));
  }

  String toString() {
    return 'Login {'
        'username=${username.toString()},\n'
        'password=${password.toString()},\n'
        '}';
  }
}

class LoginBuilder implements Builder<Login, LoginBuilder> {
  Login _$v;

  String _username;
  String get username => _username;
  set username(String username) => _$writableBuilder._username = username;

  String _password;
  String get password => _password;
  set password(String password) => _$writableBuilder._password = password;

  LoginBuilder();

  LoginBuilder get _$writableBuilder {
    if (_$v != null) {
      _username = _$v.username;
      _password = _$v.password;
      _$v = null;
    }
    return this;
  }

  void replace(Login other) {
    _$v = other;
  }

  void update(updates(LoginBuilder b)) {
    if (updates != null) updates(this);
  }

  Login build() {
    final result = _$v ?? new _$Login._(username: username, password: password);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Status
// **************************************************************************

class _$Status extends Status {
  final String message;
  final StatusType type;

  _$Status._({this.message, this.type}) : super._() {
    if (message == null) throw new ArgumentError.notNull('message');
    if (type == null) throw new ArgumentError.notNull('type');
  }

  factory _$Status([updates(StatusBuilder b)]) =>
      (new StatusBuilder()..update(updates)).build();

  Status rebuild(updates(StatusBuilder b)) =>
      (toBuilder()..update(updates)).build();

  StatusBuilder toBuilder() => new StatusBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Status) return false;
    return message == other.message && type == other.type;
  }

  int get hashCode {
    return $jf($jc($jc(0, message.hashCode), type.hashCode));
  }

  String toString() {
    return 'Status {'
        'message=${message.toString()},\n'
        'type=${type.toString()},\n'
        '}';
  }
}

class StatusBuilder implements Builder<Status, StatusBuilder> {
  Status _$v;

  String _message;
  String get message => _message;
  set message(String message) => _$writableBuilder._message = message;

  StatusType _type;
  StatusType get type => _type;
  set type(StatusType type) => _$writableBuilder._type = type;

  StatusBuilder();

  StatusBuilder get _$writableBuilder {
    if (_$v != null) {
      _message = _$v.message;
      _type = _$v.type;
      _$v = null;
    }
    return this;
  }

  void replace(Status other) {
    _$v = other;
  }

  void update(updates(StatusBuilder b)) {
    if (updates != null) updates(this);
  }

  Status build() {
    final result = _$v ?? new _$Status._(message: message, type: type);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ListUsers
// **************************************************************************

class _$ListUsers extends ListUsers {
  final BuiltSet<StatusType> statusTypes;

  _$ListUsers._({this.statusTypes}) : super._() {
    if (statusTypes == null) throw new ArgumentError.notNull('statusTypes');
  }

  factory _$ListUsers([updates(ListUsersBuilder b)]) =>
      (new ListUsersBuilder()..update(updates)).build();

  ListUsers rebuild(updates(ListUsersBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ListUsersBuilder toBuilder() => new ListUsersBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ListUsers) return false;
    return statusTypes == other.statusTypes;
  }

  int get hashCode {
    return $jf($jc(0, statusTypes.hashCode));
  }

  String toString() {
    return 'ListUsers {'
        'statusTypes=${statusTypes.toString()},\n'
        '}';
  }
}

class ListUsersBuilder implements Builder<ListUsers, ListUsersBuilder> {
  ListUsers _$v;

  SetBuilder<StatusType> _statusTypes;
  SetBuilder<StatusType> get statusTypes =>
      _$writableBuilder._statusTypes ??= new SetBuilder<StatusType>();
  set statusTypes(SetBuilder<StatusType> statusTypes) =>
      _$writableBuilder._statusTypes = statusTypes;

  ListUsersBuilder();

  ListUsersBuilder get _$writableBuilder {
    if (_$v != null) {
      _statusTypes = _$v.statusTypes?.toBuilder();
      _$v = null;
    }
    return this;
  }

  void replace(ListUsers other) {
    _$v = other;
  }

  void update(updates(ListUsersBuilder b)) {
    if (updates != null) updates(this);
  }

  ListUsers build() {
    final result = _$v ?? new _$ListUsers._(statusTypes: statusTypes?.build());
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ShowChat
// **************************************************************************

class _$ShowChat extends ShowChat {
  final String username;
  final bool private;
  final String text;

  _$ShowChat._({this.username, this.private, this.text}) : super._() {
    if (username == null) throw new ArgumentError.notNull('username');
    if (private == null) throw new ArgumentError.notNull('private');
    if (text == null) throw new ArgumentError.notNull('text');
  }

  factory _$ShowChat([updates(ShowChatBuilder b)]) =>
      (new ShowChatBuilder()..update(updates)).build();

  ShowChat rebuild(updates(ShowChatBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ShowChatBuilder toBuilder() => new ShowChatBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ShowChat) return false;
    return username == other.username &&
        private == other.private &&
        text == other.text;
  }

  int get hashCode {
    return $jf(
        $jc($jc($jc(0, username.hashCode), private.hashCode), text.hashCode));
  }

  String toString() {
    return 'ShowChat {'
        'username=${username.toString()},\n'
        'private=${private.toString()},\n'
        'text=${text.toString()},\n'
        '}';
  }
}

class ShowChatBuilder implements Builder<ShowChat, ShowChatBuilder> {
  ShowChat _$v;

  String _username;
  String get username => _username;
  set username(String username) => _$writableBuilder._username = username;

  bool _private;
  bool get private => _private;
  set private(bool private) => _$writableBuilder._private = private;

  String _text;
  String get text => _text;
  set text(String text) => _$writableBuilder._text = text;

  ShowChatBuilder();

  ShowChatBuilder get _$writableBuilder {
    if (_$v != null) {
      _username = _$v.username;
      _private = _$v.private;
      _text = _$v.text;
      _$v = null;
    }
    return this;
  }

  void replace(ShowChat other) {
    _$v = other;
  }

  void update(updates(ShowChatBuilder b)) {
    if (updates != null) updates(this);
  }

  ShowChat build() {
    final result = _$v ??
        new _$ShowChat._(username: username, private: private, text: text);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class Welcome
// **************************************************************************

class _$Welcome extends Welcome {
  final BuiltList<Response> log;
  final String message;

  _$Welcome._({this.log, this.message}) : super._() {
    if (log == null) throw new ArgumentError.notNull('log');
    if (message == null) throw new ArgumentError.notNull('message');
  }

  factory _$Welcome([updates(WelcomeBuilder b)]) =>
      (new WelcomeBuilder()..update(updates)).build();

  Welcome rebuild(updates(WelcomeBuilder b)) =>
      (toBuilder()..update(updates)).build();

  WelcomeBuilder toBuilder() => new WelcomeBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! Welcome) return false;
    return log == other.log && message == other.message;
  }

  int get hashCode {
    return $jf($jc($jc(0, log.hashCode), message.hashCode));
  }

  String toString() {
    return 'Welcome {'
        'log=${log.toString()},\n'
        'message=${message.toString()},\n'
        '}';
  }
}

class WelcomeBuilder implements Builder<Welcome, WelcomeBuilder> {
  Welcome _$v;

  ListBuilder<Response> _log;
  ListBuilder<Response> get log =>
      _$writableBuilder._log ??= new ListBuilder<Response>();
  set log(ListBuilder<Response> log) => _$writableBuilder._log = log;

  String _message;
  String get message => _message;
  set message(String message) => _$writableBuilder._message = message;

  WelcomeBuilder();

  WelcomeBuilder get _$writableBuilder {
    if (_$v != null) {
      _log = _$v.log?.toBuilder();
      _message = _$v.message;
      _$v = null;
    }
    return this;
  }

  void replace(Welcome other) {
    _$v = other;
  }

  void update(updates(WelcomeBuilder b)) {
    if (updates != null) updates(this);
  }

  Welcome build() {
    final result = _$v ?? new _$Welcome._(log: log?.build(), message: message);
    replace(result);
    return result;
  }
}

// **************************************************************************
// Generator: BuiltValueGenerator
// Target: abstract class ListUsersResponse
// **************************************************************************

class _$ListUsersResponse extends ListUsersResponse {
  final BuiltMap<String, Status> statuses;

  _$ListUsersResponse._({this.statuses}) : super._() {
    if (statuses == null) throw new ArgumentError.notNull('statuses');
  }

  factory _$ListUsersResponse([updates(ListUsersResponseBuilder b)]) =>
      (new ListUsersResponseBuilder()..update(updates)).build();

  ListUsersResponse rebuild(updates(ListUsersResponseBuilder b)) =>
      (toBuilder()..update(updates)).build();

  ListUsersResponseBuilder toBuilder() =>
      new ListUsersResponseBuilder()..replace(this);

  bool operator ==(other) {
    if (other is! ListUsersResponse) return false;
    return statuses == other.statuses;
  }

  int get hashCode {
    return $jf($jc(0, statuses.hashCode));
  }

  String toString() {
    return 'ListUsersResponse {'
        'statuses=${statuses.toString()},\n'
        '}';
  }
}

class ListUsersResponseBuilder
    implements Builder<ListUsersResponse, ListUsersResponseBuilder> {
  ListUsersResponse _$v;

  MapBuilder<String, Status> _statuses;
  MapBuilder<String, Status> get statuses =>
      _$writableBuilder._statuses ??= new MapBuilder<String, Status>();
  set statuses(MapBuilder<String, Status> statuses) =>
      _$writableBuilder._statuses = statuses;

  ListUsersResponseBuilder();

  ListUsersResponseBuilder get _$writableBuilder {
    if (_$v != null) {
      _statuses = _$v.statuses?.toBuilder();
      _$v = null;
    }
    return this;
  }

  void replace(ListUsersResponse other) {
    _$v = other;
  }

  void update(updates(ListUsersResponseBuilder b)) {
    if (updates != null) updates(this);
  }

  ListUsersResponse build() {
    final result =
        _$v ?? new _$ListUsersResponse._(statuses: statuses?.build());
    replace(result);
    return result;
  }
}

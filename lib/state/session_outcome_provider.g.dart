// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_outcome_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$outcomeHash() => r'df75484fc1debe2e21c7cb71d8a717642d3c2e09';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [outcome].
@ProviderFor(outcome)
const outcomeProvider = OutcomeFamily();

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [outcome].
class OutcomeFamily extends Family<AsyncValue<String>> {
  /// This will create a provider named `activityProvider`
  /// which will cache the result of this function.
  ///
  /// Copied from [outcome].
  const OutcomeFamily();

  /// This will create a provider named `activityProvider`
  /// which will cache the result of this function.
  ///
  /// Copied from [outcome].
  OutcomeProvider call(SessionOutcomeArgs args) {
    return OutcomeProvider(args);
  }

  @override
  OutcomeProvider getProviderOverride(covariant OutcomeProvider provider) {
    return call(provider.args);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'outcomeProvider';
}

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [outcome].
class OutcomeProvider extends AutoDisposeFutureProvider<String> {
  /// This will create a provider named `activityProvider`
  /// which will cache the result of this function.
  ///
  /// Copied from [outcome].
  OutcomeProvider(SessionOutcomeArgs args)
    : this._internal(
        (ref) => outcome(ref as OutcomeRef, args),
        from: outcomeProvider,
        name: r'outcomeProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$outcomeHash,
        dependencies: OutcomeFamily._dependencies,
        allTransitiveDependencies: OutcomeFamily._allTransitiveDependencies,
        args: args,
      );

  OutcomeProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.args,
  }) : super.internal();

  final SessionOutcomeArgs args;

  @override
  Override overrideWith(FutureOr<String> Function(OutcomeRef provider) create) {
    return ProviderOverride(
      origin: this,
      override: OutcomeProvider._internal(
        (ref) => create(ref as OutcomeRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        args: args,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<String> createElement() {
    return _OutcomeProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OutcomeProvider && other.args == args;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, args.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OutcomeRef on AutoDisposeFutureProviderRef<String> {
  /// The parameter `args` of this provider.
  SessionOutcomeArgs get args;
}

class _OutcomeProviderElement extends AutoDisposeFutureProviderElement<String>
    with OutcomeRef {
  _OutcomeProviderElement(super.provider);

  @override
  SessionOutcomeArgs get args => (origin as OutcomeProvider).args;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

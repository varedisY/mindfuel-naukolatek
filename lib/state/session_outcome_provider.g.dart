// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_outcome_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsHash() => r'096b1cada0fd2e59162b64976899e0f411b66097';

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
/// Copied from [questions].
@ProviderFor(questions)
const questionsProvider = QuestionsFamily();

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [questions].
class QuestionsFamily extends Family<AsyncValue<List<Question>>> {
  /// This will create a provider named `activityProvider`
  /// which will cache the result of this function.
  ///
  /// Copied from [questions].
  const QuestionsFamily();

  /// This will create a provider named `activityProvider`
  /// which will cache the result of this function.
  ///
  /// Copied from [questions].
  QuestionsProvider call(SessionOutcomeArgs outcome) {
    return QuestionsProvider(outcome);
  }

  @override
  QuestionsProvider getProviderOverride(covariant QuestionsProvider provider) {
    return call(provider.outcome);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'questionsProvider';
}

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [questions].
class QuestionsProvider extends AutoDisposeFutureProvider<List<Question>> {
  /// This will create a provider named `activityProvider`
  /// which will cache the result of this function.
  ///
  /// Copied from [questions].
  QuestionsProvider(SessionOutcomeArgs outcome)
    : this._internal(
        (ref) => questions(ref as QuestionsRef, outcome),
        from: questionsProvider,
        name: r'questionsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$questionsHash,
        dependencies: QuestionsFamily._dependencies,
        allTransitiveDependencies: QuestionsFamily._allTransitiveDependencies,
        outcome: outcome,
      );

  QuestionsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.outcome,
  }) : super.internal();

  final SessionOutcomeArgs outcome;

  @override
  Override overrideWith(
    FutureOr<List<Question>> Function(QuestionsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: QuestionsProvider._internal(
        (ref) => create(ref as QuestionsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        outcome: outcome,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Question>> createElement() {
    return _QuestionsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is QuestionsProvider && other.outcome == outcome;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, outcome.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin QuestionsRef on AutoDisposeFutureProviderRef<List<Question>> {
  /// The parameter `outcome` of this provider.
  SessionOutcomeArgs get outcome;
}

class _QuestionsProviderElement
    extends AutoDisposeFutureProviderElement<List<Question>>
    with QuestionsRef {
  _QuestionsProviderElement(super.provider);

  @override
  SessionOutcomeArgs get outcome => (origin as QuestionsProvider).outcome;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

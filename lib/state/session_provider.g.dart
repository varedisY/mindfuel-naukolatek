// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$questionsHash() => r'bf7f8db8139367857afab9eb6245676c884b9dd3';

/// This will create a provider named `activityProvider`
/// which will cache the result of this function.
///
/// Copied from [questions].
@ProviderFor(questions)
final questionsProvider = AutoDisposeFutureProvider<List<Question>>.internal(
  questions,
  name: r'questionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$questionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef QuestionsRef = AutoDisposeFutureProviderRef<List<Question>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package

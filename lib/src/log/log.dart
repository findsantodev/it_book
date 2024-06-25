// ignore_for_file: avoid_classes_with_only_static_members

import 'dart:developer';

/// A simple helper class to standardize log messages.
///
/// Additionally for release builds it also reports errors to crashlytics
/// for [warning] & [error].
class Log {
  static void debug(
    String tag,
    String? message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final timestamp = DateTime.now();
    final logMessage = "[DEBUG] [$tag] : $timestamp : $message";
    log(logMessage, time: timestamp, error: error, stackTrace: stackTrace);
  }

  static void warning(
    String tag,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final timestamp = DateTime.now();
    final logMessage = "[WARNING] [$tag] : $message";
    log(logMessage, time: timestamp, error: error, stackTrace: stackTrace);
  }

  static void error(
    String tag,
    String message, [
    Object? error,
    StackTrace? stackTrace,
  ]) {
    final timestamp = DateTime.now();
    final logMessage = "[ERROR] [$tag] : $message";
    log(logMessage, time: timestamp, error: error, stackTrace: stackTrace);
  }
}

import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  /// A future which returns a URL to an image.
  final String _photoUrl;

  /// Placeholder image
  final double? _height;

  /// Placeholder image
  final double? _width;

  /// Placeholder image
  final String? _placeholderPath;

  const ImageWidget({
    super.key,
    required String photoUrl,
    double? height,
    double? width,
    String? placeholderPath,
  })  : _height = height,
        _width = width,
        _photoUrl = photoUrl,
        _placeholderPath = placeholderPath;

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholderErrorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const Icon(Icons.error);
      },
      imageErrorBuilder: (
        context,
        error,
        stackTrace,
      ) {
        return const Icon(Icons.error);
      },
      height: _height,
      width: _width,
      fit: BoxFit.cover,
      placeholder: _placeholderPath ?? '',
      image: _photoUrl,
    );
  }
}

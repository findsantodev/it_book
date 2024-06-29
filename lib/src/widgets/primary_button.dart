import 'package:flutter/material.dart';

import 'package:palm_code/resources/theme.dart';

/// Implements the design spec for Secondary Button
///
/// [onPressed] : Callback which is called when the button is clicked.
/// [text] : String to be shown on the button
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool isDisabled;
  final Color? buttonColor;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isDisabled = false,
    this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return IgnorePointer(
      ignoring: isDisabled,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.buttonPrimary,
          padding: const EdgeInsets.symmetric(
            vertical: 23.0,
            horizontal: 24.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60.0),
          ),
          elevation: 0,
        ),
        onPressed: !isLoading ? onPressed : () {},
        child: !isLoading
            ? Text(
                text.toUpperCase(),
                style: theme.primaryButton,
              )
            : const SizedBox(
                height: 20.0,
                width: 20.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
      ),
    );
  }
}

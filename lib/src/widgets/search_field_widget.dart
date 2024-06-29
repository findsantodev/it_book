import 'package:flutter/material.dart';
import 'package:palm_code/resources/theme.dart';

class SearchFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focus;
  final String hintText;
  final bool enabled;
  final Function()? onEditingComplete;
  const SearchFieldWidget({
    super.key,
    this.controller,
    this.focus,
    required this.enabled,
    required this.hintText,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      focusNode: focus,
      textAlignVertical: TextAlignVertical.bottom,
      style: Theme.of(context).body3,
      controller: controller,
      onEditingComplete: onEditingComplete,
      textInputAction: TextInputAction.go,
      decoration: InputDecoration(
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32),
          borderSide: BorderSide(color: Theme.of(context).borderDark),
        ),
        hintText: hintText,
        hintStyle: Theme.of(context).body3,
        prefixIcon: const Icon(Icons.search),
        prefixIconColor: Colors.black,
      ),
    );
  }
}

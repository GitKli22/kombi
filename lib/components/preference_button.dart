import 'package:flutter/material.dart';

class PreferenceButton extends StatelessWidget {
  final Widget widget;
  final void Function()? onTap;

  const PreferenceButton({
    super.key,
    required this.onTap,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 1.5),
        ),
        padding: const EdgeInsets.all(5),
        margin: const EdgeInsets.only(right: 5),
        child: widget,
      ),
    );
  }
}

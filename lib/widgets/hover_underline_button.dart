import 'package:flutter/material.dart';

// Hover underline button widget
class HoverUnderlineButton extends StatefulWidget {
  final String label;
  final VoidCallback onPressed;
  final bool active;

  const HoverUnderlineButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.active = false,
  });

  @override
  State<HoverUnderlineButton> createState() => _HoverUnderlineButtonState();
}

class _HoverUnderlineButtonState extends State<HoverUnderlineButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final bool showUnderline = _hovering || widget.active;
    final underlineColor =
        showUnderline ? const Color(0xFF4d2963) : Colors.transparent;
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: underlineColor, width: 2),
            ),
          ),
          child: Text(
            widget.label,
            style: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              fontWeight: FontWeight.normal,
              letterSpacing: 0.8,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
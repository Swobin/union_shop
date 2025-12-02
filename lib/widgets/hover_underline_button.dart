import 'package:flutter/material.dart';

class HoverUnderlineButton extends StatefulWidget {
  final String text;
  final bool isActive;
  final VoidCallback onPressed;

  const HoverUnderlineButton({
    super.key,
    required this.text,
    this.isActive = false,
    required this.onPressed,
  });

  @override
  State<HoverUnderlineButton> createState() => _HoverUnderlineButtonState();
}

class _HoverUnderlineButtonState extends State<HoverUnderlineButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: widget.onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: widget.isActive ? FontWeight.bold : FontWeight.normal,
                color: widget.isActive ? const Color(0xFF4d2963) : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: 2,
              width: (_isHovering || widget.isActive) ? widget.text.length * 8.0 : 0,
              color: const Color(0xFF4d2963),
            ),
          ],
        ),
      ),
    );
  }
}
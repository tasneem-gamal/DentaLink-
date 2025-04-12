import 'package:dentalink/features/home/ui/widgets/tools/tool_details/publisher/publisher_info_container.dart';
import 'package:flutter/material.dart';

class PublisherInfoDetailsButton extends StatefulWidget {
  const PublisherInfoDetailsButton({
    super.key,
  });

  @override
  State<PublisherInfoDetailsButton> createState() => _PublisherInfoDetailsButtonState();
}

class _PublisherInfoDetailsButtonState extends State<PublisherInfoDetailsButton> {
  bool isPressed = false;
  OverlayEntry? overlayEntry;

  @override
  void dispose() {
    overlayEntry?.remove();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleContainer, 
      icon: const Icon(Icons.info_outline)
    );
  }

    OverlayEntry _createOverlayEntry() {
    final screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    return OverlayEntry(
      builder: (context) => PublisherInfoContainer(
        screenWidth: screenWidth, 
        screenHeight: screenHeight
      ),
    );
  }

    void toggleContainer({bool closeOnly = false}) {
  if (isPressed || closeOnly) {
    removeOverlay();
  } else {
    overlayEntry = _createOverlayEntry();
    Overlay.of(context).insert(overlayEntry!);
    setState(() {
      isPressed = true;
    });
  }
}

void removeOverlay() {
  overlayEntry?.remove();
  overlayEntry = null;
  setState(() {
    isPressed = false;
  });
}
}


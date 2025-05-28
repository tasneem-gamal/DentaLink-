import 'dart:math';

import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';


class SendField extends StatefulWidget {
  const SendField({
    super.key,
    required this.controller,
    required FocusNode focusNode,
    required InMemoryChatController chatController, required this.currentUserId,
  }) : _focusNode = focusNode, _chatController = chatController;

  final TextEditingController controller;
  final FocusNode _focusNode;
  final InMemoryChatController _chatController;
  final String currentUserId;

  @override
  State<SendField> createState() => _SendFieldState();
}

class _SendFieldState extends State<SendField> {
  OverlayEntry? _overlayEntry;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: Constants.appPadding,
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: widget.controller,
                focusNode: widget._focusNode,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  prefixIcon: IconButton(
                    onPressed: (){
                      if (_overlayEntry == null) {
                        _showOverlay();
                      } else {
                        _removeOverlay();
                      }
                    },
                    icon: const Icon(Icons.attach_file)
                  ),
                  border: const OutlineInputBorder(
                      borderRadius:
                          BorderRadius.all(Radius.circular(40)),
                      borderSide:
                          BorderSide(color: ColorsManager.moreLightGray)),
                ),
              ),
            ),
            horizontalSpace(10),
            GestureDetector(
              onTap: () {
                final text = widget.controller.text.trim();
                if (text.isNotEmpty) {
                  widget._chatController.insertMessage(
                    TextMessage(
                      id: '${Random().nextInt(1000)}',
                      authorId: widget.currentUserId,
                      createdAt: DateTime.now().toUtc(),
                      text: text,
                    ),
                  );
                  widget.controller.clear();
                }
              },
              child: const CircleAvatar(
                radius: 24,
                backgroundColor: ColorsManager.mainBlue,
                child: Icon(
                  Icons.send,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _removeOverlay,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx + 24,
              top: offset.dy + MediaQuery.of(context).size.height * 0.68, 
              width: 200,
              child: Material(
                color: ColorsManager.otherLightGrayShade,
                elevation: 1,
                borderRadius: BorderRadius.circular(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.photo_camera),
                      title: const Text('Scan Photo'),
                      onTap: () {
                        _removeOverlay();
                      },
                    ),
                    const Divider(thickness: 1, color: ColorsManager.moreLightGray,),
                    ListTile(
                      leading: const Icon(Icons.upload),
                      title: const Text('Attach File'),
                      onTap: () {
                        _removeOverlay();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}

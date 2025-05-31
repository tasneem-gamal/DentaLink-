import 'dart:io';

import 'package:dentalink/core/helpers/constants.dart';
import 'package:dentalink/core/helpers/spacing.dart';
import 'package:dentalink/core/theming/colors.dart';
import 'package:dentalink/features/AI_scan/ui/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:image_picker/image_picker.dart';


class SendField extends StatefulWidget {
  const SendField({
    super.key,
    required this.controller,
    required FocusNode focusNode,
    required InMemoryChatController chatController,
    required this.currentUserId,
    required this.onSendPressed, 
  }) : _focusNode = focusNode;

  final TextEditingController controller;
  final FocusNode _focusNode;
  final String currentUserId;
  final void Function(String, File?) onSendPressed;


  @override
  State<SendField> createState() => _SendFieldState();
}

class _SendFieldState extends State<SendField> {
  OverlayEntry? _overlayEntry;
  File? _pickedImage;


  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: Constants.appPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (_pickedImage != null)
            ImageContainer(
              pickedImage: _pickedImage,
              onTap: () {
                setState(() {
                  _pickedImage = null;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    focusNode: widget._focusNode,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: IconButton(
                          onPressed: () {
                            if (_overlayEntry == null) {
                              _showOverlay();
                            } else {
                              _removeOverlay();
                            }
                          },
                          icon: const Icon(Icons.attach_file)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          borderSide:
                              BorderSide(color: ColorsManager.moreLightGray)),
                    ),
                  ),
                ),
                horizontalSpace(10),
                GestureDetector(
                  onTap: () {
                    final text = widget.controller.text.trim();
                    if (text.isNotEmpty || _pickedImage != null) {
                      widget.onSendPressed(text, _pickedImage);
                      _pickedImage = null;
                      widget.controller.clear();
                      setState(() {});
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
                      onTap: () async {
                        _removeOverlay();
                        final picker = ImagePicker();
                        final picked =
                            await picker.pickImage(source: ImageSource.camera);
                        if (picked != null) {
                          setState(() {
                            _pickedImage = File(picked.path);
                          });
                        }
                      },
                    ),
                    const Divider(thickness: 1, color: ColorsManager.moreLightGray,),
                    ListTile(
                      leading: const Icon(Icons.upload),
                      title: const Text('Attach File'),
                      onTap: () async {
                        _removeOverlay();
                        final picker = ImagePicker();
                        final picked =
                            await picker.pickImage(source: ImageSource.gallery);
                        if (picked != null) {
                          setState(() {
                            _pickedImage = File(picked.path);
                          });
                        }
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



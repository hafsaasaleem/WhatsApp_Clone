// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/colors/coloors.dart';
import 'package:whatsapp_clone/common/extension/custom_theme_extension.dart';
import 'package:whatsapp_clone/common/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/features/chat/controller/chat_controller.dart';

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({Key? key, required this.receiverId}) : super(key: key);

  final String receiverId;

  @override
  ConsumerState<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  late TextEditingController messageController;
  bool isMessageIconEnabled = false;

  void sendTextMessage() async {
    if (isMessageIconEnabled) {
      ref.read(chatControllerProvider).sendTextMessage(
            context: context,
            textMessage: messageController.text,
            receiverId: widget.receiverId,
          );
      messageController.clear();
    }
  }

  @override
  void initState() {
    messageController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: messageController,
              maxLines: 4,
              minLines: 1,
              onChanged: (value) {
                value.isEmpty
                    ? setState(() => isMessageIconEnabled = false)
                    : setState(() => isMessageIconEnabled = true);
              },
              decoration: InputDecoration(
                hintText: "Message",
                hintStyle: TextStyle(
                  color: context.theme.greyColor,
                ),
                filled: true,
                fillColor: context.theme.chatTextFieldBgColor,
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(
                    style: BorderStyle.none,
                    width: 0,
                  ),
                ),
                prefixIcon: Material(
                  color: Colors.transparent,
                  child: CustomIconButton(
                    onTap: () {},
                    icon: Icons.emoji_emotions_outlined,
                  ),
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RotatedBox(
                      quarterTurns: 45,
                      child: CustomIconButton(
                        onTap: () {},
                        icon: Icons.attach_file,
                      ),
                    ),
                    CustomIconButton(
                      onTap: () {},
                      icon: Icons.camera_alt_rounded,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          CustomIconButton(
            onTap: sendTextMessage,
            icon: isMessageIconEnabled
                ? Icons.send_outlined
                : Icons.mic_none_outlined,
            background: Coloors.greenDark,
            iconColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

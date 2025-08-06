import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ride_share_flat/helpers/pref_helper.dart';
import 'package:ride_share_flat/view/component/CommonText.dart';
import '../../../../../../../../../controller/WebsocketController/web_socket_controller.dart';
import '../../../../../../../../../utils/app_urls.dart';
import '../../../../../../../../component/image/common_image.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final WebSocketController controller = Get.put(WebSocketController());
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      controller.getMessages();
      controller.getMessageBySocket(rideId: controller.completeRideModel.id);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
        title: Obx(() {
          return controller.isMessageLoading.value
              ? Center(
            child: CircularProgressIndicator(color: Colors.blueAccent),
          )
              : Row(
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: ClipOval(
                  child: CommonImage(
                    imageSrc:
                    "${AppUrls.imageUrl}${controller.completeRideModel.passenger.profileImage}",
                    imageType: ImageType.network,
                    fill: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    text: controller.completeRideModel.passenger.fullName,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  CommonText(
                    text: "Service Provider",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ],
              ),
            ],
          );
        }),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (controller.isMessageLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                controller: controller.scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  final bool isMine = message.sender == PrefsHelper.userId;
                  return Align(
                    alignment: isMine
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: isMine
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          constraints: const BoxConstraints(maxWidth: 280),
                          decoration: BoxDecoration(
                            color: isMine ? Colors.black : Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message.text,
                            style: TextStyle(
                              color: isMine ? Colors.white : Colors.black,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildInputField() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey[300]!)),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                hintText: "Type something...",
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.black,
            ),
            child: IconButton(
              onPressed: () {
                controller.sendMessage(
                  rideId: '688edbe79863807a05ffa13f',
                  messageText: textController.text,
                );
                textController.clear();
              },
              icon: Icon(Icons.send, color: Colors.white, size: 20),
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(String dateTimeStr) {
    try {
      final dateTime = DateTime.parse(dateTimeStr).toLocal();
      return DateFormat.jm().format(dateTime); // e.g. 10:03 AM
    } catch (_) {
      return '';
    }
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../helpers/pref_helper.dart';
import '../../model/MessageModel/message_model.dart';
import '../../services/api_services.dart';
import '../../services/socket_services.dart';
import '../../utils/app_urls.dart';

class WebSocketController extends GetxController {
  CompleteRideModel completeRideModel = CompleteRideModel.fromJson({});
  late WebSocketChannel channel;

  var isConnected = false.obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;

  RxBool isMessageLoading = false.obs;

  Future<void> getMessages() async {
    isMessageLoading(true);
    try {
      Map<String, String> header = {"token": PrefsHelper.token};

      var response = await ApiService.getApi(AppUrls.mesage, header: header);

      if (response.statusCode == 200) {
        log("Messages fetched successfully");

        var data = response.body["data"];
        completeRideModel = CompleteRideModel.fromJson(data);
        messages.value = completeRideModel.messages;

        WidgetsBinding.instance.addPostFrameCallback((_) {
          scrollToBottom();
        });

        log("RideModel loaded with ${completeRideModel.messages.length} messages");
      } else {
        log("Failed to fetch messages: ${response.statusCode}");
      }
    } catch (e) {
      log("Exception fetching messages: $e");
    } finally {
      isMessageLoading(false);
    }
  }

  ///<==========================> Get Messages <===========================>

  Future<void> getMessageBySocket({required String rideId}) async {
    try {
      if (SocketServices.socket?.connected == false) {
        await SocketServices.connectToSocket(token: PrefsHelper.token);
      }
      if (SocketServices.socket!.connected) {
        log('Socket is connected. Getting client_message event.');
        log('User Id========>: $rideId');

        // REMOVE OLD LISTENERS TO AVOID DUPLICATES
        SocketServices.socket?.off("receiveMessage::$rideId");

        SocketServices.socket?.on("receiveMessage::$rideId", (data) {
          log("get message By Socket======>$data");
          if (data != null) {
            messages.add(
              MessageModel(
                sender: data["sender"],
                text: data["text"],
                createdAt: data["createdAt"],
                seenBy: data["seenBy"],
              ),
            );
            scrollToBottom();
            log("messagelength=============${messages.length}");
          }
        });
      } else {
        log('Socket is not connected. Unable to listen for messages.');
      }
    } catch (error, stackTrace) {
      log('Error in getMessage: $error');
      log('Stack Trace: $stackTrace');
    }
  }

  ///<==========================> Send Messages <===========================>

  Future<bool> sendMessage({
    required String rideId,
    required String messageText,
  }) async {
    try {
      Map<String, String> data = {"rideId": rideId, "text": messageText};
      if (SocketServices.socket?.connected == false) {
        await SocketServices.connectToSocket(token: PrefsHelper.token);
      }

      if (SocketServices.isConnected) {
        log('Socket is connected. Emitting send-new-message event.');

        SocketServices.socket?.emitWithAck(
          "sendMessage",
          data,
          ack: (response) {
            if (response != null) {
              log("response <<<====>>> $response");

              return true;
            } else {
              log('No acknowledgment received or timeout occurred.');
            }
          },
        );
      } else {
        log('Socket is not connected. Unable to emit event.');
      }
    } catch (error, stackTrace) {
      log('Error in sendMessage: $error');
      log('Stack Trace: $stackTrace');
      return false;
    }
    return false;
  }


  ScrollController scrollController = ScrollController();

  void scrollToBottom() {
    if (scrollController.hasClients) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent + 38,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void onClose() {
    channel.sink.close();
    super.onClose();
  }
}

import 'dart:developer';
import 'package:ride_share_flat/utils/app_urls.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

import '../helpers/pref_helper.dart';

class SocketServices {
  static io.Socket? socket;
  static bool isConnected = false;

  /// Connect to the socket
  static Future<void> connectToSocket({String token = ""}) async {
    log("Socket Token ======$token");

    if (token.isEmpty) {
      log("Error: Token is null or empty. Cannot connect to socket.");
      return;
    }

    // Initialize the socket
    socket = io.io(
      AppUrls.socketUrl,
      io.OptionBuilder()
          .setTransports(['websocket'])
          .enableAutoConnect()
          .setExtraHeaders({"token": token})
          .build(),
    );

    // Connection event
    socket?.onConnect((_) {
      isConnected = true;
      log("Socket connected successfully.");
    });

    // Connection error event
    socket?.onConnectError((data) {
      isConnected = false;
      log("Socket connection error: $data");
    });

    socket?.on('connect_error', (error) {
      log('Socket connection error: $error');
    });

    // Disconnection event
    socket?.onDisconnect((data) {
      isConnected = false;
      log("Socket disconnected. $data");
    });

    // Connect the socket
    socket?.connect();
  }

  /// Disconnect the socket and clean up
  static void disconnectSocket() {
    if (socket!.connected) {
      socket!.disconnect();
      socket!.dispose();
      isConnected = false;
      log("Socket disconnected and resources cleaned up.");
    } else {
      log("Socket is already disconnected.");
    }
  }
}

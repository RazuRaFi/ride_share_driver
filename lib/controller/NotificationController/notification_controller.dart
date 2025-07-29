import 'dart:developer';
import 'package:get/get.dart';
import '../../helpers/pref_helper.dart';
import '../../model/NotificationModel/notification_model.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class NotificationController extends GetxController {
  NotificationModel notificationModel = NotificationModel();
  RxBool isLoading = false.obs;
  RxList<NotificationModel> notifyList = <NotificationModel>[].obs;

  Future<void> getNotification() async {
    isLoading(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      final response = await ApiService.getApi(AppUrls.notification, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];

        if (data != null && data['notification'] != null) {
          final List notifications = data['notification'];

          notifyList.value = notifications
              .map((e) => NotificationModel.fromJson(e))
              .toList();
        }
      } else {
        log("API Error: ${response.statusCode}");
      }
    } catch (e) {
      log("Notification fetch error: $e");
    } finally {
      isLoading(false);
    }
  }
}

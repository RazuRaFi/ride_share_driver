

import 'dart:developer';

import 'package:get/get.dart';
import 'package:ride_share_flat/model/WalletModel/wallet_model.dart';

import '../../helpers/pref_helper.dart';
import '../../services/api_services.dart';
import '../../utils/app_urls.dart';

class WalletController extends GetxController{
  BalanceModel balanceModel=BalanceModel.fromJson({});

  RxBool isWallet=false.obs;

  Future<BalanceModel?> getWallet() async {
    isWallet(true);

    try {
      Map<String, String> header = {
        "token": PrefsHelper.token,
      };

      var response = await ApiService.getApi(AppUrls.balance, header: header);

      if (response.statusCode == 200) {
        final data = response.body['data'];
        balanceModel=BalanceModel.fromJson(data);

      }
    } catch (e) {
      log("Error fetching pending rides >>> $e");
    } finally {
      isWallet(false);
    }

    return null;
  }


}
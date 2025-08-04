// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../../helpers/app_routes.dart';
// import '../../../utils/app_colors.dart';
// import '../../../utils/app_icons.dart';
// import '../../../utils/app_string.dart';
// import '../image/common_image.dart';
//
// Widget searchTextField(
//     BuildContext context,
//     FocusNode focusNode, {
//       bool isSuffixIcon = false,
//       required TextEditingController searchTextController,
//       String searchText = AppString.searchAddressCityLocation,
//     }) {
//   return TextFormField(
//     focusNode: focusNode,
//     controller: searchTextController,
//     onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
//     decoration: InputDecoration(
//       filled: true,
//       fillColor: AppColors.searchFieldColor,
//       hintText: searchText.tr,
//       hintStyle: TextStyle(color: Colors.grey[700]),
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: const BorderSide(color: AppColors.borderColor),
//       ),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: const BorderSide(color: AppColors.borderColor),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(30),
//         borderSide: const BorderSide(color: AppColors.borderColor, width: 2),
//       ),
//       contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       prefixIcon: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: CommonImage(imageSrc: AppIcons.searchIcon),
//       ),
//       suffixIcon: isSuffixIcon
//           ? GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//           Get.toNamed(AppRoutes.filterScreen);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: CommonImage(imageSrc: AppIcons.filterIcon),
//         ),
//       )
//           : null,
//     ),
//   );
// }


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/app_colors.dart';
import '../CommonText.dart';

class CommonTextField extends StatelessWidget {
  CommonTextField({
    super.key,
    this.hintText,
    this.labelText,
    this.prefixIcon,
    this.isPassword = false,
    this.controller,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.maxLength,
    this.maxLines,
    this.validator,
    this.prefixText,
    this.paddingHorizontal = 16,
    this.paddingVertical = 16,
    this.borderRadius = 10,
    this.inputFormatters,
    this.fillColor = AppColors.background, // Updated to match the white background
    this.hintTextColor = AppColors.blackNormal, // Gray hint text
    this.labelTextColor = AppColors.blackNormal, // Gray label text
    this.textColor = AppColors.black, // Black input text
    this.borderColor = AppColors.bgNormal, // Light gray border
    this.onSubmitted,
    this.onTap,
    this.suffixIcon,
  });

  final String? hintText;
  final String? labelText;
  final String? prefixText;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final Color? fillColor;
  final Color? labelTextColor;
  final Color? hintTextColor;
  final Color? textColor;
  final Color borderColor;

  final double paddingHorizontal;
  final double paddingVertical;
  final double borderRadius;
  final int? maxLength;
  final int? maxLines;

  final bool isPassword;
  RxBool obscureText = false.obs;

  final Function(String)? onSubmitted;
  final VoidCallback? onTap;

  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final FormFieldValidator? validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 0)
              )
            ]
        ),
        child: TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          obscureText: obscureText.value,
          textInputAction: textInputAction,
          maxLength: maxLength,
          maxLines: maxLines ?? 1,
          cursorColor: AppColors.black,
          inputFormatters: inputFormatters,
          style: TextStyle(fontSize: 14.sp, color: textColor),
          onFieldSubmitted: onSubmitted,
          onTap: onTap,
          decoration: InputDecoration(
            errorMaxLines: 2,
            filled: true,
            prefixIcon: prefixIcon != null
                ? Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: prefixIcon,
            )
                : null,
            prefixIconConstraints: BoxConstraints(
              minWidth: 40.w,
              minHeight: 40.h,
            ),
            fillColor: fillColor,
            counterText: "",
            contentPadding: EdgeInsets.symmetric(
                horizontal: paddingHorizontal.w, vertical: paddingVertical.h),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: borderColor, width: 1), // Thinner border
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: borderColor, width: 1),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: AppColors.extra, width: 1), // Red border for errors
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius.r),
              borderSide: BorderSide(color: AppColors.extra, width: 1),
            ),
            hintText: hintText,
            labelText: labelText,
            hintStyle: GoogleFonts.roboto(fontSize: 14.sp, color: hintTextColor),
            labelStyle: GoogleFonts.roboto(fontSize: 14.sp, color: labelTextColor),
            prefix: CommonText(
              text: prefixText ?? "",
              fontWeight: FontWeight.w400,
            ),
            suffixIcon: isPassword
                ? GestureDetector(
              onTap: toggle,
              child: Padding(
                padding: EdgeInsetsDirectional.only(end: 10.w),
                child: Obx(
                      () => Icon(
                    obscureText.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                    size: 20.sp,
                    color: textColor,
                  ),
                ),
              ),
            )
                : suffixIcon,
          ),
        ),
      ),
    );
  }

  void toggle() {
    obscureText.value = !obscureText.value;
  }
}

Widget commonTextfieldWithTitle(String title, TextEditingController controller,
    {FocusNode? focusNode,
      String hintText = "",
      bool isBold = false,
      bool issuffixIconVisible = false,
      Widget? suffinxIcon,
      bool readOnly = false,
      bool isPasswordVisible = false,
      enable,
      fontWeight,
      prifixIconWidget,
      titleColor = AppColors.black,
      textSize = 14.0,
      borderWidth = 2.0,
      changePasswordVisibility,
      String prefix = "",
      TextInputType keyboardType = TextInputType.text,
      String? assetIconPath,
      Color borderColor = Colors.grey,
      int maxLine = 1,
      final FormFieldValidator? onValidate,
      Function(String?)? onFieldSubmit}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CommonText(text: title, fontSize: textSize, fontWeight: FontWeight.w700, color: titleColor,),
      const SizedBox(
        height: 5,
      ),
      Card(
        elevation: 3,
        shadowColor: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: TextFormField(
            controller: controller,
            readOnly: readOnly,
            enabled: enable,
            focusNode: focusNode,
            validator: onValidate,
            onFieldSubmitted: onFieldSubmit,
            keyboardType: keyboardType,
            maxLines: maxLine,
            obscureText: isPasswordVisible,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12.0),
              hintText: hintText,
              fillColor: AppColors.white,
              filled: true,
              hintStyle: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              border: InputBorder.none,
              prefix: prefix.isEmpty ? null : CommonText(text: prefix, fontSize: 14,),
              suffixIcon: (suffinxIcon != null)
                  ? suffinxIcon
                  : (issuffixIconVisible)
                  ? (!isPasswordVisible)
                  ? InkWell(
                  onTap: changePasswordVisibility,
                  child: const Icon(Icons.visibility))
                  : InkWell(
                  onTap: changePasswordVisibility,
                  child: const Icon(Icons.visibility_off_outlined))
                  : null,
              prefixIcon: assetIconPath != null
                  ? Padding(
                padding: const EdgeInsets.all(10.0),
                child: ImageIcon(
                  AssetImage(assetIconPath),
                  size: 24.0,
                ),
              )
                  : (prifixIconWidget != null)
                  ? prifixIconWidget
                  : null,
            ),
          ),
        ),
      ),
    ],
  );
}

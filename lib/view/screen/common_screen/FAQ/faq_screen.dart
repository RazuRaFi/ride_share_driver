import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controller/SettingController/faq_controller.dart';
import '../../../../model/Faq/faq_model.dart';
import '../../../../utils/app_colors.dart';
import '../../../component/CommonText.dart';


class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  final FaqController faqController = Get.put(FaqController());
  final Map<String, bool> _expansionStates = {};

  @override
  void initState() {
    faqController.getFaq();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background2,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
          onPressed: () => Get.back(),
        ),
        title: const CommonText(
          text: "FAQ",
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.black,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.borderColor,
            height: 1,
          ),
        ),
      ),
      body: Obx(() {
        return faqController.isLoading.value
            ? const Center(child: CircularProgressIndicator(color: Colors.blueAccent))
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header message
              Container(
                color: AppColors.background,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                child: const CommonText(
                  text: "We’re here to help you with anything and everything on NEXT.",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
              // FAQ Sections
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: faqController.faqList.length,
                itemBuilder: (context, index) {
                  final faqItem = faqController.faqList[index];
                  return _buildFAQSection(
                    title: faqItem.category,
                    items: faqItem.questionAndAnswer,
                  );
                },
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildFAQSection({required String title, required List<QuestionAndAnswer> items, Color bgColor = AppColors.background}) {
    return Container(
      color: bgColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      margin: EdgeInsets.symmetric(vertical: 5.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: title,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.black,
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 8.h),
          ...items.map((item) => _buildFAQItem(item)),
        ],
      ),
    );
  }

  Widget _buildFAQItem(QuestionAndAnswer item) {
    final isExpanded = _expansionStates[item.question] ?? false;

    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.only(left: 0, right: 0, bottom: 8.h),
      title: CommonText(
        text: item.question,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
        textAlign: TextAlign.left,
      ),
      trailing: Icon(
        isExpanded ? Icons.clear : Icons.add,
        color: AppColors.gray,
      ),
      onExpansionChanged: (bool expanded) {
        setState(() {
          _expansionStates[item.question] = expanded;
        });
      },
      children: [
        Html(
          data: item.answer,
        ),
      ],
    );
  }
}
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ride_share_flat/view/component/button/CommonButton.dart';
import 'package:ride_share_flat/view/screen/driver/HomeScreen/HomeChild/Schedule/ScheduleTripDetails/DateTimePicker/time_picker.dart';

class CalendarBottomSheet extends StatefulWidget {
  const CalendarBottomSheet({super.key});

  @override
  State<CalendarBottomSheet> createState() => _CalendarBottomSheetState();
}

class _CalendarBottomSheetState extends State<CalendarBottomSheet> {
  int selectedDay = 26;
  int selectedMonth = 5; // 0-based index
  int selectedYear = 2024;

  final List<int> days = List.generate(31, (index) => index + 1);
  final List<String> months = [
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];
  final List<int> years = [2023, 2024, 2025, 2026];

  void showTimePickerBottomSheet(BuildContext context) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const TimePickerBottomSheet(),
    );

    if (result != null) {
      print("Selected Time: $result");
      // Optionally update state or a controller
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pickup Date',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          const Divider(color: Colors.red, thickness: 1),
          const SizedBox(height: 10),

          Expanded(
            child: Row(
              children: [
                // Day Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: days.indexOf(selectedDay)),
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedDay = days[index]);
                    },
                    children: days.map((d) => Center(child: Text("$d"))).toList(),
                  ),
                ),

                // Month Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: selectedMonth),
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedMonth = index);
                    },
                    children: months.map((m) => Center(child: Text(m))).toList(),
                  ),
                ),

                // Year Picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: years.indexOf(selectedYear)),
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedYear = years[index]);
                    },
                    children: years.map((y) => Center(child: Text("$y", style: const TextStyle(fontWeight: FontWeight.bold)))).toList(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonButton(
                titleText: "Cancel",
                titleSize: 16,
                buttonHeight: 45,
                buttonWidth: 150,
                borderColor: Colors.grey,
                titleColor: Colors.black,
                onTap: () {
                  Get.back();
                },
              ),
              CommonButton(
                titleText: "CONFIRM",
                buttonHeight: 45,
                buttonWidth: 150,
                backgroundColor: Colors.black,
                titleColor: Colors.white,
                titleSize: 16,
                onTap: () {
                  // Close the current bottom sheet
                  Get.back();
                  // Show the TimePickerBottomSheet
                  showTimePickerBottomSheet(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
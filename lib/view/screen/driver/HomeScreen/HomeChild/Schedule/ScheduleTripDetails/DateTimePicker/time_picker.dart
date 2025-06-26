

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimePickerBottomSheet extends StatefulWidget {
  const TimePickerBottomSheet({super.key});

  @override
  State<TimePickerBottomSheet> createState() => _TimePickerBottomSheetState();
}

class _TimePickerBottomSheetState extends State<TimePickerBottomSheet> {
  int selectedHour = 10;
  int selectedMinute = 30;
  String selectedPeriod = 'AM';

  final List<int> hours = List.generate(12, (index) => index + 1);
  final List<int> minutes = List.generate(60, (index) => index);
  final List<String> periods = ['AM', 'PM'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Pickup Time", style: TextStyle(fontWeight: FontWeight.bold)),
          const Divider(color: Colors.red),

          Expanded(
            child: Row(
              children: [
                // Hour picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: hours.indexOf(selectedHour)),
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedHour = hours[index]);
                    },
                    children: hours
                        .map((h) => Center(child: Text(h.toString().padLeft(2, '0'))))
                        .toList(),
                  ),
                ),

                // Minute picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: minutes.indexOf(selectedMinute)),
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedMinute = minutes[index]);
                    },
                    children: minutes
                        .map((m) => Center(child: Text(m.toString().padLeft(2, '0'))))
                        .toList(),
                  ),
                ),

                // AM/PM picker
                Expanded(
                  child: CupertinoPicker(
                    scrollController: FixedExtentScrollController(initialItem: periods.indexOf(selectedPeriod)),
                    itemExtent: 32,
                    onSelectedItemChanged: (index) {
                      setState(() => selectedPeriod = periods[index]);
                    },
                    children: periods
                        .map((p) => Center(child: Text(p)))
                        .toList(),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => Navigator.pop(context),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.grey.shade100,
                  ),
                  child: const Text("CANCEL", style: TextStyle(color: Colors.black)),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    final pickedTime = "$selectedHour:${selectedMinute.toString().padLeft(2, '0')} $selectedPeriod";
                    Navigator.pop(context, pickedTime);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                  ),
                  child: const Text("CONFIRM", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

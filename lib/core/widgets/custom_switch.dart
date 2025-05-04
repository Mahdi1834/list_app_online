import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final String title;
  final Function(bool) onToggle; // اضافه کردن Callback

  const CustomSwitch({
    super.key,
    required this.title,
    required this.onToggle, // مقداردهی الزامی
  });

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  bool isOn = false;

  void toggleSwitch(bool value) {
    setState(() {
      isOn = value;
    });
    widget.onToggle(value); // ارسال وضعیت جدید به Callback
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Switch(
            value: isOn,
            onChanged: toggleSwitch,
            activeColor: Colors.green,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: Colors.redAccent,
          ),
        ],
      ),
    );
  }
}



/////////////////////////////////////////


class CustomSwitchWithOutTitle extends StatelessWidget {
  final bool isOn; // مقدار وضعیت روشن/خاموش
  const CustomSwitchWithOutTitle({
    super.key,
    required this.isOn, // مقداردهی الزامی
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Switch(
        value: isOn, // مقدار وضعیت از بیرون گرفته می‌شود
        onChanged: null, // غیرفعال کردن تغییر وضعیت
        activeColor: Colors.green,
        activeTrackColor: Colors.green,
        inactiveThumbColor: Colors.white,
        inactiveTrackColor: Colors.redAccent,
      ),
    );
  }
}



//////////////////////////////////////////

class ClickableCustomSwitch extends StatelessWidget {
  final String title;
  final bool isOn; // مقدار وضعیت فعال بودن
  final VoidCallback onTap; // اکشن برای کل ویجت

  const ClickableCustomSwitch({
    super.key,
    required this.title,
    required this.isOn,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap, // کل ویجت کلیک‌پذیر است
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Switch(
              value: isOn, // مقدار روشن یا خاموش از والد دریافت می‌شود
              onChanged: null, // غیرفعال کردن تغییر وضعیت از سوی کاربر
              activeColor: Colors.green,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}






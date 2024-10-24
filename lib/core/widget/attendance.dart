import 'package:flutter/material.dart';
import 'package:frontend_geolocation/core/theme/app_color.dart';
import 'package:frontend_geolocation/core/theme/app_font.dart';
import 'package:frontend_geolocation/util/date_util.dart';

class Attendance extends StatelessWidget {
  final VoidCallback? onClockIn;
  final VoidCallback? onClockOut;
  final VoidCallback? onClickLog;

  const Attendance({
    super.key,
    required this.onClockIn,
    required this.onClockOut,
    required this.onClickLog,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Row(
              children: [
                Image.asset('assets/icons/ic-calendar.png', width: 20),
                const SizedBox(width: 8),
                Text(DateUtil.dateFormat(date: DateTime.now()),
                    style: textRegular),
                const Spacer(),
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: onClickLog,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      child: Text(
                        'Lihat Log',
                        style: textRegular.copyWith(color: AppColor.primary),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppColor.grey),
          SizedBox(
            height: 42,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: onClockIn,
                        child: SizedBox(
                          height: 42,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Clock In',
                                style: textRegularSemiBold.copyWith(
                                  color: onClockIn != null
                                      ? AppColor.primary
                                      : AppColor.grey,
                                ),
                              ),
                              Image.asset(
                                'assets/icons/ic-clockin.png',
                                width: 20,
                                color: onClockIn != null
                                    ? AppColor.primary
                                    : AppColor.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const VerticalDivider(width: 1, color: AppColor.grey),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Material(
                      color: Colors.white,
                      child: InkWell(
                        onTap: onClockOut,
                        child: SizedBox(
                          height: 42,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Clock Out',
                                style: textRegularSemiBold.copyWith(
                                  color: onClockOut != null
                                      ? AppColor.primary
                                      : AppColor.grey,
                                ),
                              ),
                              Image.asset(
                                'assets/icons/ic-clockout.png',
                                width: 20,
                                color: onClockOut != null
                                    ? AppColor.primary
                                    : AppColor.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

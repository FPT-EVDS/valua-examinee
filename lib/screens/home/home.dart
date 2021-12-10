import 'package:community_material_icon/community_material_icon.dart';
import 'package:evds_examinee/routes/app_pages.dart';
import 'package:evds_examinee/widgets/shift_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Your next shift",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "View detail",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            ShiftCard(
              thumbnail: SvgPicture.asset(
                'assets/images/schedule.svg',
                semanticsLabel: "Schedule illustration",
                height: 100,
              ),
              beginTime: DateTime.now(),
              endTime:
                  DateTime.now().add(const Duration(hours: 1, minutes: 30)),
              date: DateTime.now(),
              location: "Phòng 101",
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "Information access",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            GridView.count(
              crossAxisCount: 2,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              children: [
                Card(
                  elevation: 2,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {
                      Get.toNamed(AppRoutes.shift);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CommunityMaterialIcons.calendar_month,
                          size: 70,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Schedule",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CommunityMaterialIcons.alarm_light,
                          size: 70,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Violation",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: InkWell(
                    splashColor: Colors.blue.withAlpha(30),
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          CommunityMaterialIcons.file_document,
                          size: 70,
                          color: Theme.of(context).primaryColor,
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Feedbacks",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

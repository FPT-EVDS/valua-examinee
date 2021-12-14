import 'package:evds_examinee/models/detail_shift.dart';
import 'package:evds_examinee/screens/detail_shift/detail_shift_controller.dart';
import 'package:evds_examinee/widgets/avatar_with_title.dart';
import 'package:evds_examinee/widgets/rich_text_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailShiftScreen extends StatelessWidget {
  const DetailShiftScreen({Key? key}) : super(key: key);
  static const itemLength = 10;

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<DetailShiftController>();
    final _timeFormat = DateFormat("HH:mm");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(
          () => Text(
            _controller.appBarTitle.value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Obx(
              () => FutureBuilder(
                future: _controller.shiftDetail.value,
                builder:
                    ((BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    DetailShift detailShift = snapshot.data;
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichTextItem(
                                title: "Date: ",
                                content: DateFormat("dd/MM/yyyy")
                                    .format(detailShift.shift.beginTime)),
                            RichTextItem(
                                title: "Time: ",
                                content:
                                    "${_timeFormat.format(detailShift.shift.beginTime)} - ${_timeFormat.format(detailShift.shift.finishTime)}"),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichTextItem(
                                title: "Subject: ",
                                content: detailShift.subject.subjectCode),
                            RichTextItem(
                                title: "Room: ",
                                content: detailShift.room.roomName),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Assigned staff",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(detailShift.staff.imageUrl),
                          ),
                          title: Text(detailShift.staff.fullName),
                          subtitle: Text(detailShift.staff.companyId),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              "Examinees list",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: detailShift.examSeats.length,
                          itemBuilder: (context, index) {
                            final examinee =
                                detailShift.examSeats[index].examinee;
                            return ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundImage:
                                    NetworkImage(examinee.imageUrl),
                              ),
                              title: Text(examinee.fullName),
                              subtitle: Text(examinee.companyId),
                              trailing: Text(
                                  "Pos ${detailShift.examSeats[index].position}"),
                            );
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        snapshot.error.toString(),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

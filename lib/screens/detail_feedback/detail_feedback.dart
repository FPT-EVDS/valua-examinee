import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/feedback_detail.dart';
import 'package:evds_examinee/routes/app_pages.dart';
import 'package:evds_examinee/screens/detail_feedback/detail_feedback_controller.dart';
import 'package:evds_examinee/widgets/round_button.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailFeedbackScreen extends StatelessWidget {
  const DetailFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat _dateFormat = DateFormat("dd/MM/yyyy HH:mm");
    final _controller = Get.find<DetailFeedbackController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(() => Text(_controller.appBarTitle.value)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: SingleChildScrollView(
            child: FutureBuilder(
              future: _controller.feedback.value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  FeedbackDetail feedback = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: feedback.violation.thumbnailUrl.toString(),
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: TextEditingController(
                            text: feedback
                                .violation.evidence.examRoom.examRoomName),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Exam room name",
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller:
                            TextEditingController(text: feedback.content),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Description",
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: TextEditingController(
                          text: _dateFormat.format(feedback.createdDate),
                        ),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Submitted at",
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        controller: TextEditingController(
                          text: feedback
                              .violation.evidence.examRoom.room.roomName,
                        ),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Room",
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 30),
                      TextField(
                        style: TextStyle(
                            color: _generateColor(context, feedback.status)),
                        controller: TextEditingController(
                            text: _generateStatusText(feedback.status)),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Status",
                        ),
                        maxLines: null,
                      ),
                      const SizedBox(height: 30),
                      feedback.reply != null
                          ? Column(
                              children: [
                                TextField(
                                  controller: TextEditingController(
                                    text: feedback.reply,
                                  ),
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    labelText: "Process note",
                                  ),
                                  maxLines: null,
                                ),
                                const SizedBox(height: 30),
                                TextField(
                                  controller: TextEditingController(
                                    text: _dateFormat
                                        .format(feedback.lastModifiedDate),
                                  ),
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    labelText: "Process at",
                                  ),
                                  maxLines: null,
                                ),
                              ],
                            )
                          : Container(),
                    ],
                  );
                } else if (snapshot.hasError) {
                  Future.delayed(
                    Duration.zero,
                    () => CoolAlert.show(
                      context: context,
                      type: CoolAlertType.error,
                      title: "Can't load data",
                    ),
                  );
                  return Center(
                    child: Text(
                      snapshot.error.toString(),
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(18),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: RoundButton(
            onPressed: () {
              Get.toNamed(AppRoutes.detailViolation, arguments: {
                "id": _controller.violationId.value,
              });
            },
            label: "View violation detail",
          ),
        ),
      ),
    );
  }

  Color? _generateColor(BuildContext context, FeedbackStatus status) {
    switch (status) {
      case FeedbackStatus.resolved:
        return Colors.green.shade700;
      case FeedbackStatus.pending:
        return Colors.amber.shade700;
      case FeedbackStatus.inactive:
        return Colors.grey.shade700;
      default:
        return Theme.of(context).primaryColor;
    }
  }

  String _generateStatusText(FeedbackStatus status) {
    switch (status) {
      case FeedbackStatus.resolved:
        return "Resolved";
      case FeedbackStatus.pending:
        return "Pending";
      case FeedbackStatus.inactive:
        return "Inactive";
      default:
        return "";
    }
  }
}

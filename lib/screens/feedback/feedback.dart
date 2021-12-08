import 'package:community_material_icon/community_material_icon.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/feedback_list.dart';
import 'package:evds_examinee/routes/app_pages.dart';
import 'package:evds_examinee/screens/feedback/feedback_controller.dart';
import 'package:evds_examinee/widgets/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FeedbackController _controller = Get.find<FeedbackController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("My feedbacks"),
        centerTitle: true,
      ),
      // FIXME: haven't paging yet
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
          child: Obx(
            () => FutureBuilder(
              future: _controller.feedbackList.value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  FeedbackList data = snapshot.data;
                  return RefreshIndicator(
                    onRefresh: _controller.getOwnFeedbacks,
                    child: data.totalItems > 0
                        ? ListView.separated(
                            itemBuilder: (context, index) => ListTile(
                              onTap: () {
                                Get.toNamed(AppRoutes.detailFeedback,
                                    arguments: {
                                      "id": data.feedbacks[index].feedbackId,
                                    });
                              },
                              leading: CircleAvatar(
                                backgroundColor: _generateBackgroundColor(
                                    context, data.feedbacks[index].status),
                                foregroundColor: Colors.white,
                                child: const Icon(
                                    CommunityMaterialIcons.file_document),
                              ),
                              title: Text(
                                  data.feedbacks[index].violation.evidence
                                      .examRoom.examRoomName,
                                  overflow: TextOverflow.ellipsis),
                              subtitle: Text(DateFormat('dd/MM/yyyy HH:mm')
                                  .format(
                                      data.feedbacks[index].lastModifiedDate)),
                              trailing: Text(
                                _generateStatusText(
                                    data.feedbacks[index].status),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                            itemCount: data.feedbacks.length,
                          )
                        : const NoData(),
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
    );
  }

  Color? _generateBackgroundColor(BuildContext context, FeedbackStatus status) {
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

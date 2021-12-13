import 'package:cool_alert/cool_alert.dart';
import 'package:evds_examinee/enums/feedback_status.dart';
import 'package:evds_examinee/models/feedback.dart';
import 'package:evds_examinee/screens/detail_feedback/detail_feedback_controller.dart';
import 'package:flutter/material.dart' hide Feedback;
import 'package:get/get.dart';

class DetailFeedbackScreen extends StatelessWidget {
  const DetailFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<DetailFeedbackController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Feedback detail"),
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
                  Feedback feedback = snapshot.data;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      TextField(
                        controller: TextEditingController(
                          text: feedback.reply ?? 'N/A',
                        ),
                        readOnly: true,
                        decoration: const InputDecoration(
                          labelText: "Process note",
                        ),
                        maxLines: null,
                      ),
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

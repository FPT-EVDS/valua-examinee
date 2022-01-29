import 'package:cool_alert/cool_alert.dart';
import 'package:evds_examinee/models/violation_detail.dart';
import 'package:evds_examinee/screens/detail_violation/detail_violation_controller.dart';
import 'package:evds_examinee/widgets/carousel_item.dart';
import 'package:evds_examinee/widgets/carousel_with_indicator.dart';
import 'package:evds_examinee/widgets/rich_text_item.dart';
import 'package:evds_examinee/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailViolationScreen extends StatelessWidget {
  const DetailViolationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<DetailViolationController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Violation detail"),
        centerTitle: true,
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: RoundButton(
          onPressed: () {
            _showModalBottomForm(context);
          },
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          label: "Feedback violation",
          height: 48,
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) => SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Obx(
                  () => FutureBuilder(
                    future: _controller.violation.value,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        ViolationDetail data = snapshot.data;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CarouselWithIndicator(
                                itemList: data.evidence.evidenceImages
                                    .map(
                                      (e) => CarouselItem(
                                        id: e.evidenceImageId,
                                        resource: e.imageUrl,
                                        title: DateFormat("dd/MM/yyyy HH:mm:ss")
                                            .format(e.recordedAt),
                                      ),
                                    )
                                    .toList()),
                            const SizedBox(height: 20),
                            RichTextItem(
                              title: "Created at: ",
                              content: DateFormat("dd/MM/yyyy HH:mm")
                                  .format(data.createdDate),
                            ),
                            const SizedBox(height: 20),
                            RichTextItem(
                              title: "Subject: ",
                              content:
                                  "${data.evidence.examRoom.subject.subjectCode} - ${data.evidence.examRoom.subject.subjectName}",
                            ),
                            const SizedBox(height: 20),
                            RichTextItem(
                              title: "Room: ",
                              content: data.evidence.examRoom.room.roomName,
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Reported by",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                  data.evidence.staff.imageUrl,
                                ),
                              ),
                              title: Text(
                                data.evidence.staff.companyId,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500),
                              ),
                              subtitle: Text(
                                data.evidence.staff.fullName,
                                style: TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                            const SizedBox(height: 5),
                            const Text(
                              "Description",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextField(
                              readOnly: true,
                              controller:
                                  TextEditingController(text: data.description),
                              minLines: 4,
                              maxLines: 10,
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
          ),
        ),
      ),
    );
  }

  _showModalBottomForm(BuildContext context) {
    final _controller = Get.find<DetailViolationController>();
    return showModalBottomSheet(
      context: context,
      elevation: 2,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _controller.formKey,
          child: Column(
            children: [
              const Text(
                "Report violation",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: TextFormField(
                  controller: _controller.contentController,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null,
                  expands: true,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: "Description",
                  ),
                  validator: MultiValidator([
                    MinLengthValidator(8, errorText: "Min length is 8"),
                    RequiredValidator(errorText: "Description is required"),
                  ]),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => RoundButton(
                  onPressed: () {
                    _controller.submitFeedback(context);
                  },
                  isLoading: _controller.isLoading.value,
                  width: double.infinity,
                  color: Theme.of(context).primaryColor,
                  label: "Submit",
                  height: 48,
                ),
              )
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

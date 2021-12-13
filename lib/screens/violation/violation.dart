import 'package:cool_alert/cool_alert.dart';
import 'package:evds_examinee/models/violation_list.dart';
import 'package:evds_examinee/screens/violation/violation_controller.dart';
import 'package:evds_examinee/widgets/no_data.dart';
import 'package:evds_examinee/widgets/violation_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViolationScreen extends StatelessWidget {
  const ViolationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.find<ViolationController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Violation"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 20),
          child: Obx(
            () => FutureBuilder(
              future: _controller.violationList.value,
              builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                if (snapshot.hasData) {
                  ViolationList data = snapshot.data;
                  return RefreshIndicator(
                    onRefresh: _controller.getOwnViolation,
                    child: data.totalItems > 0
                        ? ListView.separated(
                            itemBuilder: (context, index) => ViolationCard(
                              onTap: () {},
                              violation: data.violations[index],
                            ),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 15),
                            itemCount: data.violations.length,
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
}

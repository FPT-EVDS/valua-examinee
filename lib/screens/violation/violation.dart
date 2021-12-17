import 'package:dropdown_search/dropdown_search.dart';
import 'package:evds_examinee/models/semester.dart';
import 'package:evds_examinee/models/violation_list.dart';
import 'package:evds_examinee/routes/app_pages.dart';
import 'package:evds_examinee/screens/violation/violation_controller.dart';
import 'package:evds_examinee/widgets/no_data.dart';
import 'package:evds_examinee/widgets/violation_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FutureBuilder(
                  future: _controller.getListSemesters(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        width: 300,
                        child: DropdownSearch<Semester>(
                          mode: Mode.DIALOG,
                          popupTitle: const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              "Choose semester",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          showSelectedItems: true,
                          itemAsString: (item) => item!.semesterName,
                          compareFn: (item, selectedItem) =>
                              item!.semesterId == selectedItem!.semesterId,
                          items: snapshot.data,
                          dropdownSearchDecoration: const InputDecoration(
                            labelText: "Semester",
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0,
                              vertical: 4.0,
                            ),
                          ),
                          onChanged: _controller.handleChangeSemester,
                          selectedItem: _controller.currentSemester?.value ??
                              snapshot.data[0],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return const Center(
                        child: Text("Can't load data"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () => FutureBuilder(
                    future: _controller.violationList.value,
                    builder: (BuildContext context,
                        AsyncSnapshot<dynamic> snapshot) {
                      if (snapshot.hasData) {
                        ViolationList data = snapshot.data;
                        return RefreshIndicator(
                          onRefresh: _controller.getOwnViolation,
                          child: data.totalItems > 0
                              ? ListView.separated(
                                  itemBuilder: (context, index) =>
                                      ViolationCard(
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoutes.detailViolation,
                                        arguments: {
                                          "id": data
                                              .violations[index].violationId,
                                        },
                                      );
                                    },
                                    violation: data.violations[index],
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(height: 15),
                                  itemCount: data.violations.length,
                                )
                              : const NoData(),
                        );
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/no_data.svg",
                              height: 180,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              "No violations found",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

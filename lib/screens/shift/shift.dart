import 'package:community_material_icon/community_material_icon.dart';
import 'package:evds_examinee/models/assigned_shift.dart';
import 'package:evds_examinee/routes/app_pages.dart';
import 'package:evds_examinee/screens/shift/shift_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class ShiftScreen extends StatelessWidget {
  const ShiftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateFormat _timeFormat = DateFormat("HH:mm");
    final _controller = Get.find<ShiftController>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("Assigned shift"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(CommunityMaterialIcons.calendar),
            tooltip: 'Choose date',
            onPressed: () {
              _controller.handleDatePicker(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Obx(
              () => TableCalendar(
                focusedDay: _controller.currentFocusedDay.value,
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.now().add(const Duration(days: 365)),
                calendarFormat: _controller.calendarFormat,
                availableCalendarFormats: const {CalendarFormat.week: 'Week'},
                headerVisible: false,
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: _controller.handleSelectDate,
                selectedDayPredicate: _controller.selectedDatePredicate,
                onPageChanged: _controller.handleChangePage,
                calendarStyle: CalendarStyle(
                  defaultDecoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  weekendDecoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.7),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(
                () => FutureBuilder(
                  future: _controller.assignedShiftList.value,
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      AssignedShift data = snapshot.data;
                      final assignShiftDetail =
                          data.assignedShifts.assignedShift[data.selectedDate];
                      if (assignShiftDetail == null) {
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/no_shift.svg",
                                height: 180,
                              ),
                              const SizedBox(height: 15),
                              Text(
                                "No shift assigned",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                      return ListView.builder(
                          itemCount: data.totalItems,
                          itemBuilder: (context, index) {
                            return Card(
                              elevation: 2,
                              margin: const EdgeInsets.symmetric(
                                vertical: 8.0,
                                horizontal: 4.0,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Get.toNamed(AppRoutes.detailShift);
                                },
                                title: Text(
                                  "${_timeFormat.format(assignShiftDetail[index].shift.beginTime)} - ${_timeFormat.format(assignShiftDetail[index].shift.finishTime)}",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "${assignShiftDetail[index].examRoomName} - Room: ${assignShiftDetail[index].room.roomName}",
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.chevron_right,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              "assets/images/no_shift.svg",
                              height: 180,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              snapshot.error.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade700,
                              ),
                            ),
                          ],
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
          ],
        ),
      ),
    );
  }
}

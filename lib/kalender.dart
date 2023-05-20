import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timer_builder/timer_builder.dart';

class LiveCalendarMenu extends StatefulWidget {
  @override
  _LiveCalendarMenuState createState() => _LiveCalendarMenuState();
}

class _LiveCalendarMenuState extends State<LiveCalendarMenu> {
  
  DateTime _dateTime = DateTime.now();
  String dropdownvalue = 'WIT';

  // List of items in our dropdown menu
  var items = ['WIT', 'WITA', 'WIB'];
  @override
  void _onDaySelected(DateTime day, DateTime focusDay) {
    setState(() {
      _dateTime = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text('Live Calendar Menu'),
          ),
          body: ListView(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 400,
                      height: 100,
                      child: Text(
                        DateFormat.yMMMEd().format(_dateTime),
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                    Container(
                      color: Colors.lightGreen,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TimerBuilder.periodic(Duration(seconds: 1),
                              builder: (context) {
                            _dateTime = DateTime.now().toUtc();
                            return Text(
                              (dropdownvalue == 'WIT')
                                  ? DateFormat('HH:mm:ss').format(_dateTime.add(Duration(hours: 9)))
                                  : (dropdownvalue == 'WIB')
                                      ? DateFormat('HH:mm:ss ').format(_dateTime
                                          .add(Duration(hours: 7)))
                                      : DateFormat('HH:mm:ss ').format(_dateTime
                                          .add(Duration(hours: 8))),
                              style:
                                  TextStyle(fontSize: 24, color: Colors.white),
                            );
                          }),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            child: DropdownButton(
                              dropdownColor: Colors.lightGreen,
                              iconEnabledColor: Colors.white,
                              // Initial Value
                              value: dropdownvalue,
                              borderRadius: BorderRadius.circular(20),
                              // Down Arrow Icon
                              icon: const Icon(Icons.keyboard_arrow_down),
                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(
                                    items,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    kalender(),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  Widget kalender() {
    return Column(
      children: [
        Container(
          height: 400,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TableCalendar(
            headerStyle:
                HeaderStyle(formatButtonVisible: false, titleCentered: true),
            calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration:
                    BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
                selectedTextStyle: TextStyle(color: Colors.white)),
            selectedDayPredicate: (DateTime date) {
              return isSameDay(_dateTime, date);
            },
            focusedDay: _dateTime,
            firstDay: DateTime.utc(2002, 01, 01),
            lastDay: DateTime.utc(2050, 12, 12),
            availableGestures: AvailableGestures.all,
            rowHeight: 43,
            onDaySelected: _onDaySelected,
          ),
        )
      ],
    );
  }
}

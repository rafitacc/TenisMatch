// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:tenis_match/src/providers/crud_file.dart';
import 'package:tenis_match/src/screens/calendar/blocs.dart';
import 'package:tenis_match/src/screens/calendar/view.dart';
import 'package:tenis_match/src/screens/home/widgets/card_reservation.dart';
import 'package:tenis_match/src/screens/home/widgets/swipe.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    readListCreatePreferens();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TENIS-MATCH',
          style: Get.theme.textTheme.titleLarge!.copyWith(color: Colors.white),
        ),
      ),
      body: _body(context),
      floatingActionButton: FloatingActionButton(
        heroTag: 'calendar',
        onPressed: () => Get.to(() => Calendarview()),
        child: const Icon(Icons.calendar_month),
      ),
    );
  }

  _body(context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const SwipePublicity(),
        const SizedBox(height: 10),
        Expanded(child: _listCardReservation()),
      ],
    );
  }

  _listCardReservation() {
    return BlocBuilder<ListReservationCubit, List<String>>(
        builder: (context, state) {
      return state.isEmpty
          ? Center(
              child: Text(
              'No hay canchas reservadas.',
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.titleMedium!.copyWith(),
            ))
          : ListView.builder(
              shrinkWrap: true,
              itemCount: state.length,
              padding: const EdgeInsets.only(bottom: 100),
              itemBuilder: (BuildContext context, int index) {
                return CardReservation(listValue: state, index: index);
              },
            );
    });
  }
}

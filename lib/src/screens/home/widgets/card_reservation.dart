import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tenis_match/src/models/calendar_model.dart';
import 'package:tenis_match/src/providers/crud_file.dart';

class CardReservation extends StatelessWidget {
  const CardReservation({
    super.key,
    required this.listValue,
    required this.index,
  });

  final List<String> listValue;
  final int index;

  @override
  Widget build(BuildContext context) {
    return _loadBody();
  }

  _loadBody() {
    return FutureBuilder(
      future: readCreateLocale(name: listValue[index]),
      builder: (BuildContext context, AsyncSnapshot<CalendarModel> snapshot) {
        if (snapshot.hasData) {
          final CalendarModel calendar = snapshot.data!;
          return _body(calendar);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _body(CalendarModel calendar) {
    return Card(
      color: Colors.white,
      child: ListTile(
          contentPadding: const EdgeInsets.only(left: 10),
          title: Column(
            children: [
              Row(
                children: [
                  const Icon(Icons.border_all),
                  const SizedBox(width: 8),
                  Text(
                    'Cancha: ',
                    style: Get.theme.textTheme.titleMedium!.copyWith(),
                  ),
                  Text(
                    calendar.court,
                    style: Get.theme.textTheme.titleLarge!.copyWith(),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 8),
                  Text(
                    calendar.nameUser,
                    style: Get.theme.textTheme.titleMedium!.copyWith(),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 8),
                  Text(
                    calendar.date,
                    style: Get.theme.textTheme.bodyLarge!.copyWith(),
                  ),
                ],
              ),
              calendar.rainPercentage != ''
                  ? Row(
                      children: [
                        const Icon(Icons.cloud),
                        const SizedBox(width: 8),
                        Text(
                          'porcetanje de lluvia: ${calendar.rainPercentage}%',
                          style: Get.theme.textTheme.bodyLarge!.copyWith(),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ],
          ),
          trailing: IconButton(
            onPressed: () {
              deleteCard(
                  name:
                      '${calendar.nameUser}#${calendar.date}#${calendar.court}');
            },
            icon: const Icon(Icons.delete),
          )),
    );
  }
}

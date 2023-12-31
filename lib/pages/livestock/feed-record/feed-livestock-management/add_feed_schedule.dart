import 'package:flutter/material.dart';
import 'package:fms/controller/model/feed_schedule_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/repository/livestock_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class AddFeedingSchedule extends StatefulWidget {
  const AddFeedingSchedule({super.key});

  @override
  State<AddFeedingSchedule> createState() => _AddFeedingScheduleState();
}

class _AddFeedingScheduleState extends State<AddFeedingSchedule> {
  final livestockid = TextEditingController();
  final livestocktype = TextEditingController();
  final feedname = TextEditingController();
  final feedtype = TextEditingController();
  final feedquantity = TextEditingController();
  final feedingmethod = TextEditingController();
  TimeOfDay? feedingintervalfrom;
  TimeOfDay? feedingintervalto;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
         leading: IconButton(onPressed: (){
          context.go('/feed-schedule-information');
        }, icon:const Icon(Icons.arrow_back, color: white,)),
        backgroundColor: green,
        title: const Text("Schedule feeding"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: livestockid,
                  labelText: "Livestock id",
                  valitationText: "Livestock id is required"),
              FeedFormField(
                  controller: livestocktype,
                  labelText: "Livestock type",
                  valitationText: "Livestock type is required"),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    setState(() {
                      feedingintervalfrom = picked ?? TimeOfDay.now();
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feeding from',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (feedingintervalfrom == null) {
                      return 'Please select time from';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: feedingintervalfrom != null
                        ? DateFormat("h:mm a").format(DateTime(
                            2023,
                            1,
                            1,
                            feedingintervalfrom!.hour,
                            feedingintervalfrom!.minute))
                        : '',
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: TextFormField(
                  onTap: () async {
                    final TimeOfDay? picked = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now()
                          .replacing(hour: TimeOfDay.now().hour + 1),
                    );
                    setState(() {
                      feedingintervalto = picked ?? TimeOfDay.now();
                    });
                  },
                  readOnly: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Feeding to',
                  ),
                  validator: (value) {
                    // ignore: unnecessary_null_comparison
                    if (feedingintervalto == null) {
                      return 'Please select time to ';
                    }
                    return null;
                  },
                  controller: TextEditingController(
                    // ignore: unnecessary_null_comparison
                    text: feedingintervalto != null
                        ? DateFormat("h:mm a").format(DateTime(2023, 1, 1,
                            feedingintervalto!.hour, feedingintervalto!.minute))
                        : '',
                  ),
                ),
              ),
              FeedFormField(
                  controller: feedname,
                  labelText: "Feed name",
                  valitationText: "Feed name is required"),
              FeedFormField(
                  controller: feedtype,
                  labelText: "Feed type",
                  valitationText: "Feed type is required"),
              FeedFormField(
                  controller: feedquantity,
                  labelText: "Feed quantity",
                  valitationText: "Feed quantity is required"),
              FeedFormField(
                  controller: feedingmethod,
                  labelText: "Feeding method",
                  valitationText: "Feeding method is required"),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(green)),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            LivestockRepostory()
                                .addFeedSchedule(FeedScheduleModel(
                                  feedingmethod: feedingmethod.text,
                                        livestockid: livestockid.text,
                                        livestocktype: livestocktype.text,
                                        feedingintervalfrom: DateTime(
                                            2023,
                                            1,
                                            1,
                                            feedingintervalfrom!.hour,
                                            feedingintervalfrom!.minute),
                                        feedingintervalto: DateTime(
                                            2023,
                                            1,
                                            1,
                                            feedingintervalto!.hour,
                                            feedingintervalto!.minute),
                                        feedname: feedname.text,
                                        feedtype: feedtype.text,
                                        feedquantity:
                                            double.parse(feedquantity.text))
                                    .toJson())
                                .then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text(
                                            "Schedule added successfully"))))
                                .then((value) => context.go('/feed-schedule-information'));
                          }
                        },
                        child: const Text("Add Schedule")),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

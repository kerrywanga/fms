import 'package:flutter/material.dart';
import 'package:fms/controller/model/equipment_model.dart';
import 'package:fms/dammies/constants.dart';
import 'package:fms/pages/inventories/equipment/equipment_inventories_information.dart';
import 'package:fms/repository/inventory_repository.dart';
import 'package:fms/widgets/feed_widgets/custom_form_field.dart';

class AddEquipmentInventoryInformation extends StatefulWidget {
  const AddEquipmentInventoryInformation({super.key});

  @override
  State<AddEquipmentInventoryInformation> createState() => _AddEquipmentInventoryInformationState();
}

class _AddEquipmentInventoryInformationState extends State<AddEquipmentInventoryInformation> {
  final serialnumber = TextEditingController();
  final name = TextEditingController();
  final type = TextEditingController();
  final description = TextEditingController();
  final manufacturer = TextEditingController();
  final model = TextEditingController();
  final yearOfManufacture = TextEditingController();
  final price = TextEditingController();
  final purchasedate = TextEditingController();
  final maintenanceschedule = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: blueGrey,
        title: const Text("Add Equipment inventory information"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              FeedFormField(
                  controller: serialnumber,
                  labelText: "Equipment serial number",
                  valitationText: "Equipment serial number is required"),
              FeedFormField(
                  controller: name,
                  labelText: "Equipment name",
                  valitationText: "Equipment is required"),
              FeedFormField(
                  controller: type,
                  labelText: "Equipment type",
                  valitationText: "Equipment type is required"),
              FeedFormField(
                  controller: description,
                  labelText: "Equipment description",
                  valitationText: "Equipment description is required"),
              FeedFormField(
                  controller: manufacturer,
                  labelText: "Equipment manufacturer",
                  valitationText: "Equipment manufacturer is required"),
              FeedFormField(
                  controller: model,
                  labelText: "Equipment model",
                  valitationText: "Equipment model is required"),
              FeedFormField3(
                  controller: yearOfManufacture,
                  labelText: "Year of manufacture",
                  valitationText: "Year of manufacture is required"),
              FeedFormField(
                  controller: price,
                  labelText: "Price",
                  valitationText: "Price is required"),
              FeedFormField3(
                  controller: purchasedate,
                  labelText: "Purchase date",
                  valitationText: "Purchase date is required"),
              FeedFormField3(
                  controller: maintenanceschedule,
                  labelText: "Maintenance schedule",
                  valitationText: "Maintenance schedule is required"),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: size.width * 0.6,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(blueGrey),
                            padding: const MaterialStatePropertyAll(
                                EdgeInsets.symmetric(horizontal: 30))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            InventoriesRepository().addEquipment(EquipmentEntry(serialNumber: serialnumber.text, name: name.text, type: type.text, description: description.text, manufacturer: manufacturer.text, model: model.text, yearOfManufacture: yearOfManufacture.text, purchasePrice: int.parse(price.text), purchaseDate: purchasedate.text, maintenanceSchedule: maintenanceschedule.text).toJson()).then((value){
                              serialnumber.clear();
                              name.clear();
                              type.clear();
                              description.clear();
                              manufacturer.clear();
                              model.clear();
                              yearOfManufacture.clear();
                              price.clear();
                              purchasedate.clear();
                              maintenanceschedule.clear();
                            }).then((value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                        content: Text("Equipment inven added successfully")))).then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const EquipmentInventoryInformation())));
                          }
                        },
                        child: const Text("Add Equipment")),
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

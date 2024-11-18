import 'package:flutter/material.dart';

import '../../../shared/widgets/category_picker.dart';
import '../../../shared/widgets/datepicker.dart';
import '../../../shared/widgets/dropdown.dart';
import '../../../state_util.dart';
import '../../seat_picker/view/seat_picker_view.dart';
import '../controller/dashboard_controller.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Halo, Bujang",
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Badge(
              label: Text(
                "5",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              child: Icon(Icons.notifications_outlined),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Pesan Tiket Anda Hari Ini",
                style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Theme(
                data: ThemeData.light(),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(15.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(12.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      QCategoryPicker(
                        items: const [
                          {
                            "label": "Sekali jalan",
                            "value": "1",
                          },
                          {
                            "label": "Pulang-pergi",
                            "value": "2",
                          },
                          {
                            "label": "Beberapa Kota",
                            "value": "3",
                          },
                        ],
                        // validator: Validator.required,
                        value: "1",
                        onChanged: (index, label, value, item) {},
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      QDropdownField(
                        label: "Dari",
                        value: "Bekasi",
                        // validator: Validator.required,
                        items: const [
                          {
                            "label": "Bekasi",
                            "value": "Bekasi",
                          },
                          {
                            "label": "Padang",
                            "value": "Padang",
                          }
                        ],
                        onChanged: (value, label) {},
                      ),
                      QDropdownField(
                        label: "Ke",
                        value: "Padang",
                        // validadr: Validadr.required,
                        items: const [
                          {
                            "label": "Bekasi",
                            "value": "Bekasi",
                          },
                          {
                            "label": "Padang",
                            "value": "Padang",
                          }
                        ],
                        onChanged: (value, label) {},
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: QDatePicker(
                              label: "keberangkatan",
                              value: DateTime.now(),
                              // validadr: Validator.required,
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          const Text(
                            "-",
                            style: TextStyle(
                                fontSize: 22.0, color: Colors.orange),
                          ),
                          const SizedBox(
                            width: 20.0,
                          ),
                          Expanded(
                            child: QDatePicker(
                              label: "Kembali",
                              value: DateTime.now(),
                              // validator: Validator.required,
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Penumpang",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Color(0xff393e48),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () => controller.decrementAdult(),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (controller.qtyAdult == 0)
                                        ? const Color(0xffdedede)
                                        : Color.fromARGB(255, 253, 43, 32),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.qtyAdult} Dewasa",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff393e48),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.incrementAdult(),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 20.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              InkWell(
                                onTap: () => controller.decrementChild(),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    right: 20.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: (controller.qtyChild == 0)
                                        ? const Color(0xffdedede)
                                        : Color.fromARGB(255, 253, 43, 32),
                                  ),
                                  child: const Icon(
                                    Icons.remove,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                              Text(
                                "${controller.qtyChild} Anak",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                  color: Color(0xff393e48),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              InkWell(
                                onTap: () => controller.incrementChild(),
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    left: 20.0,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: Colors.orange,
                                  ),
                                  child: const Icon(
                                    Icons.add,
                                    size: 20.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      QDropdownField(
                        label: "Kelas Kereta Api",
                        value: "Eksekutif",
                        // validator: Validator.required,
                        items: const [
                          {
                            "label": "Eksekutif",
                            "value": "Eksekutif",
                          },
                          {
                            "label": "Business",
                            "value": "Business",
                          },
                          {
                            "label": "Ekonomi",
                            "value": "Ekonomi",
                          }
                        ],
                        onChanged: (value, label) {},
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      SizedBox(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () => Get.to(const SeatPickerView()),
                          child: const Text(
                            "Pesan",
                            style: TextStyle(
                              color: Color(0xff383d47),
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}

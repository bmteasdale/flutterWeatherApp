import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {
  var selectedUnits = ''.obs;
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    getSelectedUnits();
  }

  void setSelectedUnits(units) {
    selectedUnits(units);
    storage.write('selectedUnits', units);
  }

  String getSelectedUnits() {
    selectedUnits(storage.read('selectedUnits'));
    return selectedUnits.value;
  }
}

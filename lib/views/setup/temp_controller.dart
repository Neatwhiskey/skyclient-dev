import 'package:get/get.dart';

class TempController extends GetxController {
  var tempList = <String, Temp>{}.obs; // Observable map of Temp objects
  Temp? selectedTemp; // Current selected Temp object


// todo : create a method to add new Temp object to the table
// Method to add a new Temp object
  void addTemp(Temp temp) {
    tempList[temp.tempid] = temp;
    update(); // Notify listeners
  }
// todo : create a method to remove Temp object from the table
// Method to remove a Temp object by ID
  void removeTemp() {
    if (selectedTemp != null) {
      tempList.remove(selectedTemp!.tempid); // Remove the selected Temp object by its ID
      selectedTemp = null; // Clear the selection
      update(); // Update the UI
    }
  }
// todo : create a method to update Temp object in the table
// Method to update an existing Temp object by ID
  void updateTemp(Temp temp) {
    if (selectedTemp != null) {
      tempList[selectedTemp!.tempid] = temp; // Update the selected Temp object
      selectedTemp = temp; // Update the selection
      update(); // Update the UI
    }
  }
// todo : create a method to get the current selected Temp object
// Method to get the currently selected Temp object
  Temp? getSelectedTemp() {
    return selectedTemp; // Return the current selected Temp object
  }
// todo : create a method to set the current selected Temp object
// Method to set the currently selected Temp object by ID
  void setSelectedTemp(Temp temp) {
    selectedTemp = temp; // Set the current selected Temp object
    update(); // Update the UI
  }
}


class Temp {
  String tempid = "";
  String name = "";
  int level = 0;
  double amount = 0.0;
}


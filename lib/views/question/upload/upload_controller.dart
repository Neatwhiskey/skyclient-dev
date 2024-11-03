import 'package:get/get.dart';

class UploadController extends GetxController {
  RxString question = "".obs;
  String optionA = "";
  String optionB = "";
  String optionC = "";
  String optionD = "";

  void changeQuestion(String val) {
    question.value = val;
  }

  void changeOptionA(String val) {
    optionA = val;
  }

  void changeOptionB(String val) {
    optionB = val;
  }

  void changeOptionC(String val) {
    optionC = val;
  }

  void changeOptionD(String val) {
    optionD = val;
  }
}

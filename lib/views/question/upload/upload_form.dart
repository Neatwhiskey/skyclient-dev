import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyclient/global/form.dart';
import 'package:skyclient/global/styles.dart';
import 'package:skyclient/global/util.dart';
import 'package:skyclient/main.dart';
import 'package:skyclient/views/question/upload/upload_controller.dart';

class UploadForm extends GetView<UploadController> {
  const UploadForm({super.key});

  @override
  Widget build(BuildContext context) {
    fToast.init(context);

    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 50, child: FilterForm()),
          Expanded(flex: 3, child: ViewForm()),
          InputForm(),
        ],
      )),
    );
  }
}

class FilterForm extends GetView<UploadController> {
  const FilterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: FormRow(
                label: "Subject",
                value: "",
                editing: true,
              ),
            )
          ],
        ));
  }
}

class ViewForm extends GetView<UploadController> {
  const ViewForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade200, width: 2),
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: SingleChildScrollView(
                child: GetX<UploadController>(
                  builder: (controller) => FormattedQuestionText(
                    text: controller.question.value,
                    // questionStyle: questionStyle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InputForm extends GetView<UploadController> {
  const InputForm({super.key});
  static TextEditingController questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 100,
                  child: Column(children: [
                    ElevatedButton(onPressed: () {}, child: Text("Question")),
                    ElevatedButton(onPressed: () {}, child: Text("Option A")),
                    ElevatedButton(onPressed: () {}, child: Text("Option B")),
                    ElevatedButton(onPressed: () {}, child: Text("Option C")),
                    ElevatedButton(onPressed: () {}, child: Text("Option D")),
                  ])),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(bottom: 8, right: 8),
                  child: TextFormField(
                    maxLines: 5,
                    controller: questionController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      focusColor: Colors.grey,
                      labelText: "Question",
                      fillColor: Colors.white,
                    ),
                    onChanged: (value) {
                      controller.changeQuestion(value);
                    },
                  ),
                ),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        questionController.text =
                            "${questionController.text} <latex>equation</latex>";
                        controller.changeQuestion(questionController.text);

                        // questionController.text + '<latex>E = mc^2</latex>';
                      },
                      child: const Text('LaTeX'),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        questionController.text =
                            "${questionController.text} <latexb>equation</latexb>";
                        controller.changeQuestion(questionController.text);
                      },
                      child: const Text('LaTeX Block'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const TextStyle formLabelTextStyle = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.w100,
);
const TextStyle formValueTextStyle =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w600);

class InputField extends StatelessWidget {
  final String labelText;
  void Function(String text) valueSetter;
  void Function(String text)? onFieldSubmitted;
  bool readOnly;
  bool enabled;
  TextEditingController? controller;
  String? initialValue;
  InputField(
      {super.key,
      required this.labelText,
      required this.valueSetter,
      this.readOnly = false,
      this.enabled = true,
      this.controller,
      this.initialValue,
      onFieldSubmitted});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
          fillColor: Colors.white),
      onSaved: (newValue) => valueSetter(newValue!),
      validator: (value) {
        return (value == null ? "Value cannot be null" : null);
      },
      readOnly: readOnly,
      enabled: enabled,
      initialValue: initialValue,
      onFieldSubmitted: (value) =>
          {if (onFieldSubmitted == null) {} else onFieldSubmitted!(value)},
    );
  }
}

class PasswordField extends StatelessWidget {
  final String labelText;
  final void Function(String text) valueSetter;
  String? initialValue;
  PasswordField(
      {super.key,
      required this.labelText,
      required this.valueSetter,
      this.initialValue});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      obscureText: true,
      enableSuggestions: false,
      autocorrect: false,
      onSaved: (newValue) => valueSetter(newValue!),
      validator: (value) {
        return (value == null ? "Value cannot be null" : null);
      },
      initialValue: initialValue,
    );
  }
}

class NumberField extends StatelessWidget {
  final String labelText;
  final void Function(String text) valueSetter;
  final String initialValue;
  const NumberField(
      {super.key,
      required this.labelText,
      required this.valueSetter,
      this.initialValue = ""});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: const OutlineInputBorder(), labelText: labelText),
      keyboardType: TextInputType.number,
      initialValue: initialValue,
      onSaved: (newValue) => valueSetter(newValue!),
    );
  }
}

class FormRow extends ConsumerWidget {
  bool editing = false;
  bool editable;
  bool viewable;
  String label;
  String value;
  bool boolvalue;
  void Function(String text)? valueSetter;
  Widget? editWidget;
  String type = "String";
  double widgetHeight = 45;
  int labelFlex = 8;
  // ChangeNotifierProvider? provider;
  // WidgetRef? reff;

  FormRow(
      {required this.label,
      required this.value,
      this.editing = false,
      this.viewable = true,
      this.editable = true,
      this.boolvalue = true,
      this.labelFlex = 8,
      this.editWidget,
      this.valueSetter,
      super.key});

  FormRow.bool(
      {required this.label,
      this.value = "",
      this.editing = false,
      this.viewable = true,
      this.editable = true,
      this.labelFlex = 8,
      required this.boolvalue,
      this.editWidget,
      required this.valueSetter,
      super.key}) {
    type = "bool";
  }

  FormRow.password(
      {required this.label,
      this.value = "",
      this.editing = false,
      this.viewable = true,
      this.editable = true,
      this.boolvalue = true,
      this.labelFlex = 8,
      this.editWidget,
      required this.valueSetter,
      super.key}) {
    type = "password";
  }

  FormRow.custom(
      {required this.label,
      this.value = "",
      this.editing = false,
      this.viewable = true,
      this.editable = true,
      this.boolvalue = true,
      this.labelFlex = 8,
      this.widgetHeight = 45,
      required this.editWidget,
      this.valueSetter,
      // this.provider,
      // this.reff,
      super.key}) {
    type = "custom";
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // if (reff != null) ref = reff!;
    // var controller = ref.watch(provider);
    switch (type) {
      case "String":
        editWidget = InputField(
          labelText: "",
          initialValue: value,
          valueSetter: valueSetter ?? (val) {},
        );
      case "password":
        editWidget = PasswordField(
          labelText: "",
          initialValue: value,
          valueSetter: valueSetter ?? (val) {},
        );
      case "bool":
        // ref = reff!;
        editWidget = GestureDetector(
          onTap: () {
            // boolvalue = !boolvalue;
            valueSetter!(boolvalue ? "YES" : "NO");
          },
          child: Container(
            decoration: BoxDecoration(
              color: boolvalue ? Colors.blue : Colors.grey.shade300,
            ),
            child: Center(
              child: Text(
                boolvalue ? "YES" : "NO",
                style: TextStyle(
                  color: boolvalue ? Colors.white : Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        );
    }
    return Visibility(
      visible: (!editing && viewable) || (editing),
      child: Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 4),
        child: Row(
          children: [
            Expanded(
                flex: labelFlex,
                child: Text(
                  label,
                  style: formLabelTextStyle,
                )),
            Visibility(
              visible: !editable || (editable && !editing),
              child: Expanded(
                flex: 32,
                child: Text(
                  value,
                  style: formValueTextStyle,
                ),
              ),
            ),
            Visibility(
              visible: editable && editing,
              child: Expanded(
                flex: 32,
                child: SizedBox(height: widgetHeight, child: editWidget),
              ),
            )
          ],
        ),
      ),
    );
  }
}

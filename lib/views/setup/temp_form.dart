import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:skyclient/global/styles.dart';
import 'package:skyclient/views/setup/temp_controller.dart';

class TempForm extends GetView<TempController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController amountController = TextEditingController();

   TempForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 50,
        child: const Center(child: Text("Header")),
      ),
      Expanded(child: TempTable()), // Existing TempTable widget
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ElevatedButton(
            onPressed: () {
              // Create a new Temp object from the input fields
              final newTemp = Temp()
                ..tempid = DateTime.now().toString() // Use timestamp as ID
                ..name = nameController.text
                ..level = int.parse(levelController.text)
                ..amount = double.parse(amountController.text);
              controller.addTemp(newTemp);
              clearFields(); // Clear input fields
            },
            child: const Text("Add"),
          ),
          ElevatedButton(
            onPressed: () {
              Temp? selectedTemp = controller.getSelectedTemp();
              if (selectedTemp != null) {
                // Update selected Temp object
                final updatedTemp = Temp()
                  ..tempid = selectedTemp.tempid // Keep the same ID
                  ..name = nameController.text
                  ..level = int.parse(levelController.text)
                  ..amount = double.parse(amountController.text);
                controller.updateTemp(updatedTemp);
                clearFields(); // Clear input fields
              }
            },
            child: const Text("Update"),
          ),
          ElevatedButton(
            onPressed: () {
              controller.removeTemp(); // Remove selected Temp object
              clearFields(); // Clear input fields
            },
            child: const Text("Remove"),
          ),
        ],
      ),
      Container(
        height: 50,
        child: const Center(child: Text("Footer")),
      ),
    ]);
  }

  void clearFields() {
    nameController.clear();
    levelController.clear();
    amountController.clear();
  }
}




class TempTable extends GetView<TempController> {
  final formKey = GlobalKey<FormState>();

  TempTable({super.key});

  static int selectedRowIdx = -1;
  static PlutoRow? selectedRow;
  static PlutoGridStateManager? stateManager;

  static PlutoGridConfiguration config = PlutoGridConfiguration(
    columnSize: const PlutoGridColumnSizeConfig(
        autoSizeMode: PlutoAutoSizeMode.scale,
        resizeMode: PlutoResizeMode.pushAndPull),
    scrollbar: const PlutoGridScrollbarConfig(
        hoverWidth: 10,
        onlyDraggingThumb: false,
        scrollbarThickness: 8,
        scrollbarThicknessWhileDragging: 10),
    style: PlutoGridStyleConfig(
      evenRowColor: Colors.grey.shade100,
      activatedColor: Colors.cyan.shade100,
      oddRowColor: Colors.white,
      rowHeight: 40,
      enableColumnBorderVertical: false,
      enableCellBorderVertical: false,
    ),
  );

  static List<PlutoColumn> columns = [
    PlutoColumn(
        title: "sid",
        field: "sid",
        type: const PlutoColumnTypeText(),
        hide: true),
    PlutoColumn(
      title: 'S/No',
      field: 'sno',
      type: PlutoColumnType.number(),
      backgroundColor: tableTitleBackgroundColor,
      width: 50,
      minWidth: 50,
      enableContextMenu: false,
      enableColumnDrag: false,
      enableDropToResize: false,
      enableSorting: false,
      enableRowDrag: false,
      footerRenderer: (rendererContext) {
        return PlutoAggregateColumnFooter(
          rendererContext: rendererContext,
          type: PlutoAggregateColumnType.count,
          alignment: Alignment.centerLeft,
          format: "#,###",
          titleSpanBuilder: (text) {
            return [
              TextSpan(text: text, style: tableFooterStyle),
            ];
          },
        );
      },
    ),
    PlutoColumn(
      title: 'Name',
      field: 'name',
      backgroundColor: tableTitleBackgroundColor,
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Level',
      field: 'level',
      backgroundColor: tableTitleBackgroundColor,
      type: PlutoColumnType.text(),
    ),
    PlutoColumn(
      title: 'Amount',
      field: 'amount',
      backgroundColor: tableTitleBackgroundColor,
      type: PlutoColumnType.text(),
    ),
  ];

  void onRowSelected() {
    selectedRow = stateManager!.currentRow;
    if (stateManager!.currentRowIdx != null) {
      selectedRowIdx = selectedRow!.sortIdx;
    }
    // Set the selected Temp object in the controller
    controller.setSelectedTemp(controller.tempList.values.elementAt(selectedRowIdx));
  }

  void setStateManager(PlutoGridStateManager mgr) {
    stateManager = mgr;
    stateManager!.addListener(onRowSelected);
  }

  List<PlutoRow> generateRows() {
    var temps = controller.tempList.values.toList();
    var rows = List.generate(temps.length, (index) {
      Temp temp = temps.elementAt(index);
      return PlutoRow(
        cells: {
          'sid': PlutoCell(value: temp.tempid),
          'sno': PlutoCell(value: index + 1),
          'name': PlutoCell(value: temp.name),
          'level': PlutoCell(value: temp.level),
          'amount': PlutoCell(value: temp.amount),
        },
      );
    });
    log("Generated : ${rows.length} rows");
    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // Automatically rebuild when tempList changes
      return Container(
        decoration:
        BoxDecoration(border: Border.all(color: Colors.grey.shade200)),
        child: PlutoGrid(
          key: UniqueKey(),
          mode: PlutoGridMode.selectWithOneTap,
          columns: columns,
          rows: generateRows(),
          onChanged: (PlutoGridOnChangedEvent event) {
            log("Pluto Grid Changed : $event");
          },
          onLoaded: (PlutoGridOnLoadedEvent event) {
            setStateManager(event.stateManager);
            log("Table Loaded");
          },
          rowColorCallback: (rowColorContext) {
            if (selectedRowIdx != -1) {
              if (selectedRowIdx == rowColorContext.row.sortIdx) {
                return Colors.cyan.shade100;
              }
            }
            return rowColorContext.rowIdx.isEven
                ? Colors.white
                : Colors.grey.shade100;
          },
          configuration: config,
        ),
      );
    });
  }
}
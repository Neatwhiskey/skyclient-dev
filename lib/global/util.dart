import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:latext/latext.dart';
import 'package:skyclient/global/controllers/app_controller.dart';

Widget createToast(String text, IconData icon, Color col) {
  return Container(
    width: AppController.viewConstraints.maxWidth > 600
        ? 600
        : AppController.viewConstraints.maxWidth,
    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25.0),
      color: col,
    ),
    child: WrapSuper(
      // mainAxisSize: MainAxisSize.min,
      alignment: WrapSuperAlignment.center,
      lineSpacing: 10,
      children: [
        Icon(icon),
        const SizedBox(
          width: 12.0,
        ),
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: 3,
        )
      ],
    ),
  );
}

class MessageToast extends StatelessWidget {
  final String text;

  const MessageToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return createToast(text, Icons.check, Colors.grey);
  }
}

class SuccessToast extends StatelessWidget {
  final String text;

  const SuccessToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return createToast(text, Icons.check, Colors.greenAccent);
  }
}

class WarningToast extends StatelessWidget {
  final String text;

  const WarningToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return createToast(text, Icons.warning_rounded, Colors.amberAccent);
  }
}

class ErrorToast extends StatelessWidget {
  final String text;

  const ErrorToast({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return createToast(text, Icons.warning_rounded, Colors.redAccent);
  }
}

class Result {
  int status = 0;
  String msg = "";
  Map<String, dynamic> load = {};
}

Widget getToast(Result res) {
  switch (res.status) {
    case 1:
      return SuccessToast(text: res.msg);
    case 0:
      return WarningToast(text: res.msg);
    case -1:
      return ErrorToast(text: res.msg);
    default:
      return const ErrorToast(text: "Unknown Error");
  }
}

void showSuccessToast(FToast fToast, String msg) {
  // if (defaultTargetPlatform == TargetPlatform.android)
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       gravity: ToastGravity.TOP,
  //       backgroundColor: Colors.greenAccent,
  //       textColor: Colors.black);
  // else
  fToast.showToast(
    child: SuccessToast(text: msg),
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 3),
  );
}

void showWarningToast(FToast fToast, String msg, [int duration = 4]) {
  // if (defaultTargetPlatform == TargetPlatform.android)
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       gravity: ToastGravity.TOP,
  //       backgroundColor: Colors.amberAccent,
  //       textColor: Colors.black);
  // else
  fToast.showToast(
    child: WarningToast(text: msg),
    gravity: ToastGravity.TOP,
    toastDuration: Duration(seconds: duration),
  );
}

void showErrorToast(FToast fToast, String msg) {
  // if (defaultTargetPlatform == TargetPlatform.android)
  //   Fluttertoast.showToast(
  //       msg: msg,
  //       gravity: ToastGravity.TOP,
  //       backgroundColor: Colors.redAccent,
  //       textColor: Colors.black);
  // else
  fToast.showToast(
    child: ErrorToast(text: msg),
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 5),
  );
}

bool isPhone(context) {
  return MediaQuery.of(context).size.width < 600;
}

String createDate(int? ts) {
  if (ts == null) {
    return "";
  } else {
    var format = DateFormat("dd-MMM-yyyy hh:mm:ss a");
    // DateTime now = DateTime.now();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(ts);
    // return now.difference(date).inDays.toString();
    return format.format(date);
  }
}

String createDateFromPattern(int? ts, String pattern) {
  if (ts == null) {
    return "";
  } else {
    var format = DateFormat(pattern);
    // DateTime now = DateTime.now();
    DateTime date = DateTime.fromMillisecondsSinceEpoch(ts);
    // return now.difference(date).inDays.toString();
    return format.format(date);
  }
}

String formatCurrency(double val, [int decimal = 0]) {
  // format: '\u20A6 #,###,###.##',
  return NumberFormat.currency(
    locale: "en_NG",
    decimalDigits: decimal,
    symbol: '\u20A6 ',
  ).format(val);
}

String formatCurrencySymbolless(double val, [int decimal = 0]) {
  // format: '\u20A6 #,###,###.##',
  return NumberFormat.currency(
          locale: "en_NG", decimalDigits: decimal, symbol: "")
      .format(val);
}

String formatItemPrice(String price) {
  if (price.isEmpty) return price;
  String str = "";
  if (price.contains(",")) {
    price.split(",").forEach((part) {
      if (part.contains("=")) {
        double? cur = double.tryParse(part.split("=")[1]);
        if (cur != null) {
          str =
              "$str, ${part.split("=")[0]}=${NumberFormat.currency(decimalDigits: 0, symbol: "").format(cur)}";
        }
      }
    });
  } else {
    if (price.contains("=")) {
      double? cur = double.tryParse(price.split("=")[1]);
      if (cur != null) {
        str =
            "$str,${price.split("=")[0]}=${NumberFormat.currency(decimalDigits: 0, symbol: "").format(cur)}";
      }
    }
  }
  return str.substring(1).trim();
}

bool isValidPhoneNumber(String phoneNumber) {
  final RegExp regex = RegExp(r'^0[789][01]\d{8}$');
  return regex.hasMatch(phoneNumber);
}

bool isValidEmail(String value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return regex.hasMatch(value);
}

class FormattedQuestionText extends StatelessWidget {
  final String text;
  static TextStyle get(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          fontSize: 24,
          height: 1.5,
          color: Theme.of(context).textTheme.bodyLarge!.color,
          fontWeight: FontWeight.w400,
          textBaseline: TextBaseline.alphabetic,
          fontFamily:
              'Times New Roman', // Times New Roman, Verdana, Calibri, Helvetica, Arial, Tahoma,
          wordSpacing: 2,
        );
  }

  const FormattedQuestionText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<InlineSpan> spans = [];
    final RegExp pattern = RegExp(
      r'<(latex|latexb|image|b|i|u)\s*(?:src="(.*?)")?\s*(?:width="(\d+)")?\s*(?:height="(\d+)")?\s*(?:align="(left|right)")?\s*(?:inline="(true|false)")?\s*>(.*?)</\1>',
      dotAll: true,
    );
    final TextStyle questionStyle = get(context);

    int lastMatchEnd = 0;
    for (final Match match in pattern.allMatches(text)) {
      // Add text before the special tag
      if (match.start > lastMatchEnd) {
        spans.add(TextSpan(
          text: text.substring(lastMatchEnd, match.start),
          style: questionStyle,
        ));
      }

      final String tag = match.group(1)!;
      final String? src = match.group(2);
      final String? width = match.group(3);
      final String? height = match.group(4);
      final String? align = match.group(5);
      final String? inline = match.group(6);
      final String content = match.group(7)!;

      switch (tag) {
        case 'latex':
        case 'latexb':
          spans.add(WidgetSpan(
            child: LatexSpan(
              content: content,
              isBlock: tag == 'latexb',
              textStyle: questionStyle,
            ),
          ));
          break;
        case 'image':
          spans.add(WidgetSpan(
            child: ImageSpan(
              src: src!,
              width: width != null ? double.parse(width) : null,
              height: height != null ? double.parse(height) : null,
              align: align != null
                  ? (align == 'left' ? ImageAlign.left : ImageAlign.right)
                  : null,
              inline: inline == 'true',
              textStyle: questionStyle,
            ),
          ));
          break;
        case 'b':
        case 'i':
        case 'u':
          spans.add(WidgetSpan(
            child: StyledTextSpan(
              content: content,
              style: tag,
              textStyle: questionStyle,
            ),
          ));
          break;
      }

      lastMatchEnd = match.end;
    }

    // Add any remaining text
    if (lastMatchEnd < text.length) {
      spans.add(TextSpan(
        text: text.substring(lastMatchEnd),
        style: questionStyle,
      ));
    }

    return Text.rich(
      TextSpan(children: spans),
      style: questionStyle,
    );
  }
}

// ... LatexSpan and StyledTextSpan remain the same ...

enum ImageAlign { left, right }

class ImageSpan extends StatelessWidget {
  final String src;
  final double? width;
  final double? height;
  final ImageAlign? align;
  final bool inline;
  final TextStyle textStyle;

  const ImageSpan({
    Key? key,
    required this.src,
    this.width,
    this.height,
    this.align,
    this.inline = false,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image = Image.network(
      src,
      width: width,
      height: height,
      frameBuilder: (BuildContext context, Widget child, int? frame,
          bool wasSynchronouslyLoaded) {
        return Container(
          width: width,
          height: height,
          child: child,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width ?? 100,
          height: height ?? 100,
          child: Center(
            child: Text('Failed to load image',
                style: textStyle, textAlign: TextAlign.center),
          ),
        );
      },
      fit: BoxFit.contain,
    );

    if (!inline && align != null) {
      return Align(
        alignment: align == ImageAlign.left
            ? Alignment.centerLeft
            : Alignment.centerRight,
        child: Padding(
          padding: EdgeInsets.only(
            left: align == ImageAlign.left ? 0 : 8,
            right: align == ImageAlign.right ? 0 : 8,
            top: 4,
            bottom: 4,
          ),
          child: image,
        ),
      );
    }

    return image;
  }
}

// class FormattedQuestionText extends StatelessWidget {
//   final String text;
//   final TextStyle textStyle;

//   const FormattedQuestionText({
//     Key? key,
//     required this.text,
//     required this.textStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final List<InlineSpan> spans = [];
//     final RegExp pattern = RegExp(
//       r'<(latex|latexb|image|b|i|u)\s*(?:src="(.*?)")?\s*(?:width="(\d+)")?\s*(?:height="(\d+)")?\s*>(.*?)</\1>',
//       dotAll: true,
//     );

//     int lastMatchEnd = 0;
//     for (final Match match in pattern.allMatches(text)) {
//       // Add text before the special tag
//       if (match.start > lastMatchEnd) {
//         spans.add(TextSpan(
//           text: text.substring(lastMatchEnd, match.start),
//           style: textStyle,
//         ));
//       }

//       final String tag = match.group(1)!;
//       final String? src = match.group(2);
//       final String? width = match.group(3);
//       final String? height = match.group(4);
//       final String content = match.group(5)!;

//       switch (tag) {
//         case 'latex':
//         case 'latexb':
//           spans.add(WidgetSpan(
//             child: LatexSpan(
//               content: content,
//               isBlock: tag == 'latexb',
//               textStyle: textStyle,
//             ),
//           ));
//           break;
//         case 'image':
//           spans.add(WidgetSpan(
//             child: ImageSpan(
//               src: src!,
//               width: width != null ? double.parse(width) : null,
//               height: height != null ? double.parse(height) : null,
//               textStyle: textStyle,
//             ),
//           ));
//           break;
//         case 'b':
//         case 'i':
//         case 'u':
//           spans.add(WidgetSpan(
//             child: StyledTextSpan(
//               content: content,
//               style: tag,
//               textStyle: textStyle,
//             ),
//           ));
//           break;
//       }

//       lastMatchEnd = match.end;
//     }

//     // Add any remaining text
//     if (lastMatchEnd < text.length) {
//       spans.add(TextSpan(
//         text: text.substring(lastMatchEnd),
//         style: textStyle,
//       ));
//     }

//     return Text.rich(
//       TextSpan(children: spans),
//       style: textStyle,
//     );
//   }
// }

class LatexSpan extends StatelessWidget {
  final String content;
  final bool isBlock;
  final TextStyle textStyle;

  const LatexSpan({
    Key? key,
    required this.content,
    required this.isBlock,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.0,
          vertical: 0.0,
        ),
        child: LaTexT(
          laTeXCode: Text(
            isBlock ? '\$\$$content\$\$' : '\$$content\$',
            style: textStyle,
          ),
        ),
      );
    } catch (e) {
      return Text(
        ' [LaTeX Error: $content] ',
        style: textStyle.copyWith(
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }
}

class StyledTextSpan extends StatelessWidget {
  final String content;
  final String style;
  final TextStyle textStyle;

  const StyledTextSpan({
    Key? key,
    required this.content,
    required this.style,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle styledTextStyle = textStyle;
    switch (style) {
      case 'b':
        styledTextStyle = styledTextStyle.copyWith(fontWeight: FontWeight.bold);
        break;
      case 'i':
        styledTextStyle = styledTextStyle.copyWith(fontStyle: FontStyle.italic);
        break;
      case 'u':
        styledTextStyle =
            styledTextStyle.copyWith(decoration: TextDecoration.underline);
        break;
    }
    return Text(content, style: styledTextStyle);
  }
}

// class ImageSpan extends StatelessWidget {
//   final String src;
//   final double? width;
//   final double? height;
//   final TextStyle textStyle;

//   const ImageSpan({
//     Key? key,
//     required this.src,
//     this.width,
//     this.height,
//     required this.textStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.network(
//       src,
//       width: width,
//       height: height,
//       errorBuilder: (context, error, stackTrace) {
//         return Text('Failed to load image', style: textStyle);
//       },
//     );
//   }
// }

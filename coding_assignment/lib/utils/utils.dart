import 'package:coding_assignment/config/routes/app_routes.dart';
import 'package:coding_assignment/models/type_model.dart';
import 'package:coding_assignment/models/variable_model.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

// Defining utils to be used in the application
class Utils {
  // Private constructor to prevent instantiation of this class.

  Utils._();
  // The function `parseDollarText` takes a `text` string, a `Variable` object named `variable`, and a `BuildContext`.

  static List<TextSpan> parseDollarText(
      String text, Variable variable, BuildContext context) {
    // Create an empty list to hold the `TextSpan` objects that will be generated.
    final List<TextSpan> textSpans = [];

    // Create a copy of the `text` string to be modified.
    String modifiedLine = text;

    // Split the `text` into individual words.
    final words = text.split(' ');
    int i = 0;
    // Loop through each word in the `words` list.
    for (final word in words) {
      // Check if the word contains a dollar sign ('$').
      if (word.contains('\$')) {
        //Check which type of variable is used
        if (text.contains('\$1')) {
          final type1 = variable.type1;
          final value1 = type1?.type == 'value'
              ? type1?.values?.first.toString()
              : type1?.defaultValue?.toString();
          //replace the sentence with `value1`
          modifiedLine = modifiedLine.replaceAll('\$1', '($value1)');
        }

        if (text.contains('\$2')) {
          final type2 = variable.type2;
          final value2 = type2?.type == 'value'
              ? type2?.values?.first.toString()
              : type2?.defaultValue?.toString();
          modifiedLine = modifiedLine.replaceAll('\$2', '($value2)');
        }

        if (text.contains('\$3')) {
          final type3 = variable.type3;
          final value3 = type3?.type == 'value'
              ? type3?.values?.first.toString()
              : type3?.defaultValue?.toString();
          modifiedLine = modifiedLine.replaceAll('\$3', '($value3)');
        }

        if (text.contains('\$4')) {
          final type4 = variable.type4;
          final value4 = type4?.type == 'value'
              ? type4?.values?.first.toString()
              : type4?.defaultValue?.toString();
          modifiedLine = modifiedLine.replaceAll('\$4', '($value4)');
        }
        final type = text.split(" ")[i];
        //Add the modified word as a `TextSpan` to the `textSpans` list.
        textSpans.add(
          TextSpan(
            text: modifiedLine.split(" ")[i],
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.indigo,
                  decoration: TextDecoration.underline,
                ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Create a tap gesture recognizer for handling tap events on the `TextSpan`.
                if (type.contains('\$1')) {
                  Navigator.pushNamed(context, AppRoutes.subCriteriaScreen,
                      arguments: variable.type1);
                } else if (type.contains('\$2')) {
                  Navigator.pushNamed(context, AppRoutes.subCriteriaScreen,
                      arguments: variable.type2);
                } else if (type.contains('\$3')) {
                  Navigator.pushNamed(context, AppRoutes.subCriteriaScreen,
                      arguments: variable.type3);
                } else if (type.contains('\$4')) {
                  Navigator.pushNamed(context, AppRoutes.subCriteriaScreen,
                      arguments: variable.type4);
                }
              },
          ),
        );
      } else {
        // If the word does not contain a dollar sign, add it as a regular `TextSpan` to the `textSpans` list.

        textSpans.add(
          TextSpan(
            text: word,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                ),
          ),
        );
      }
      // Add a space `TextSpan` after each word to maintain proper spacing in the text.

      textSpans.add(const TextSpan(text: ' '));
      i++;
    }

    return textSpans;
  }

// getter for widget to be rendered for sub criteria screen
  static Widget resolveVartype(
    VarType type,
    BuildContext context,
  ) {
    // If the 'type' is "value", return a widget to display a list of values.

    if (type.type == "value") {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: type.values?.length,
          itemBuilder: (context, index) => Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: Text(
                  type.values![index].toString(),
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
              // Add a CustomPaint widget to draw a dotted line.
              // This separates each value with a dotted line.
              CustomPaint(
                size: Size(MediaQuery.of(context).size.width, 1),
                painter: DottedLinePainter(),
              ),
            ],
          ),
        ),
      );
    } else if (type.type == "indicator") {
      // If the 'type' is "indicator", return a widget to display study parameters.

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type.studyType!.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Set Parameters",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 7,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Period",
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        initialValue: type.defaultValue.toString(),
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 4),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.orange, width: 2),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            isDense: true),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
    return Container();
  }
}

class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Define the width and spacing of each dash in the dotted line.
    double dashWidth = 4; // Width of each dash.
    double dashSpace = 5; // Spacing between each dash.

    // Define the starting position (x-coordinate) for drawing the dashes.
    double startX = 0;

    // Create a Paint object to define the color and width of the line.
    final paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1;
    // Loop through the canvas horizontally, drawing dashes at regular intervals.
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

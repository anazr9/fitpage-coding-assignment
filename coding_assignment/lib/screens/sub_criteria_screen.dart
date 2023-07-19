import 'package:coding_assignment/models/type_model.dart';
import 'package:coding_assignment/utils/utils.dart';
import 'package:flutter/material.dart';

class SubCriteriaScreen extends StatelessWidget {
  final VarType type;
  const SubCriteriaScreen({Key? key, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                color: Colors.black,
                child: Utils.resolveVartype(type, context)),
          ),
        ),
      ),
    );
  }
}

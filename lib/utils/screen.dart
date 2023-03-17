import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget txtfiled(String a,TextEditingController b)
{
  return TextField(
    controller: b,
    style: TextStyle(color: Colors.white),
    decoration: InputDecoration(
      label: Text("$a",style: TextStyle(color: Colors.white
      )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
    ),
  );
}

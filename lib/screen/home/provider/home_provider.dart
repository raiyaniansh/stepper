import 'dart:ffi';

import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier
{
  int i = 0;
  TextEditingController name= TextEditingController();
  TextEditingController num= TextEditingController();
  TextEditingController email= TextEditingController();
  TextEditingController location= TextEditingController();
  TextEditingController nat= TextEditingController();
  TextEditingController reli= TextEditingController();
  TextEditingController lan= TextEditingController();
  TextEditingController bio= TextEditingController();

  bool lan1=false;
  bool lan2=false;
  bool lan3=false;
  bool lan4=false;

  DateTime curruntdate= DateTime.now();
  DateTime lastdate= DateTime.now();

  String rvalue='male';

  void chlan1(bool lang1)
  {
    lan1=lang1;
    notifyListeners();
  }

  void chlan2(bool lang2)
  {
    lan2=lang2;
    notifyListeners();
  }

  void chlan3(bool lang3)
  {
    lan3=lang3;
    notifyListeners();
  }

  void chlan4(bool lang4)
  {
    lan4=lang4;
    notifyListeners();
  }

  void changegender(String value)
  {
    rvalue=value;
    notifyListeners();
  }

  void setdate(DateTime date)
  {
    curruntdate=date;
    notifyListeners();
  }

  void next()
  {
    if(i<10)
    {
      i++;
    }
    notifyListeners();
  }

  void back()
  {
    if(i>0)
    {
      i--;
    }
    notifyListeners();
  }

  void onstep(int value)
  {
    i= value;
    notifyListeners();
  }


}
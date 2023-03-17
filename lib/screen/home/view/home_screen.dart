import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stepper/screen/home/provider/home_provider.dart';
import 'package:stepper/utils/screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderf;
  HomeProvider? homeProvidert;

  @override
  Widget build(BuildContext context) {
    homeProviderf = Provider.of<HomeProvider>(context, listen: false);
    homeProvidert = Provider.of<HomeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Profile"),
        ),
        backgroundColor: Colors.black,
        body: Theme(
          data: ThemeData(
              brightness: Brightness.dark,
              textButtonTheme: TextButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900),
                ),
              ),
          ),
          child: Stepper(
            onStepTapped: (value) {
              homeProviderf!.onstep(value);
            },
            onStepCancel: () {
              homeProviderf!.back();
            },
            onStepContinue: () {
              homeProviderf!.next();
            },
            currentStep: homeProvidert!.i,
            physics: BouncingScrollPhysics(),
            steps: [
              Step(
                title: Text("Profile Picture",
                    style: TextStyle(color: Colors.white)),
                content: Column(
                  children: [
                    CircleAvatar(
                      child: Icon(Icons.person,size: 60),
                      backgroundColor: Colors.grey,
                      maxRadius: 50,
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(onPressed: () {}, child: Text("Add Photo",),style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.grey.shade900)),)
                  ],
                ),
              ),
              Step(
                  title: Text("Name", style: TextStyle(color: Colors.white)),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Name', homeProviderf!.name),
                    ],
                  )),
              Step(
                  title: Text("Phone", style: TextStyle(color: Colors.white)),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Phone number', homeProviderf!.num),
                    ],
                  )),
              Step(
                  title: Text("Email", style: TextStyle(color: Colors.white)),
                  content: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Email', homeProviderf!.email),
                    ],
                  )),
              Step(
                  title: Text("Dob", style: TextStyle(color: Colors.white)),
                  content: Column(
                    children: [
                      Text(
                          "Dob : ${homeProvidert!.curruntdate.day}-${homeProvidert!.curruntdate.month}-${homeProvidert!.curruntdate.year}",
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(height: 10,),
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStatePropertyAll(Colors.grey.shade900)),
                          onPressed: () async {
                            DateTime? Date = await showDatePicker(
                                builder: (context, child) {
                                  return Theme(
                                      data: Theme.of(context).copyWith(
                                          colorScheme: ColorScheme.light(
                                              primary: Colors.grey.shade900,
                                              onPrimary: Colors.white,
                                              onSurface: Colors.black),
                                          textButtonTheme: TextButtonThemeData(
                                              style: TextButton.styleFrom(
                                                  primary:
                                                      Colors.grey.shade900))),
                                      child: child!);
                                },
                                context: context,
                                initialDate: homeProviderf!.curruntdate,
                                firstDate: DateTime(2001),
                                lastDate: homeProviderf!.lastdate);
                            homeProviderf!.setdate(Date!);
                          },
                          child: Text("Select date"))
                    ],
                  )),
              Step(
                  title: Text("Gender", style: TextStyle(color: Colors.white)),
                  content: ListTile(
                      title: Row(
                    children: [
                      Radio(
                        value: 'male',
                        groupValue: homeProvidert!.rvalue,
                        onChanged: (value) {
                          homeProvidert!.changegender(value!);
                        },
                      ),
                      Text(
                        "Male",
                        style: TextStyle(color: Colors.white),
                      ),
                      Radio(
                        value: 'female',
                        groupValue: homeProvidert!.rvalue,
                        onChanged: (value) {
                          homeProvidert!.changegender(value!);
                        },
                      ),
                      Text(
                        "Female",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ))),
              Step(
                  title: Text("Current location",
                      style: TextStyle(color: Colors.white)),
                  content: ListTile(
                      title: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Location', homeProviderf!.location),
                    ],
                  ))),
              Step(
                  title: Text("Nationalities",
                      style: TextStyle(color: Colors.white)),
                  content: ListTile(
                      title: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Nationalities', homeProviderf!.nat),
                    ],
                  ))),
              Step(
                  title:
                      Text("Religion", style: TextStyle(color: Colors.white)),
                  content: ListTile(
                      title: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Religion', homeProviderf!.reli),
                    ],
                  ))),
              Step(
                  title:
                      Text("Language", style: TextStyle(color: Colors.white)),
                  content: ListTile(
                      title: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: homeProvidert!.lan1,
                            onChanged: (value) {
                              homeProviderf!.chlan1(value!);
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "English",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: homeProvidert!.lan2,
                            onChanged: (value) {
                              homeProviderf!.chlan2(value!);
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Gujarati",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: homeProvidert!.lan3,
                            onChanged: (value) {
                              homeProviderf!.chlan3(value!);
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Hindi",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Checkbox(
                            value: homeProvidert!.lan4,
                            onChanged: (value) {
                              homeProviderf!.chlan4(value!);
                            },
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Other",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ))),
              Step(
                  title:
                      Text("Biography", style: TextStyle(color: Colors.white)),
                  content: ListTile(
                      title: Column(
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      txtfiled('Biography', homeProviderf!.bio),
                    ],
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}

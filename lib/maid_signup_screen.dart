import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';

class MaidSignupScreen extends StatefulWidget {
  @override
  _MaidSignupScreenState createState() => _MaidSignupScreenState();
}

class _MaidSignupScreenState extends State<MaidSignupScreen> {
  final _formKey = GlobalKey<FormState>();
  final picker = ImagePicker();

  final nameController = TextEditingController();
  final fatherNameController = TextEditingController();
  final cnicController = TextEditingController();
  final locationController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final ageController = TextEditingController();
  final sweepingPriceController = TextEditingController();


  final laundryPriceController = TextEditingController();
  final cookingTimesController = TextEditingController();
  final cookingPriceController = TextEditingController();
  final sweepingAreaController = TextEditingController();
  final othersController = TextEditingController();
  final dustingPriceController = TextEditingController();
  final babysittingPriceController = TextEditingController();
  final nursingPriceController = TextEditingController();

  XFile? frontCnicImage;
  XFile? backCnicImage;

  String maritalStatus = "Married";
  String jobType = "Full time";
  String? partTimeTiming;

  bool isLaundrySelected = false;
  bool isCookingSelected = false;
  bool isSweepingSelected = false;
  bool isDustingSelected = false;
  bool isBabysittingSelected = false;
  bool isNursingSelected = false;
  bool isOthersSelected = false;

  int numberOfTimesCooking = 1;
  int sweepingArea = 1;

  String sweepingUnit = "Marla";
  String dustingLevel = "Fully";
  String babysittingJobType = "Full time";
  String nursingJobType = "Full time";

  Future<void> pickImage(bool isFront) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (isFront) {
          frontCnicImage = pickedFile;
        } else {
          backCnicImage = pickedFile;
        }
      });
    }
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location services are disabled.')),
      );
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      locationController.text = '${position.latitude}, ${position.longitude}';
    });
  }

  Widget _buildTextField(String label, TextEditingController controller, {bool obscure = false}) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildCounterButton(String label, int value, Function() increment, Function() decrement) {
    return Row(
      children: [
        IconButton(icon: Icon(Icons.remove), onPressed: decrement),
        Text('$label: $value', style: TextStyle(fontSize: 16)),
        IconButton(icon: Icon(Icons.add), onPressed: increment),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9F6E8),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -150,
              left: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 50,
              left: -100,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  color: Colors.lightBlue.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: SingleChildScrollView(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Image.asset('images/iconss.png', width: 100, height: 100),
                          Text("Maidsignup", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                          Text("Hire with Confidence, Work with Dignity!",
                              style: TextStyle(fontSize: 16), textAlign: TextAlign.center),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildTextField("Name", nameController),
                      SizedBox(height: 10),
                      _buildTextField("Father's Name", fatherNameController),
                      SizedBox(height: 10),
                      _buildTextField("CNIC", cnicController),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(child: _buildTextField("Enter Location", locationController)),
                          IconButton(icon: Icon(Icons.location_on), onPressed: getCurrentLocation),
                        ],
                      ),
                      SizedBox(height: 10),
                      _buildTextField("Password", passwordController, obscure: true),
                      SizedBox(height: 10),
                      _buildTextField("Phone No", phoneController),
                      SizedBox(height: 10),
                      _buildTextField("Address", addressController),
                      SizedBox(height: 10),
                      _buildTextField("Age", ageController),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Married"),
                          Radio(value: "Married", groupValue: maritalStatus, onChanged: (value) {
                            setState(() => maritalStatus = value.toString());
                          }),
                          Text("UnMarried"),
                          Radio(value: "UnMarried", groupValue: maritalStatus, onChanged: (value) {
                            setState(() => maritalStatus = value.toString());
                          }),
                        ],
                      ),
                      Wrap(
                        spacing: 10,
                        children: [
                          ChoiceChip(
                            label: Text('Full time'),
                            selected: jobType == 'Full time',
                            onSelected: (_) {
                              setState(() {
                                jobType = 'Full time';
                                partTimeTiming = null;
                              });
                            },
                          ),
                          ChoiceChip(
                            label: Text('Part time'),
                            selected: jobType == 'Part time',
                            onSelected: (_) => setState(() => jobType = 'Part time'),
                          ),
                          ChoiceChip(
                            label: Text('Live in'),
                            selected: jobType == 'Live in',
                            onSelected: (_) {
                              setState(() {
                                jobType = 'Live in';
                                partTimeTiming = null;
                              });
                            },
                          ),
                          ChoiceChip(
                            label: Text('On demand'),
                            selected: jobType == 'On demand',
                            onSelected: (_) => setState(() => jobType = 'On demand'),
                          ),
                        ],
                      ),
                      if (jobType == 'Part time' || jobType == 'On demand') ...[
                        SizedBox(height: 10),
                        _buildTextField("Enter Working Hours (e.g., 9AM to 5PM)",
                            TextEditingController(text: partTimeTiming ?? '')),
                      ],
                      SizedBox(height: 10),
                      Text("Upload CNIC (Front and Back):"),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => pickImage(true)),
                          IconButton(icon: Icon(Icons.camera_alt), onPressed: () => pickImage(false)),
                        ],
                      ),
                      SizedBox(height: 20),
                      Text("Services:", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      CheckboxListTile(
                        title: Text("Laundry (Fabric)"),
                        value: isLaundrySelected,
                        onChanged: (value) => setState(() => isLaundrySelected = value!),
                      ),
                      if (isLaundrySelected) ...[
                        _buildTextField("Set Laundry Price", laundryPriceController),
                      ],
                      CheckboxListTile(
                        title: Text("Cooking (no. of Eaters)"),
                        value: isCookingSelected,
                        onChanged: (value) => setState(() => isCookingSelected = value!),
                      ),
                      if (isCookingSelected) ...[
                        _buildCounterButton("Number of Meals", numberOfTimesCooking, () {
                          setState(() => numberOfTimesCooking++);
                        }, () {
                          setState(() {
                            if (numberOfTimesCooking > 1) numberOfTimesCooking--;
                          });
                        }),
                        _buildTextField("Set Cooking Price", cookingPriceController),
                      ],
                      CheckboxListTile(
                        title: Text("Sweeping & Mopping (Marla/Sqft)"),
                        value: isSweepingSelected,
                        onChanged: (value) => setState(() => isSweepingSelected = value!),
                      ),
                      if (isSweepingSelected) ...[
                        Row(
                          children: [
                            Radio(
                              value: "Marla",
                              groupValue: sweepingUnit,
                              onChanged: (value) => setState(() => sweepingUnit = value.toString()),
                            ),
                            Text("Marla"),
                            Radio(
                              value: "Sqft",
                              groupValue: sweepingUnit,
                              onChanged: (value) => setState(() => sweepingUnit = value.toString()),
                            ),
                            Text("Sqft"),
                          ],
                        ),
                        _buildCounterButton("Sweeping Area", sweepingArea, () {
                          setState(() => sweepingArea++);
                        }, () {
                          setState(() {
                            if (sweepingArea > 1) sweepingArea--;
                          });
                        }),
                        SizedBox(height: 10),
                        _buildTextField("Set Price for Sweeping", sweepingPriceController),
                      ],
                      CheckboxListTile(
                        title: Text("Dusting "),
                        value: isDustingSelected,
                        onChanged: (value) => setState(() => isDustingSelected = value!),
                      ),
                      if (isDustingSelected) ...[

                        _buildTextField("Set Dusting Price", dustingPriceController),
                      ],
                      CheckboxListTile(
                        title: Text("Babysitting"),
                        value: isBabysittingSelected,
                        onChanged: (value) => setState(() => isBabysittingSelected = value!),
                      ),
                      if (isBabysittingSelected) ...[
                        _buildTextField("Set Babysitting Price", babysittingPriceController),
                      ],
                      CheckboxListTile(
                        title: Text("Nursing"),
                        value: isNursingSelected,
                        onChanged: (value) => setState(() => isNursingSelected = value!),
                      ),
                      if (isNursingSelected) ...[
                        _buildTextField("Set Nursing Price", nursingPriceController),
                      ],
                      CheckboxListTile(
                        title: Text("Other"),
                        value: isOthersSelected,
                        onChanged: (value) => setState(() => isOthersSelected = value!),
                      ),
                      if (isOthersSelected)
                        _buildTextField("Specify Other Services", othersController),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          // Form submission
                        },
                        child: Text("Submit"),
                      ),
                    ],
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
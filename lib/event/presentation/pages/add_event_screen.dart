import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showbook/category/presentation/widgets/dropdown_category_widget.dart';
import 'package:showbook/event/presentation/widgets/dropdown_location_widget.dart';
import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/input_widget.dart';

import '../../../profil/presentation/widgets/dropdown_profil_widget.dart';
import '../../../shared/routes/routes.gr.dart';

@RoutePage()
class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _spaceController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _organizerController;
  late TextEditingController _locationController;
  late TextEditingController _categoryController;
  late TextEditingController _guestController;
  late TextEditingController _priceController;
  File? _image;

  List<String> _selectedOptions = [];
  String _selectedOption = 'pain';

  List<String> _options = [
    'pain',
    'beure',
    'chou',
    'lait',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _spaceController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _organizerController = TextEditingController();
    _locationController = TextEditingController();
    _categoryController = TextEditingController();
    _guestController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void dropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        _selectedOption = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Add event',
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                // image
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Cover of event',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.tertiary,
                              width: 2,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 1,
                            left: 1,
                            right: 1,
                          ),
                          child: Container(
                            height: 148,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.white,
                            ),
                            child: _image != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: Image.file(
                                        _image!,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  )
                                : Container(),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: IconButton(
                            onPressed: () async {
                              final ImagePicker picker = ImagePicker();
                              var image = await picker.pickImage(
                                  source: ImageSource.gallery);

                              if (image != null) {
                                setState(() {
                                  _image = File(image.path);
                                });
                              }
                            },
                            icon: const CircleAvatar(
                              radius: 30,
                              backgroundColor: AppColors.tertiary,
                              child: Icon(Icons.camera_alt),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                // title**************************
                InputWidget(
                  controller: _titleController,
                  label: 'Title',
                ),
                const SizedBox(
                  height: 20,
                ),
                // category ***********************
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DropDownCategoryWidget(),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                // description*******************
                InputWidget(
                  controller: _descriptionController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  label: 'Description',
                ),
                const SizedBox(
                  height: 20,
                ),
                // date************************
                InputWidget(
                  controller: _startDateController,
                  keyboardType: TextInputType.datetime,
                  label: 'Start date',
                  placeholder: 'YY-MM-DD',
                ),
                const SizedBox(
                  height: 20,
                ),
                InputWidget(
                  controller: _endDateController,
                  keyboardType: TextInputType.datetime,
                  label: 'End date',
                  placeholder: 'YY-MM-DD',
                ),

                const SizedBox(
                  height: 20,
                ),
                //  price **********************
                InputWidget(
                  controller: _priceController,
                  keyboardType: TextInputType.number,
                  label: 'Price',
                ),
                const SizedBox(
                  height: 20,
                ),
                InputWidget(
                  controller: _spaceController,
                  keyboardType: TextInputType.number,
                  label: 'Number place',
                ),

                const SizedBox(
                  height: 20,
                ),
                // location ***********************
                // const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Location',
                //       style: TextStyle(
                //         fontSize: 16,
                //       ),
                //     ),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     DropdownLocationWidget(),
                //   ],
                // ),

                //  organizer ***********************
                // const Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Text(
                //       'Organizer',
                //       style: TextStyle(
                //         fontSize: 16,
                //       ),
                //     ),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     DropdownProfilWidget(),
                //   ],
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

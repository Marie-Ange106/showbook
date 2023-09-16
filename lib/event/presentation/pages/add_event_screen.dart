import 'dart:io';

import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:showbook/category/presentation/widgets/dropdown_category_widget.dart';
import 'package:showbook/event/business_logic/cubit/event_cubit.dart';
import 'package:showbook/service_locator.dart';

import 'package:showbook/shared/utils/app_colors.dart';
import 'package:showbook/shared/widgets/input_widget.dart';

import '../../../profil/presentation/widgets/dropdown_profil_widget.dart';
import '../../../shared/widgets/button_widget.dart';
import '../widgets/dropdown_location_widget.dart';

@RoutePage()
class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen>
    with SingleTickerProviderStateMixin {
  String imagePath = '';
  late AnimationController _controller;
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _spaceController;
  late TextEditingController _startDateController;
  late TextEditingController _endDateController;
  late TextEditingController _priceController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  File? _image;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _spaceController = TextEditingController();
    _startDateController = TextEditingController();
    _endDateController = TextEditingController();
    _priceController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
        child: BlocConsumer<EventCubit, EventState>(
          listener: (context, state) {
            if (state.errorSendingData) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    state.message.toString(),
                  ),
                ),
              );
            }
            if (state.sucessSendingData) {
              // context.router.pushAndPopUntil(
              //   const ApplicationRoute(),
              //   predicate: (_) => false,
              // );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Event created successfully!',
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    // image**************************
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
                                      // imagePath = _image!.path;
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
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Location',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownLocationWidget(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    //  organizer ***********************
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Organizer',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownProfilWidget(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // guests************************
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Guest(s)',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        DropdownProfilWidget(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        getIt.get<EventCubit>().addEvent(
                              title: _titleController.text,
                              description: _descriptionController.text,
                              image: _image!,
                              numberSpace: _spaceController.hashCode,
                              startDate:
                                  DateTime.parse(_startDateController.text),
                              organiserId:
                                  DropdownProfilWidget.selectedOrganizer,
                              locationId:
                                  DropdownLocationWidget.selectedLocation,
                              categories:
                                  DropDownCategoryWidget.selectedCategory,
                            );
                      },
                      child: ButtonWidget(
                        borderColor: AppColors.primary,
                        bgColor: AppColors.primary,
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        fontSize: 17,
                        text: 'Continue',
                        textColor: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

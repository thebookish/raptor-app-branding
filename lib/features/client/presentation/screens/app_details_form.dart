import 'dart:html';

import 'package:appbranding/features/client/domain/entities/app_details.dart';
import 'package:appbranding/features/client/presentation/screens/component/k_file_input_field.dart';
import 'package:appbranding/features/client/presentation/screens/component/k_input_field.dart';
import 'package:appbranding/features/client/presentation/view_model/app_details_view_model/app_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppDetailsForm extends ConsumerStatefulWidget {
  const AppDetailsForm({Key? key}) : super(key: key);

  @override
  _AppDetailsScreenState createState() => _AppDetailsScreenState();
}

class _AppDetailsScreenState extends ConsumerState<AppDetailsForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  File? appIconFile;
  File? darkMoodLogoFile;
  File? lightMoodLogoFile;
  Color? primaryColor;
  Color? secondaryColor;

  @override
  Widget build(BuildContext context) {
    final appDetails = ref.watch(appDetailsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Details Form'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomFormInputField(
                    name: 'appName',
                    labelText: 'App Name',
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  CustomFileUploadField(
                    name: 'appIcon',
                    labelText: 'App Icon',
                    onChanged: (file) {
                      appIconFile = file;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFileUploadField(
                    name: 'darkMoodLogo',
                    labelText: 'Dark Mood Logo',
                    onChanged: (file) {
                      darkMoodLogoFile = file;
                    },
                  ),
                  const SizedBox(height: 20),
                  CustomFileUploadField(
                    name: 'lightMoodLogo',
                    labelText: 'Light Mood Logo',
                    onChanged: (file) {
                      lightMoodLogoFile = file;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Short description (limit 80 characters/1 sentence) & Full description (4000 characters): These descriptions will be visible in app stores.',
                  ),
                  const SizedBox(height: 4),
                  CustomFormInputField(
                    name: 'shortDescription',
                    labelText: 'Short Description',
                    validator: FormBuilderValidators.maxLength(80),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'fullDescription',
                    labelText: 'Full Description',
                    maxLines: 5,
                    validator: FormBuilderValidators.maxLength(4000),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'primaryColor',
                    labelText: 'Brand Primary Color',
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'secondaryColor',
                    labelText: 'Brand Secondary Color',
                    validator: FormBuilderValidators.required(),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'testUserEmail',
                    labelText: 'Test User Email',
                    keyboardType: TextInputType.emailAddress,
                    validator: FormBuilderValidators.email(),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'testUserPassword',
                    labelText: 'Test User Password',
                    validator: FormBuilderValidators.minLength(6),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'ezycourseSiteUrl',
                    labelText: 'EzyCourse Site URL',
                    keyboardType: TextInputType.url,
                    validator: FormBuilderValidators.url(),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'privacyPolicyUrl',
                    labelText: 'Privacy Policy URL',
                    keyboardType: TextInputType.url,
                    validator: FormBuilderValidators.url(),
                  ),
                  const SizedBox(height: 20),
                  CustomFormInputField(
                    name: 'termsOfUseUrl',
                    labelText: 'Terms of Use URL',
                    keyboardType: TextInputType.url,
                    validator: FormBuilderValidators.url(),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        var formData = _formKey.currentState!.value;
                        var appDetails = AppDetails(
                          appName: formData['appName'],
                          shortDescription: formData['shortDescription'],
                          fullDescription: formData['fullDescription'],
                          primaryColor: formData['primaryColor'],
                          secondaryColor: formData['secondaryColor'],
                        );

                        ref
                            .read(appDetailsProvider.notifier)
                            .submitForm(appDetails);
                      }
                    },
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

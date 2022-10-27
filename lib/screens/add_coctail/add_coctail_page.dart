import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_coctail_bar/screens/add_coctail/cubit/add_coctail_cubit.dart';
import 'package:my_coctail_bar/screens/home_page.dart';
import 'package:my_coctail_bar/widget/widget_text_form_field.dart';

class AddCoctail extends StatefulWidget {
  const AddCoctail({
    Key? key,
  }) : super(key: key);

  @override
  State<AddCoctail> createState() => _AddCoctailState();
}

class _AddCoctailState extends State<AddCoctail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState<String>> _coctailNameInputKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _recipeInputKey = GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormFieldState<String>> _coctailStrengthInputKey = GlobalKey<FormFieldState<String>>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddCoctailCubit(),
      child: BlocBuilder<AddCoctailCubit, AddCoctailState>(builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        WidgetTextFormField(
                          formFieldKey: _coctailNameInputKey,
                          labelText: 'Nazwa koktajlu',
                        ),
                        WidgetTextFormField(
                          formFieldKey: _coctailStrengthInputKey,
                          labelText: 'Moc w procentach (%)',
                          validatorStrength: true,
                        ),
                        WidgetTextFormField(
                          formFieldKey: _recipeInputKey,
                          labelText: 'Opis przyrządzenia koktajlu',
                          maxLine: null,
                        ),
                      ],
                    ),
                    _addButton(context),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Container _addButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 75,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            int? strength = int.tryParse(_coctailStrengthInputKey.currentState!.value!);
            context.read<AddCoctailCubit>().create(
                  name: _coctailNameInputKey.currentState!.value!,
                  recipe: _recipeInputKey.currentState!.value!,
                  strength: strength!,
                );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.pink),
        ),
        child: const Text(
          'Dodaj przepis',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}

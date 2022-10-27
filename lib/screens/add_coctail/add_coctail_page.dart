import 'package:flutter/material.dart';
import 'package:my_coctail_bar/widget/widget_text_form_field.dart';

class AddCoctail extends StatelessWidget {
  const AddCoctail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                WidgetTextFormField(
                  labelText: 'Nazwa koktajlu',
                ),
                WidgetTextFormField(
                  labelText: 'Moc',
                  validatorStrength: true,
                ),
                WidgetTextFormField(
                  labelText: 'Opis przyrządzenia drinka',
                ),
              ],
            ),
            _buttonAddsRecipe(),
          ],
        ),
      ),
    );
  }

  Container _buttonAddsRecipe() {
    return Container(
      padding: const EdgeInsets.all(10.0),
      height: 75,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
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

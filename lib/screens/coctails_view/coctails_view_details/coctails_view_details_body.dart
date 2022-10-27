import 'package:flutter/material.dart';
import 'package:my_coctail_bar/screens/coctails_view/coctails_view_details/cubit/coctails_view_details_cubit.dart';

class CoctailViewDetailsBody extends StatefulWidget {
  const CoctailViewDetailsBody({
    super.key,
    required this.state,
  });

  final CoctailViewDetailsInfoState state;

  @override
  State<CoctailViewDetailsBody> createState() => _CoctailViewDetailsBodyState();
}

class _CoctailViewDetailsBodyState extends State<CoctailViewDetailsBody> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Przepis'),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 16),
          Text('Nazwa koktajlu: ${widget.state.coctail.name}'),
          const Divider(color: Colors.pink),
          const SizedBox(height: 16),
          Text('Moc: ${widget.state.coctail.strength}%'),
          const Divider(color: Colors.pink),
          const SizedBox(height: 16),
          const Text('Receptua:'),
          Text(widget.state.coctail.recipe),
        ],
      ),
    );
  }
}

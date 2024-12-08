import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/presentation/fillter_bloc/bloc/fillter_bloc.dart';
import 'package:food_ninja/features/home/view/widgets/search_chips.dart';

class ChipSelectionWidget extends StatefulWidget {
  const ChipSelectionWidget({super.key});

  @override
  State<ChipSelectionWidget> createState() => _ChipSelectionWidgetState();
}

class _ChipSelectionWidgetState extends State<ChipSelectionWidget> {
  final Map<String, List<String>> _chipData = {
    "Type": ["Restaurant", "Menu"],
    "Location": ["1 Km", ">10 Km", "<10 Km"],
    "Food": ["Cake", "Soup", "Main Course", "Appetizer", "Dessert"],
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: BlocBuilder<FillterBloc, FillterState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchChips(
                  category: _chipData.entries.elementAt(0).key,
                  itemsOfCategory: _chipData.entries.elementAt(0).value,
                  onSelected: (isSelected, chipLabel) {
                    if (isSelected) {
                      context.read<FillterBloc>().add(const ClearTypeFillter());
                      context
                          .read<FillterBloc>()
                          .add(AddTypeFillter(chipLabel));
                    } else {
                      context.read<FillterBloc>().add(const ClearTypeFillter());
                    }
                  },
                  selectedChips: state.typeFillter),
              const SizedBox(
                height: 20,
              ),
              SearchChips(
                  category: _chipData.entries.elementAt(1).key,
                  itemsOfCategory: _chipData.entries.elementAt(1).value,
                  onSelected: (isSelected, chipLabel) {
                    if (isSelected) {
                      context
                          .read<FillterBloc>()
                          .add(const ClearLocationFillter());
                      context
                          .read<FillterBloc>()
                          .add(AddLocationFillter(chipLabel));
                    } else {
                      context
                          .read<FillterBloc>()
                          .add(const ClearLocationFillter());
                    }
                  },
                  selectedChips: state.locationFillter),
              const SizedBox(
                height: 20,
              ),
              SearchChips(
                  category: _chipData.entries.elementAt(2).key,
                  itemsOfCategory: _chipData.entries.elementAt(2).value,
                  onSelected: (isSelected, chipLabel) {
                    if (isSelected) {
                      context
                          .read<FillterBloc>()
                          .add(AddFoodFillter(chipLabel));
                    } else {
                      context
                          .read<FillterBloc>()
                          .add(ClearFoodFillter(chipLabel));
                    }
                  },
                  selectedChips: state.foodFillter),
            ],
          );
        },
      ),
    );
  }
}

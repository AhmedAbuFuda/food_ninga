import 'package:flutter/material.dart';

class SearchChips extends StatelessWidget {
  const SearchChips({
    super.key,
    required this.category,
    required this.itemsOfCategory,
    required this.onSelected,
    required this.selectedChips,
  });
  final String category;
  final List<String> itemsOfCategory;
  final void Function(bool selected, String chip) onSelected;
  final Set<String> selectedChips;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 15,
              ),
        ),
        const SizedBox(height: 8.0),
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: itemsOfCategory.map((chipLabel) {
            final isSelected = selectedChips.contains(chipLabel);
            return FilterChip(
              label: Text(chipLabel),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              labelStyle: isSelected
                  ? Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white,
                        fontSize: 12,
                      )
                  : Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: const Color.fromRGBO(218, 99, 23, 1),
                        fontSize: 12,
                      ),
              backgroundColor: const Color.fromRGBO(254, 246, 237, 1),
              selectedColor: Colors.orange,
              selected: isSelected,
              onSelected: (selected) {
                onSelected(selected, chipLabel);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(
                  color: Colors.transparent,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

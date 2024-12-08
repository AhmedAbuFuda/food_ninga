import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/features/home/presentation/fillter_bloc/bloc/fillter_bloc.dart';

class SelectedFillter extends StatelessWidget {
  const SelectedFillter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FillterBloc, FillterState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: state.typeFillter.map((item) {
                    return Chip(
                      label: Text(item),
                      deleteIcon: const Icon(Icons.close,
                          color: Color.fromRGBO(218, 99, 23, 1)),
                      onDeleted: () => context.read<FillterBloc>().add(
                            const ClearTypeFillter(),
                          ),
                      backgroundColor: const Color.fromRGBO(254, 246, 237, 1),
                      labelStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: const Color.fromRGBO(218, 99, 23, 1),
                                fontSize: 12,
                              ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: state.locationFillter.map((item) {
                    return Chip(
                      label: Text(item),
                      deleteIcon: const Icon(Icons.close,
                          color: Color.fromRGBO(218, 99, 23, 1)),
                      onDeleted: () => context.read<FillterBloc>().add(
                            const ClearLocationFillter(),
                          ),
                      backgroundColor: const Color.fromRGBO(254, 246, 237, 1),
                      labelStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: const Color.fromRGBO(218, 99, 23, 1),
                                fontSize: 12,
                              ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        side: const BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(width: 8),
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: state.foodFillter.map((item) {
                    return Chip(
                      label: Text(item),
                      deleteIcon: const Icon(Icons.close,
                          color: Color.fromRGBO(218, 99, 23, 1)),
                      onDeleted: () => context.read<FillterBloc>().add(
                            ClearFoodFillter(item),
                          ),
                      backgroundColor: const Color.fromRGBO(254, 246, 237, 1),
                      labelStyle:
                          Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: const Color.fromRGBO(218, 99, 23, 1),
                                fontSize: 12,
                              ),
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
            ),
          ),
        );
      },
    );
  }
}

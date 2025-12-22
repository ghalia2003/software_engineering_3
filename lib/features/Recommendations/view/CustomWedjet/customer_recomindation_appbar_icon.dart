import 'package:flutter/material.dart';
import 'package:flutter_application_12/features/Recommendations/controller/cubit/recommendations_cubit.dart';
import 'package:flutter_application_12/features/Recommendations/controller/cubit/recommendations_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecomindationAppBarIcon extends StatefulWidget {
  const RecomindationAppBarIcon({super.key});

  @override
  State<RecomindationAppBarIcon> createState() => _RecomindationAppBarIconState();
}

class _RecomindationAppBarIconState extends State<RecomindationAppBarIcon> {
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<RecommendationsCubit, RecommendationsState>(
            builder: (context, state) {
              final busy = state is RecommendationsGenerating;
              return IconButton(
                tooltip: 'توليد التوصيات',
                onPressed: busy
                    ? null
                    : () => context.read<RecommendationsCubit>().generateThenLoad(),
                icon: busy
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Icon(Icons.auto_awesome),
              );
            },
          );
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_application_12/core/utils/style.dart';
import 'package:flutter_application_12/core/wedjet/app_card_list_tile.dart';
import 'package:flutter_application_12/features/Recommendations/controller/cubit/recommendations_cubit.dart';
import 'package:flutter_application_12/features/Recommendations/controller/cubit/recommendations_state.dart';
import 'package:flutter_application_12/features/Recommendations/strategy/default_strategy.dart';
import 'package:flutter_application_12/features/Recommendations/strategy/recommendation_strategy_context.dart';
import 'package:flutter_application_12/features/Recommendations/strategy/savings_strategy.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class listofCard extends StatefulWidget {
  const listofCard({super.key});

  @override
  State<listofCard> createState() => _listofCardState();
}

class _listofCardState extends State<listofCard> {



  late final RecommendationStrategyContext strategyContext;

  @override
  void initState() {
    super.initState();
    strategyContext = RecommendationStrategyContext([
      SavingsRecommendationStrategy(),
      DefaultRecommendationStrategy(),
    ]);

    context.read<RecommendationsCubit>().load();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RecommendationsCubit, RecommendationsState>(
        listener: (context, state) {
          if (state is RecommendationsGenerateDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is RecommendationsFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          if (state is RecommendationsLoading || state is RecommendationsGenerating) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is RecommendationsFailure) {
            return Center(child: Text(state.error, style: Styles.errorText));
          }

          if (state is RecommendationsSuccess) {
            if (state.items.isEmpty) {
              return const Center(child: Text('لا توجد توصيات حالياً'));
            }

            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: state.items.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (context, index) {
                final rec = state.items[index];
                
                final strategy = strategyContext.resolve(rec);

                return AppCardListTile(
  leading: Icon(strategy.icon(rec)),
  title: Text(strategy.title(rec), style: Styles.headingMedium),
  subtitle: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 6),
      Text(rec.message, style: Styles.bodyText),
      const SizedBox(height: 6),
      Text('Client: ${rec.clientFullName}', style: Styles.caption),
      Text(
        'Date: ${rec.createdDate.toLocal().toString().split(" ").first}',
        style: Styles.caption,
      ),
    ],
  ),


                );
              },
            );
          }

          return const SizedBox.shrink();
        },
      );
  }
}
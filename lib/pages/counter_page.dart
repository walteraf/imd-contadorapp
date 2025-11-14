import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../state/counter_app_state.dart';
import '../widgets/big_counter_card.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<CounterAppState>();
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(flex: 2),
          Text(
            'Contador',
            style: theme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 30),
          BigCounterCard(counter: appState.counter),
          const SizedBox(height: 30),

          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: appState.decrement,
                icon: const Icon(Icons.remove),
                label: const Text('Decrementar'),
              ),
              const SizedBox(width: 15),
              ElevatedButton.icon(
                onPressed: appState.increment,
                icon: const Icon(Icons.add),
                label: const Text('Incrementar'),
              ),
            ],
          ),

          const SizedBox(height: 15),

          ElevatedButton.icon(
            onPressed: appState.reset,
            icon: const Icon(Icons.refresh),
            label: const Text('Zerar'),
          ),

          const Spacer(flex: 3),
        ],
      ),
    );
  }
}

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
          LayoutBuilder(builder: (context, constraints) {
            bool isSmall = constraints.maxWidth < 600;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: appState.subtractTwo,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.remove),
                      SizedBox(width: 8),
                      Text('2'),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                isSmall
                    ? ElevatedButton(
                        // Tela pequena
                        onPressed: appState.decrement,
                        child: const Icon(Icons.remove),
                      )
                    : ElevatedButton.icon(
                        // Tela média a grande
                        onPressed: appState.decrement,
                        icon: const Icon(Icons.remove),
                        label: const Text('Decrementar'),
                      ),
                const SizedBox(width: 15),
                isSmall
                    ? ElevatedButton(
                        // Tela pequena
                        onPressed: appState.increment,
                        child: const Icon(Icons.add),
                      )
                    : ElevatedButton.icon(
                        // Tela média a grande
                        onPressed: appState.increment,
                        icon: const Icon(Icons.add),
                        label: const Text('Incrementar'),
                      ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: appState.addTwo,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text('2'),
                    ],
                  ),
                ),
              ],
            );
          }),
          const SizedBox(height: 50),
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

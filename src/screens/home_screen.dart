import 'package:flutter/material.dart';
import '../widgets/game_card.dart';
import 'register_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travail à faire'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // ---------- BIG BLUE CARD ----------
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Color(0xFF00ACC1),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Travail à faire',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      '200 TND',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => const RegisterScreen()),
                      ),
                      icon: const Icon(Icons.shopping_cart),
                      label: const Text('Acheter'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: const Color(0xFF00ACC1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ---------- SMALL CARDS ROW ----------
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GameCard(
                  title: 'Devil May Cry 5',
                  imagePath: 'assets/images/devil_may_cry.jpg',
                  description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                  price: '200 TND',
                ),
                GameCard(
                  title: 'Inscription',
                  imagePath: 'assets/images/marvel.jpg',
                  description:
                  'Formulaire d’inscription complet avec champs obligatoires.',
                  price: '',
                  navigateToRegister: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
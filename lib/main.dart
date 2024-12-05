import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: Scaffold(

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text(
                      'À propos du barça',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Colors.blue,
                      ),
                    ),
                     SizedBox(height: 50),
                     Text(
                      textAlign: TextAlign.center,
                      'Lors de la saison 2024-2025, le FC Barcelone est engagé dans 4 compétitions officielles : championnat d\'Espagne, Ligue des Champions, Coupe du Roi et Supercoupe d\'Espagne.',
                      style: TextStyle(
                        fontSize: 16 ,
                        backgroundColor: Colors.red,
                        ),
                    ),

                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star, color: Colors.yellow),
                        Icon(Icons.star_half, color: Colors.yellow),
                        SizedBox(width: 100),
                        Text('150 000 avis de fan de foot'),
                      ],
                    ),
                    
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        InfoCard(icon: Icons.diversity_3, label: 'Collectif :', value: '100 %'),
                        InfoCard(icon: Icons.star, label: 'Technique :', value: '5 étoile'),
                        InfoCard(icon: Icons.battery_6_bar, label: 'Forme joueurs', value: '90 %'),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),

              const Spacer(),
              
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'Images/barca.webp', 
                        width: 500,
                        height: 500,
                      ),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const InfoCard({
    required this.icon,
    required this.label,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.grey[700]),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
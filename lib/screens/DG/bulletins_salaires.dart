import 'package:flutter/material.dart';

class BulletinPage extends StatefulWidget {
  @override
  _BulletinPageState createState() => _BulletinPageState();
}

class _BulletinPageState extends State<BulletinPage> {
  // Liste d'exemple de bulletins de salaire (données fictives)
  List<Map<String, dynamic>> bulletins = [
    {
      'employeeName': 'John Doe',
      'position': 'Développeur',
      'baseSalary': 3000.0,
      'bonus': 500.0,
      'deductions': 200.0,
      'netSalary': 3300.0,
      'paymentDate': '2024-10-31'
    },
    {
      'employeeName': 'Jane Smith',
      'position': 'Designer',
      'baseSalary': 2800.0,
      'bonus': 400.0,
      'deductions': 150.0,
      'netSalary': 3050.0,
      'paymentDate': '2024-10-31'
    },
    {
      'employeeName': 'Alice Johnson',
      'position': 'Chef de projet',
      'baseSalary': 3500.0,
      'bonus': 600.0,
      'deductions': 250.0,
      'netSalary': 3850.0,
      'paymentDate': '2024-10-31'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bulletins de Salaire"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Liste des Bulletins de Salaire",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: bulletins.length,
                itemBuilder: (context, index) {
                  var bulletin = bulletins[index];
                  return Card(
                    child: ListTile(
                      title: Text(bulletin['employeeName']),
                      subtitle: Text(
                          "Poste: ${bulletin['position']} | Date: ${bulletin['paymentDate']}"),
                      trailing: IconButton(
                        icon: const Icon(Icons.info),
                        onPressed: () {
                          _showBulletinDetails(bulletin);
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Affiche les détails du bulletin de salaire
  void _showBulletinDetails(Map<String, dynamic> bulletin) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("${bulletin['employeeName']} - Bulletin de Salaire"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Poste: ${bulletin['position']}"),
              Text("Salaire de base: ${bulletin['baseSalary']} FCFA"),
              Text("Prime: ${bulletin['bonus']} FCFA"),
              Text("Déductions: ${bulletin['deductions']} FCFA"),
              Text("Salaire net: ${bulletin['netSalary']} FCFA"),
              Text("Date de paiement: ${bulletin['paymentDate']}"),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Fermer"),
            ),
          ],
        );
      },
    );
  }
}
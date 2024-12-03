import 'package:flutter/material.dart';

class DeviceCarePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consejos de Cuidado y Mantenimiento de Dispositivos"),
        backgroundColor: Color(0xFF4C53A5), // Color similar a los otros elementos
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildAdviceCard(
            context,
            title: "Limpieza regular",
            icon: Icons.cleaning_services,
            description:
                "Limpia tu dispositivo con un paño suave y seco para evitar que el polvo o la suciedad se acumulen en sus puertos, pantalla o teclado. Usa un limpiador específico para pantallas cuando sea necesario.",
          ),
          _buildAdviceCard(
            context,
            title: "Cuidado con el calor",
            icon: Icons.thermostat_outlined,
            description:
                "Evita usar tus dispositivos en lugares calurosos o cerca de fuentes de calor. El exceso de temperatura puede dañar los componentes internos y afectar la duración de la batería.",
          ),
          _buildAdviceCard(
            context,
            title: "Uso de protectores",
            icon: Icons.security,
            description:
                "Usar fundas o carcasas protectoras puede ayudar a evitar daños por caídas o golpes. Además, un protector de pantalla puede prevenir rayaduras y daños en la pantalla táctil.",
          ),
          _buildAdviceCard(
            context,
            title: "Actualizaciones frecuentes",
            icon: Icons.update,
            description:
                "Mantén siempre tu dispositivo actualizado con las últimas versiones de software para mejorar la seguridad, el rendimiento y corregir errores.",
          ),
          _buildAdviceCard(
            context,
            title: "Carga adecuada",
            icon: Icons.battery_charging_full,
            description:
                "Evita cargar el dispositivo hasta el 100% constantemente. Es preferible mantener la carga entre el 20% y el 80% para prolongar la vida útil de la batería.",
          ),
          _buildAdviceCard(
            context,
            title: "Respaldo de datos",
            icon: Icons.cloud_upload,
            description:
                "Haz copias de seguridad periódicas de tus datos importantes. Puedes usar almacenamiento en la nube o un disco duro externo para proteger tu información.",
          ),
        ],
      ),
    );
  }

  Widget _buildAdviceCard(BuildContext context,
      {required String title,
      required IconData icon,
      required String description}) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 5,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 40,
              color: Color(0xFF4C53A5),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF4C53A5),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import javax.swing.JOptionPane;

public class Main {
    public static void main(String[] args) {
        int cantidad = 0;


        while (cantidad < 5 || cantidad > 15) {
            String entrada = JOptionPane.showInputDialog(
                    "Ingrese la cantidad de puntajes a registrar (entre 5 y 15):"
            );

            if (entrada == null || entrada == "") {
                continue; // Si el usuario cancela o deja vacío, pedir de nuevo
            }

            cantidad = Integer.parseInt(entrada);

            if (cantidad < 5 || cantidad > 15) {
                JOptionPane.showMessageDialog(null,
                        "Valor inválido. Debe estar entre 5 y 15.");
            }
        }


        int[] puntajes = new int[cantidad];

        for (int i = 0; i < cantidad; i++) {
            int puntaje = -1;
            while (puntaje < 0 || puntaje > 100) {
                String entrada = JOptionPane.showInputDialog(
                        "Ingrese el puntaje #" + (i + 1) + " (0 - 100):"
                );

                if (entrada == null || entrada == "") {
                    continue; // Repetir si cancela o deja vacío
                }

                puntaje = Integer.parseInt(entrada);

                if (puntaje < 0 || puntaje > 100) {
                    JOptionPane.showMessageDialog(null,
                            "Valor inválido. Debe estar entre 0 y 100.");
                }
            }
            puntajes[i] = puntaje;
        }


        int max = puntajes[0];
        int min = puntajes[0];
        int suma = 0;
        int conteo90 = 0;

        for (int i = 0; i < cantidad; i++) {
            if (puntajes[i] > max) {
                max = puntajes[i];
            }
            if (puntajes[i] < min) {
                min = puntajes[i];
            }
            if (puntajes[i] >= 90) {
                conteo90++;
            }
            suma += puntajes[i];
        }

        double promedio = (double)suma / cantidad;

        JOptionPane.showMessageDialog(null,
                "Puntaje más alto: " + max +
                        "\nPuntaje más bajo: " + min +
                        "\nPromedio general: " + promedio +
                        "\nCantidad de puntajes >= 90: " + conteo90
        );


        int opcion = 0;
        while (opcion != 4) {
            String entrada = JOptionPane.showInputDialog(
                    "Menú:\n" +
                            "1. Ver todos los puntajes\n" +
                            "2. Ver puntajes aprobados (>=60)\n" +
                            "3. Ver puntajes reprobados (<60)\n" +
                            "4. Salir\n" +
                            "Ingrese su opción:"
            );

            if (entrada == null || entrada == "") {
                continue;
            }

            opcion = Integer.parseInt(entrada);

            if (opcion == 1) {
                String todos = "";
                for (int i = 0; i < cantidad; i++) {
                    todos += puntajes[i] + " ";
                }
                JOptionPane.showMessageDialog(null, "Todos los puntajes:\n" + todos);
            } else if (opcion == 2) {
                String aprobados = "";
                for (int i = 0; i < cantidad; i++) {
                    if (puntajes[i] >= 60) {
                        aprobados += puntajes[i] + " ";
                    }
                }
                JOptionPane.showMessageDialog(null, "Puntajes aprobados:\n" + aprobados);
            } else if (opcion == 3) {
                String reprobados = "";
                for (int i = 0; i < cantidad; i++) {
                    if (puntajes[i] < 60) {
                        reprobados += puntajes[i] + " ";
                    }
                }
                JOptionPane.showMessageDialog(null, "Puntajes reprobados:\n" + reprobados);
            } else if (opcion == 4) {
                JOptionPane.showMessageDialog(null, "Gracias por usar el programa");
            } else {
                JOptionPane.showMessageDialog(null, "!!!Opción inválida!!!Intente de nuevo");
            }
        }
    }
}



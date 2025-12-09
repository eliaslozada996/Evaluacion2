<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Puntajes</title>
    <style>
        body { font-family: Arial, sans-serif; padding: 20px; }
        .hidden { display: none; }
        button { margin: 5px; }
        #result { margin-top: 20px; white-space: pre-wrap; }
    </style>
</head>
<body>
    <h1>Registro de Puntajes</h1>

    <!-- Paso 1: Cantidad de puntajes -->
    <div id="cantidadDiv">
        <label>Ingrese la cantidad de puntajes a registrar (5-15): </label>
        <input type="number" id="cantidadInput" min="5" max="15">
        <button onclick="guardarCantidad()">Aceptar</button>
        <p id="cantidadError" style="color:red;"></p>
    </div>

    <!-- Paso 2: Ingreso de puntajes -->
    <div id="puntajesDiv" class="hidden">
        <p id="puntajeTexto"></p>
        <input type="number" id="puntajeInput" min="0" max="100">
        <button onclick="guardarPuntaje()">Aceptar</button>
        <p id="puntajeError" style="color:red;"></p>
    </div>

    <!-- Paso 3: Menú de opciones -->
    <div id="menuDiv" class="hidden">
        <h2>Menú</h2>
        <button onclick="verTodos()">1. Ver todos los puntajes</button>
        <button onclick="verAprobados()">2. Ver puntajes aprobados (>=60)</button>
        <button onclick="verReprobados()">3. Ver puntajes reprobados (<60)</button>
        <button onclick="salir()">4. Salir</button>
    </div>

    <div id="result"></div>

    <script>
        let cantidad = 0;
        let puntajes = [];
        let index = 0;

        // Validación y almacenamiento de cantidad
        function guardarCantidad() {
            const input = document.getElementById('cantidadInput').value;
            if (input === "" || input < 5 || input > 15) {
                document.getElementById('cantidadError').textContent = "Valor inválido. Debe estar entre 5 y 15.";
                return;
            }
            cantidad = parseInt(input);
            document.getElementById('cantidadDiv').classList.add('hidden');
            document.getElementById('puntajesDiv').classList.remove('hidden');
            document.getElementById('puntajeTexto').textContent = `Ingrese el puntaje #1 (0-100):`;
        }

        // Validación y almacenamiento de puntajes
        function guardarPuntaje() {
            const input = document.getElementById('puntajeInput').value;
            if (input === "" || input < 0 || input > 100) {
                document.getElementById('puntajeError').textContent = "Valor inválido. Debe estar entre 0 y 100.";
                return;
            }
            puntajes.push(parseInt(input));
            index++;
            document.getElementById('puntajeInput').value = "";
            document.getElementById('puntajeError').textContent = "";

            if (index < cantidad) {
                document.getElementById('puntajeTexto').textContent = `Ingrese el puntaje #${index + 1} (0-100):`;
            } else {
                document.getElementById('puntajesDiv').classList.add('hidden');
                mostrarResumen();
                document.getElementById('menuDiv').classList.remove('hidden');
            }
        }

        // Cálculo de máximo, mínimo, promedio y conteo >=90
        function mostrarResumen() {
            let max = puntajes[0];
            let min = puntajes[0];
            let suma = 0;
            let conteo90 = 0;

            for (let i = 0; i < puntajes.length; i++) {
                if (puntajes[i] > max) max = puntajes[i];
                if (puntajes[i] < min) min = puntajes[i];
                if (puntajes[i] >= 90) conteo90++;
                suma += puntajes[i];
            }

            let promedio = (suma / puntajes.length).toFixed(2);

            document.getElementById('result').textContent =
                `Puntaje más alto: ${max}\n` +
                `Puntaje más bajo: ${min}\n` +
                `Promedio general: ${promedio}\n` +
                `Cantidad de puntajes >= 90: ${conteo90}`;
        }

        // Menú de opciones
        function verTodos() {
            document.getElementById('result').textContent = `Todos los puntajes: ${puntajes.join(", ")}`;
        }

        function verAprobados() {
            const aprobados = puntajes.filter(p => p >= 60);
            document.getElementById('result').textContent = `Puntajes aprobados: ${aprobados.join(", ")}`;
        }

        function verReprobados() {
            const reprobados = puntajes.filter(p => p < 60);
            document.getElementById('result').textContent = `Puntajes reprobados: ${reprobados.join(", ")}`;
        }

        function salir() {
            document.getElementById('menuDiv').classList.add('hidden');
            document.getElementById('result').textContent = "Gracias por usar el programa.";
        }
    </script>
</body>
</html>

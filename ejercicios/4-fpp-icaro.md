# La frontera de posibilidades de producción de «Movilidad Ícaro»

### Contexto de la cooperativa
La empresa de inserción juvenil **«Movilidad Ícaro»** fabrica dos tipos de vehículos sostenibles para la ciudad: **Bicicletas de carga** (Bien $X$) y **Patinetes eléctricos** (Bien $Y$). Con sus instalaciones actuales y su equipo de 12 operarios a jornada completa durante un mes, las combinaciones máximas de producción son las siguientes:

> [!tip] Pista para completar la tabla
>
> * **Renuncia de patinetes:** Cantidad total de patinetes que se dejan de producir respecto al punto anterior ($\Delta Y = Y_{\text{inicial}} - Y_{\text{final}}$).
> * **Coste unitario:** Mide cuántos patinetes se sacrifican por **cada bicicleta adicional** obtenida:
>   $$\text{Coste unitario} = \frac{\Delta Y}{\Delta X} = \frac{\text{Patinetes que sacrifico}}{\text{Bicicletas que gano}}$$
> * Presta especial atención al último paso (de E a F): comprueba cuántas bicicletas se producen de más en ese tramo antes de calcular la división.

| Combinación | Bicicletas de carga ($X$) | Patinetes eléctricos ($Y$) | Renuncia de patinetes ($\Delta Y$) | Coste unitario ($\Delta Y / \Delta X$) |
| :---: | :---: | :---: | :---: | :---: |
| **A** | $0$ | $50$ | — | — |
| **B** | $10$ | $46$ | | |
| **C** | $20$ | $38$ | | |
| **D** | $30$ | $26$ | | |
| **E** | $40$ | $10$ | | |
| **F** | $45$ | $0$ | | |

---

### Cuestiones a resolver

#### 1. Análisis numérico del coste de oportunidad
* Completa las dos columnas en blanco de la tabla superior.
* Analiza los resultados de la última columna: ¿el coste de oportunidad unitario se mantiene constante o va aumentando conforme fabricamos más bicicletas?

> [!abstract] Concepto clave: Ley de costes de oportunidad crecientes
> En la realidad económica, los factores de producción **no son perfectamente adaptables ni polivalentes**. Un operario especializado en ajustar cambios de marchas no rinde igual soldando circuitos electrónicos de patinetes. Al forzar la reasignación de recursos hacia un solo bien, su rendimiento decae y el sacrificio del otro producto se incrementa de forma progresiva.

* Con la ayuda de la definición anterior, redacta una breve explicación de por qué ocurre este fenómeno en el taller de «Movilidad Ícaro».

> [!example]- Solución
> **Tabla resuelta**
>
> | Combinación | Bicicletas ($X$) | Patinetes ($Y$) | Renuncia total ($\Delta Y$) | Coste unitario ($\lvert\Delta Y\rvert / \Delta X$) |
> | :---: | :---: | :---: | :---: | :---: |
> | **A** | $0$ | $50$ | — | — |
> | **B** | $10$ | $46$ | **$4$ patinetes** $(50 - 46)$ | **$0,4$ patinetes/bici** $(4 / 10)$ |
> | **C** | $20$ | $38$ | **$8$ patinetes** $(46 - 38)$ | **$0,8$ patinetes/bici** $(8 / 10)$ |
> | **D** | $30$ | $26$ | **$12$ patinetes** $(38 - 26)$ | **$1,2$ patinetes/bici** $(12 / 10)$ |
> | **E** | $40$ | $10$ | **$16$ patinetes** $(26 - 10)$ | **$1,6$ patinetes/bici** $(16 / 10)$ |
> | **F** | $45$ | $0$ | **$10$ patinetes** $(10 - 0)$ | **$2,0$ patinetes/bici** $(10 / 5)$ |
>
> **Atención al tramo E $\rightarrow$ F.** En el tramo final, la renuncia total parece menor ($10$ frente a los $16$ del tramo anterior), pero se producen **solo 5 bicicletas** ($45 - 40$).
> Aplicando la fórmula: $\frac{10}{5} = \mathbf{2,0}$. El coste unitario no baja aunque la renuncia total sea menor: lo que cuenta es la proportion de patinetes sacrificados por cada bicicleta ganada.
>
> **Análisis del coste creciente**
>
> * **Comportamiento:** el coste de oportunidad unitario es estrictamente **creciente** ($0,4 \rightarrow 0,8 \rightarrow 1,2 \rightarrow 1,6 \rightarrow 2,0$).
> * **Justificación económica:** los factores de producción (trabajadores y máquinas) **no son perfectamente versátiles ni homogéneos**. Al principio se reasigna a los trabajadores más aptos para fabricar bicicletas; para conseguir las últimas unidades (tramo E $\rightarrow$ F), hay que desviar a los operarios especializados en patinetes, cuyo rendimiento montando bicicletas es bajo, sacrificando un volumen elevado de patinetes a cambio de muy pocas bicicletas adicionales.

---

#### 2. Representación gráfica del modelo

> [!warning] Regla técnica para los ejes
>
> 1. **Eje horizontal ($X$):** Bicicletas de carga. Valor máximo: $45$. Utiliza una escala regular de **5 en 5** o de **10 en 10** (hasta 50).
> 2. **Eje vertical ($Y$):** Patinetes eléctricos. Valor máximo: $50$. Utiliza una escala regular de **10 en 10** (hasta 60).
> 3. No sitúes en los ejes valores desordenados tomados de la tabla (como 26, 38 o 46). Las distancias entre marcas deben ser uniformes en toda la cuadrícula.

* Dibuja los ejes cartesianos y representa con precisión los puntos **A, B, C, D, E y F**.
* Traza la curva de la **FPP**.
* Observa la forma de la línea obtenida: ¿se trata de una recta o presenta curvatura cóncava respecto al origen? ¿Qué relación guarda esa forma geométrica con el comportamiento del coste unitario calculado en la tabla?

> [!example]- Solución
>
> * **Revisión formal:** los ejes deben tener flechas de dirección, rótulos claros con nombre y unidad, y escalas regulares equidistantes.
> * **Forma de la frontera:** la curva es **cóncava** (abombada hacia el exterior respecto al origen).
> * **Vínculo conceptual:** la concavidad gráfica es la expresión geométrica de la **ley de costes de oportunidad crecientes**. Si los costes fuesen constantes, la FPP sería una recta descendente de pendiente fija.

---

#### 3. Diagnóstico de situaciones de producción

> [!note] Recordatorio: Las tres zonas de la FPP
>
> * **Sobre la curva:** Puntos **eficientes** (pleno empleo de recursos y uso de la mejor tecnología disponible).
> * **Interior:** Puntos **ineficientes** (recursos ociosos, desempleo o fallos de organización).
> * **Exterior:** Puntos **inalcanzables** (imposibles con los recursos y la tecnología actuales).

Sitúa los siguientes puntos en tu gráfico y responde a las preguntas:
* **Punto R ($15$ bicicletas, $30$ patinetes):** Clasifícalo. ¿Qué problema organizativo refleja en el taller? Sin reducir las 15 bicicletas, ¿cuántos patinetes adicionales se podrían fabricar si la producción fuera eficiente?
* **Punto S ($25$ bicicletas, $40$ patinetes):** Clasifícalo. Un cliente solicita este pedido para entrega inmediata. ¿Puede la cooperativa atenderlo con sus medios actuales? ¿Qué proceso económico requeriría para conseguirlo?
* **Punto T ($30$ bicicletas, $26$ patinetes):** Clasifícalo indicando qué propiedad cumple respecto al aprovechamiento de los factores de producción.

> [!example]- Solución
> **Punto R (15 bicis, 30 patinetes)**
>
> * **Clasificación:** **ineficiente** (zona interior bajo la FPP).
> * **Causas posibles:** desempleo encubierto, averías, desorganización en el taller o materias primas defectuosas.
> * **Margen de mejora:** con 15 bicicletas, el potencial máximo de la fábrica se sitúa en torno a los **$42$ patinetes** (valor interpolado entre B y C). Por tanto, podrían fabricarse unos **$12$ patinetes adicionales** sin reducir las bicicletas si se operara al 100 % de eficiencia.
>
> **Punto S (25 bicis, 40 patinetes)**
>
> * **Clasificación:** **inalcanzable** (zona exterior sobre la FPP). Con 25 bicicletas, el límite técnico actual ronda los $32$ patinetes.
> * **Respuesta al cliente:** la cooperativa no puede atender el pedido este mes con sus medios actuales. Para alcanzarlo necesitaría un proceso de **crecimiento económico** (más personal, más maquinaria o subcontratación).
>
> **Punto T (30 bicis, 26 patinetes)**
>
> * **Clasificación:** **eficiente** (coincide exactamente con la combinación técnica **D** sobre la curva). Representa el pleno empleo y uso óptimo de todos los factores disponibles.

---

#### 4. Dinámica del modelo: desplazamientos de la FPP

> [!info] Pista para los desplazamientos
>
> * Cuando la dotación de factores cambia para **ambos bienes simultáneamente**, la frontera se desplaza en paralelo.
> * Cuando la variación técnica o de recursos afecta a **un solo bien**, la curva efectúa un movimiento de pivote: el punto de corte del bien inalterado permanece fijo.

Dibuja tres gráficos esquemáticos a mano alzada que representen la reacción de la FPP original ante cada uno de los siguientes escenarios independientes:
* **Caso 1:** Una subvención de capital permite ampliar las instalaciones y contratar a 6 nuevos operarios aptos para fabricar ambos productos.
* **Caso 2:** Se incorpora una máquina de soldadura automática que incrementa exclusivamente la productividad del montaje de **patinetes eléctricos**.
* **Caso 3:** Una inundación inutiliza de forma irreversible el 40 % de la maquinaria del taller.

> [!example]- Solución
>
> * **Caso 1 (nuevos operarios generales):** la curva de la FPP se desplaza hacia la **derecha y arriba** de forma simétrica, porque aumenta la capacidad máxima de producir ambos bienes. Es un **desplazamiento paralelo**.
> * **Caso 2 (mejora técnica solo en patinetes):** el punto de corte con el eje horizontal ($X$) se mantiene invariante en **$45$ bicicletas**, mientras que el punto de corte en el eje vertical ($Y$) se eleva por encima de los **$50$ patinetes**. Es un **desplazamiento asimétrico (pivote)**.
> * **Caso 3 (destrucción de capital físico por inundación):** toda la FPP experimenta una **contracción productiva** hacia la **izquierda y abajo**. Se reducen las posibilidades globales de producción de la cooperativa.

---

#### 5. Pensamiento crítico y toma de decisiones
Las combinaciones **A** ($0$ bicis, $50$ patinetes), **F** ($45$ bicis, $0$ patinetes) y **C** ($20$ bicis, $38$ patinetes) se sitúan sobre la frontera y son técnicamente eficientes:
* ¿Existe algún criterio científico objetivo dentro de la economía positiva que determine cuál de esos tres puntos es «el mejor» para la sociedad?
* En una economía de mercado, ¿a través de qué mecanismo se decide en cuál de las combinaciones eficientes producirá finalmente la empresa?

> [!example]- Solución
>
> * **¿Existe un punto «óptimo objetivo»?**
>
>   **No desde el análisis económico positivo.** Todos los puntos situados sobre la curva son técnicamente eficientes por igual. Elegir entre producir solo bicicletas, solo patinetes o un reparto equilibrado responde a juicios de valor y prioridades sociales (**economía normativa**).
>
> * **¿Qué mecanismo decide la posición final?**
>
>   En una economía de mercado, la posición la determinan **la soberanía del consumidor, la demanda y el sistema de precios**. Si sube la demanda de patinetes, sus precios subirán y los mayores beneficios guiarán a la empresa a situarse cerca de combinaciones como A o B; si la preferencia ciudadana se inclina por el ciclismo urbano, las señales del mercado la desplazarán hacia D, E o F.

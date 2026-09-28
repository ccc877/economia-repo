# El umbral de rentabilidad: cálculo, representación gráfica y toma de decisiones

> [!example] Ejemplo modelo resuelto: Fabricación de camisetas
> **Enunciado:**
> Una empresa confecciona camisetas con los siguientes datos mensuales:
> * **Precio de venta ($P$):** 25 € por camiseta.
> * **Coste variable unitario ($CV_u$):** 10 € por camiseta.
> * **Costes fijos mensuales ($CF$):** 6000 €.
> 
> ---
> 
> **Resolución paso a paso:**
> 
> 1. **Identificar la fórmula y el margen de contribución:**
>    $$Q_0 = \frac{CF}{P - CV_u}$$
>    * Margen unitario: $P - CV_u = 25 - 10 = 15\text{ € por camiseta}$. Cada unidad vendida deja 15 € netos para financiar los costes fijos.
> 
> 2. **Sustituir los datos y calcular:**
>    $$Q_0 = \frac{6000}{25 - 10} = \frac{6000}{15} = \mathbf{400\text{ camisetas}}$$
> 
> 3. **Interpretación económica:**
>    * Si la empresa vende exactamente **400 camisetas**, no obtiene pérdidas ni ganancias ($B = 0$). Sus ingresos totales igualan a sus costes totales ($IT = CT = 400 \cdot 25 = 10\ 000\text{ €}$).
>    * Si vende **menos de 400 camisetas**, entra en **zona de pérdidas** ($B < 0$).
>    * A partir de la camiseta **401**, entra en **zona de beneficios** ($B > 0$), sumando 15 € netos de ganancia por cada camiseta adicional que comercialice.

---

> [!tip] Píldora gráfica: Cómo dibujar el punto muerto
> Para representar el umbral de rentabilidad en unos ejes cartesianos (eje horizontal: cantidad $Q$; eje vertical: valores monetarios en euros €):
> 
> 1. **Línea de costes fijos ($CF$):** Es una recta totalmente horizontal a la altura de los costes fijos (en el ejemplo, a la altura de 6000 €).
> 2. **Recta de ingresos totales ($IT = P \cdot Q$):** Parte siempre del origen $(0, 0)$ y pasa por el punto muerto $(Q_0, IT_0)$.
> 3. **Recta de costes totales ($CT = CF + CV_u \cdot Q$):** No parte del origen, sino del punto $(0, CF)$ en el eje vertical (empieza en 6000 €). Pasa exactamente por el punto muerto $(Q_0, CT_0)$, donde se cruza con la recta de ingresos.
> 4. **Identificación de zonas:**
>    * A la izquierda de $Q_0$, la recta de $CT$ está por encima de la de $IT$: **zona de pérdidas**.
>    * A la derecha de $Q_0$, la recta de $IT$ supera a la de $CT$: **zona de beneficios**.

---

> [!info] Píldora avanzada: Producción para alcanzar un beneficio deseado
> Si la empresa no se conforma con no perder dinero ($B = 0$) y se fija como meta lograr un **beneficio objetivo** ($B_{\text{obj}}$), la cantidad que debe producir y vender ($Q'$) se obtiene despejando:
> 
> $$B_{\text{obj}} = IT - CT \rightarrow B_{\text{obj}} = Q \cdot (P - CV_u) - CF$$
> $$Q' = \frac{CF + B_{\text{obj}}}{P - CV_u}$$

---

## Actividades prácticas

**1.** A partir de los datos del ejemplo modelo de la empresa de camisetas ($P = 25\text{ €}$, $CV_u = 10\text{ €}$, $CF = 6000\text{ €}$, $Q_0 = 400\text{ camisetas}$):

* **a)** Calcula el valor en euros de los ingresos totales ($IT$) y de los costes totales ($CT$) cuando la empresa alcanza el umbral de rentabilidad.
* **b)** Enumera las coordenadas $(Q, \text{€})$ necesarias para trazar con regla en unos ejes cartesianos las rectas de $CF$, $IT$ y $CT$, tomando como referencia los valores para $Q = 0$, el umbral $Q = 400$ y un volumen superior de $Q = 600$ unidades.
* **c)** ¿Cuántas camisetas deberá vender la empresa si desea obtener un beneficio mensual neto de 3000 €?

> [!example]- Solución
> **a) Valores monetarios en el punto muerto ($Q = 400$):**
> * $IT = P \cdot Q = 25 \cdot 400 = \mathbf{10\ 000\text{ €}}$.
> * $CT = CF + (CV_u \cdot Q) = 6000 + (10 \cdot 400) = 6000 + 4000 = \mathbf{10\ 000\text{ €}}$.
> * Ambos importes coinciden, verificando que $B = 10\ 000 - 10\ 000 = 0\text{ €}$.
>
> **b) Puntos para la representación gráfica:**
> * **Recta de $CF$:** pasa por $(0, 6000)$, $(400, 6000)$ y $(600, 6000)$ (recta horizontal plana).
> * **Recta de $IT$:** pasa por el origen $(0, 0)$, por el punto muerto $(400, 10\ 000)$ y para 600 unidades alcanza $(600, 15\ 000)$ ($25 \cdot 600$).
> * **Recta de $CT$:** arranca en el eje vertical en $(0, 6000)$, cruza el punto muerto en $(400, 10\ 000)$ y para 600 unidades alcanza $(600, 12\ 000)$ ($6000 + 10 \cdot 600$).
>
> **c) Venta para beneficio objetivo ($B = 3000\text{ €}$):**
> $$Q' = \frac{CF + B_{\text{obj}}}{P - CV_u} = \frac{6000 + 3000}{25 - 10} = \frac{9000}{15} = \mathbf{600\text{ camisetas}}$$
> *Comprobación:* $IT = 600 \cdot 25 = 15\ 000\text{ €}$; $CT = 6000 + 600 \cdot 10 = 12\ 000\text{ €}$; Beneficio = $15\ 000 - 12\ 000 = 3000\text{ €}$.

---

**2.** Una empresa juvenil se dedica a la fabricación y comercialización de mochilas escolares recicladas. Afronta los siguientes costes mensuales:
* Alquiler del taller y amortización de maquinaria: 3500 €.
* Gastos de publicidad, asesoría y suministros fijos (luz, internet): 1500 €.
* Materiales reciclados y cremalleras: 12 € por mochila.
* Mano de obra directa a destajo y embalaje: 8 € por mochila.

El precio de venta unitario fijado es de 45 € por mochila.

* **a)** Clasifica los costes de la empresa en fijos ($CF$) y variables unitarios ($CV_u$).
* **b)** Calcula el umbral de rentabilidad mensual de la empresa e interpreta el resultado obtenido.
* **c)** Si el taller tiene una capacidad máxima de producción de 300 mochilas al mes por limitaciones técnicas, ¿es viable el negocio? Razona tu respuesta.
* **d)** Si los socios consiguen abaratar los materiales en 5 € por unidad sin alterar los costes fijos ni el precio de venta, ¿cuál será el nuevo punto muerto? ¿Permitirá esto hacer viable el taller con su límite de 300 mochilas?


> [!example]- Solución
> **a) Clasificación de costes:**
> * **Costes fijos ($CF$):** $3500 + 1500 = \mathbf{5000\text{ €/mes}}$.
> * **Coste variable unitario ($CV_u$):** $12 + 8 = \mathbf{20\text{ €/mochila}}$.
>
> **b) Umbral de rentabilidad:**
> $$Q_0 = \frac{CF}{P - CV_u} = \frac{5000}{45 - 20} = \frac{5000}{25} = \mathbf{200\text{ mochilas/mes}}$$
> *Interpretación:* La empresa necesita producir y vender 200 mochilas al mes para saldar sus costes fijos y variables. Por debajo de 200 mochilas incurre en pérdidas; por encima, obtiene beneficios a razón de 25 € por mochila adicional vendida.
>
> **c) Viabilidad con capacidad de 300 mochilas:**
> * El negocio **sí es viable**, ya que el punto muerto ($Q_0 = 200$) es inferior a la capacidad máxima de producción ($300$). La empresa dispone de un margen de seguridad de 100 mochilas con las que puede generar beneficios netos mensuales de hasta $100 \cdot 25 = 2500\text{ €}$.
>
> **d) Reducción del coste variable:**
> * Nuevo $CV_u = 20 - 5 = 15\text{ €/mochila}$.
> * Nuevo margen de contribución: $P - CV_u = 45 - 15 = 30\text{ €}$.
> * Nuevo umbral: $Q_0' = \frac{5000}{30} = 166{,}67 \rightarrow \mathbf{167\text{ mochilas/mes}}$.
> * El umbral baja de 200 a 167 mochilas, por lo que la empresa se vuelve todavía más viable y menos arriesgada, ampliando su zona potencial de beneficios dentro del límite técnico de las 300 mochilas.

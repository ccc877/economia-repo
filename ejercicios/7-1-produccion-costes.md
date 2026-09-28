# Producción, costes y maximización del beneficio a corto plazo

> [!info] Fórmulas de producción y costes a corto plazo
> A corto plazo, al menos un factor de producción permanece fijo (el capital o las instalaciones, $K$), mientras que otros son variables (el trabajo, $L$):
> 
> * **Magnitudes de producción:**
>   * **Producto medio ($PMe_L$):** rendimiento por trabajador $\rightarrow PMe_L = \dfrac{Q}{L}$
>   * **Producto marginal ($PMg_L$):** producción adicional que aporta el último trabajador incorporado $\rightarrow PMg_L = \dfrac{\Delta Q}{\Delta L}$
> 
> * **Magnitudes de costes:**
>   * **Coste total ($CT$):** suma de costes fijos y variables $\rightarrow CT = CF + CV$
>   * **Coste medio ($CMe$):** coste por unidad fabricada $\rightarrow CMe = \dfrac{CT}{Q}$
>   * **Coste marginal ($CMg$):** coste de producir una unidad adicional $\rightarrow CMg = \dfrac{\Delta CT}{\Delta Q}$
> 
> * **Resultados económicos:**
>   * **Ingreso total ($IT$):** $IT = P \cdot Q$
>   * **Beneficio ($B$):** $B = IT - CT$

---

> [!tip] Claves teóricas para el análisis
>
> 1. **Ley de rendimientos decrecientes:** Al añadir trabajadores sucesivamente a unas instalaciones fijas, la producción al principio crece a ritmo creciente por la división y especialización del trabajo ($PMg$ aumenta). Sin embargo, llega un momento a partir del cual los factores fijos se saturan y los nuevos trabajadores estorban, de modo que la producción total crece a ritmo decreciente ($PMg$ disminuye).
> 2. **Relación inversa entre $PMg$ y $CMg$:**
>    * Si el $PMg$ es creciente, cada unidad extra de producto requiere menos esfuerzo y tiempo; por tanto, el **$CMg$ disminuye**.
>    * Cuando entra en juego la ley de rendimientos decrecientes y el $PMg$ cae, cada unidad adicional resulta más difícil de obtener; por consiguiente, el **$CMg$ se dispara**.
> 3. **Regla de maximización del beneficio ($P = CMg$):**
>    * La empresa obtiene **beneficios positivos** únicamente cuando el precio supera al coste medio ($P > CMe$).
>    * Para saber **cuánto conviene producir**, se compara el precio con el coste marginal: si $P > CMg$, fabricar esa unidad adicional aporta más ingresos que costes y el beneficio total sube. Si $P < CMg$, producirla genera pérdidas marginales y el beneficio global se reduce.

---

## Actividades prácticas

**1.** Una empresa dedicada a la fabricación de balones de fútbol dispone de un local alquilado por 500 € al mes (coste fijo) y puede contratar entre 0 y 6 trabajadores, a los que abona un salario de 1000 € mensuales a cada uno (coste variable). El precio de venta en el mercado es de 10 € por balón. La evolución de la producción según la plantilla contratada es la siguiente:

| Trabajadores ($L$) | Producción total en balones ($Q$) |
| :---: | :---: |
| 0 | 0 |
| 1 | 100 |
| 2 | 220 |
| 3 | 380 |
| 4 | 500 |
| 5 | 580 |
| 6 | 600 |

* **a)** Reproduce y completa en tu cuaderno la tabla con las columnas: $PMe$, $PMg$, $CF$, $CV$, $CT$, $CMe$, $CMg$, Precio ($P$), $IT$ y Beneficio ($B$).
* **b)** Analiza la evolución del producto marginal ($PMg$) e identifica las dos etapas de la producción: ¿a partir de qué trabajador se manifiesta la ley de rendimientos decrecientes?
* **c)** Explica la relación gráfica y matemática que existe entre el producto marginal ($PMg$) y el coste marginal ($CMg$) a lo largo de toda la tabla.
* **d)** ¿Qué número de trabajadores contratará la empresa para maximizar sus beneficios? Justifica la decisión aplicando la lógica marginal ($P$ frente a $CMg$) y el umbral de rentabilidad ($P$ frente a $CMe$).

> [!example]- Solución
>
> * **a) Tabla completa:**
>
> | $L$ | $Q$ | $PMe_L$ | $PMg_L$ | $CF$ | $CV$ | $CT$ | $CMe$ | $CMg$ | $P$ | $IT$ | Beneficio |
> | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
> | **0** | 0 | — | — | 500 | 0 | 500 | — | — | 10 | 0 | $-500$ |
> | **1** | 100 | 100 | 100 | 500 | 1000 | 1500 | 15,00 | 10,00 | 10 | 1000 | $-500$ |
> | **2** | 220 | 110 | 120 | 500 | 2000 | 2500 | 11,36 | 8,33 | 10 | 2200 | $-300$ |
> | **3** | 380 | 126,67 | 160 | 500 | 3000 | 3500 | 9,21 | 6,25 | 10 | 3800 | $+300$ |
> | **4** | 500 | 125 | 120 | 500 | 4000 | 4500 | 9,00 | 8,33 | 10 | 5000 | $\mathbf{+500}$ |
> | **5** | 580 | 116 | 80 | 500 | 5000 | 5500 | 9,48 | 12,50 | 10 | 5800 | $+300$ |
> | **6** | 600 | 100 | 20 | 500 | 6000 | 6500 | 10,83 | 50,00 | 10 | 6000 | $-500$ |
>
> *Notas de cálculo:*
> * $PMg = \Delta Q / \Delta L$ (por ejemplo, para $L=2$: $(220 - 100)/1 = 120$).
> * $CMe = CT / Q$ (por ejemplo, para $L=3$: $3500 / 380 = 9{,}21\text{ €}$).
> * $CMg = \Delta CT / \Delta Q$ (por ejemplo, para $L=3$: $(3500 - 2500) / (380 - 220) = 1000 / 160 = 6{,}25\text{ €}$).
>
> * **b) Etapas y rendimientos decrecientes:**
>   * **Etapa 1 (rendimientos marginales crecientes):** Entre $L=1$ y $L=3$, el $PMg$ crece de forma continuada ($100 \rightarrow 120 \rightarrow 160$). La plantilla se beneficia de la especialización de tareas en el local.
>   * **Etapa 2 (rendimientos marginales decrecientes):** A partir del **cuarto trabajador**, el $PMg$ comienza a caer ($120 \rightarrow 80 \rightarrow 20$). Los trabajadores empiezan a molestarse o a compartir maquinaria, con lo que cada empleado adicional añade menos producto que el anterior.
>
> * **c) Relación entre $PMg$ y $CMg$:**
>   * Muestran un comportamiento exactamente inverso:
>     * Cuando el $PMg$ aumenta ($L=1$ a $L=3$), el $CMg$ desciende de 10 € a 6,25 €, alcanzando en $L=3$ su valor mínimo. Producir cada balón extra es cada vez más barato.
>     * Cuando el $PMg$ disminuye ($L=4$ en adelante), el $CMg$ sube de forma acelerada ($8{,}33 \rightarrow 12{,}50 \rightarrow 50\text{ €}$). Producir balones adicionales se encarece drásticamente.
>
> * **d) Nivel óptimo de empleo y maximización del beneficio:**
>   * La empresa contratará **4 trabajadores**, con los que logra el máximo beneficio posible (500 €).
>   * **Qué niveles dan beneficio:** Con 3, 4 y 5 trabajadores el beneficio es positivo, porque es la zona en la que el precio ($10\text{ €}$) supera al coste medio ($CMe < 10\text{ €}$). Con 6, el beneficio vuelve a ser negativo.
>   * **Por qué no quedarse en 3 trabajadores:** Al pasar de 3 a 4, el coste marginal de cada balón nuevo es de 8,33 €, inferior al precio de venta. Como cada balón aporta más de lo que cuesta ($P > CMg$), el beneficio total sube de 300 € a 500 €.
>   * **Por qué no seguir a 5 ni a 6:** El quinto trabajador no es rentable, aunque la empresa no pierda dinero con él. Su coste marginal es de 12,50 €, que supera el precio de 10 € ($CMg > P$): cada balón adicional sale a pérdida, y el beneficio total cae de 500 € a 300 €. Con el sexto, el coste marginal se dispara a 50 € y el beneficio se vuelve negativo. El óptimo no es «cuántos dan beneficio», sino **cuántos los maximizan**: 4.

---

**2.** Un taller artesanal de tablas de surf presenta los siguientes datos en su proceso de producción:

* Para fabricar 10 tablas, su coste total es de 2000 € ($CMe = 200\text{ €}$).
* Si decide ampliar la producción a 11 tablas, su coste total pasa a ser de 2180 €.
* Si amplía a 12 tablas, el coste total asciende a 2420 €.

Sabiendo que el precio de mercado de cada tabla es de 210 €:

* **a)** Calcula el coste marginal ($CMg$) de la tabla número 11 y de la tabla número 12.
* **b)** Razona, mediante el enfoque marginal, si a la empresa le compensa producir la tabla número 11 y si le conviene fabricar la tabla número 12.

> [!example]- Solución
>
> * **a) Coste marginal:**
>   * Tabla 11: $CMg_{11} = \frac{2180 - 2000}{11 - 10} = \mathbf{180\text{ €}}$.
>   * Tabla 12: $CMg_{12} = \frac{2420 - 2180}{12 - 11} = \mathbf{240\text{ €}}$.
> * **b) Decisión marginal ($P = 210\text{ €}$):**
>   * **Tabla 11:** Sí compensa producirla, ya que el precio que ingresa la empresa (210 €) es superior al coste adicional de fabricarla (180 €), sumando 30 € netos al beneficio.
>   * **Tabla 12:** No compensa producirla, puesto que el coste de producirla (240 €) es mayor que el precio de venta (210 €). Producir esta duodécima unidad restaría 30 € al beneficio acumulado.
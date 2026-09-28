# Introducción al umbral de rentabilidad: de los beneficios al punto muerto

> [!info] Píldora teórica 1: Los componentes del resultado empresarial
> Para saber si un negocio gana o pierde dinero, recurrimos a la ecuación básica del beneficio:
> 
> $$\text{Beneficio } (B) = \text{Ingresos totales } (IT) - \text{Costes totales } (CT)$$
> 
> Si desglosamos cada término en función del número de unidades producidas y vendidas ($Q$):
> 
> 1. **Ingresos totales ($IT$):** Es el dinero que entra por las ventas.
>    $$IT = P \cdot Q$$
>    *(donde $P$ es el precio de venta unitario).*
> 
> 2. **Costes totales ($CT$):** Es la suma de lo que la empresa gasta obligatoriamente:
>    $$CT = CF + CV$$
>    * **Costes fijos ($CF$):** No dependen de la cantidad que se fabrique (alquiler del local, seguros, cuota de autónomos). Se pagan aunque $Q = 0$.
>    * **Costes variables ($CV$):** Dependen directamente de la cantidad fabricada. Si fabricar una unidad cuesta $CV_u$ en materias primas o energía:
>      $$CV = CV_u \cdot Q$$
>      *(donde $CV_u$ es el coste variable unitario o por unidad).*
> 
> Por tanto, la fórmula ampliada del beneficio queda así:
> $$B = (P \cdot Q) - (CF + CV_u \cdot Q)$$

---

> [!info] Píldora teórica 2: Deducción matemática del umbral de rentabilidad
> El **umbral de rentabilidad** o **punto muerto** ($Q_0$) es el número exacto de unidades vendidas con el que la empresa ni gana ni pierde dinero: el beneficio es cero ($B = 0$). En ese punto, los ingresos cubren justamente la totalidad de los costes ($IT = CT$).
> 
> Si imponemos la condición $B = 0$ en la fórmula ampliada y despejamos la cantidad ($Q$):
> 
> 1. Partimos de la condición de equilibrio:
>    $$(P \cdot Q) - (CF + CV_u \cdot Q) = 0$$
> 
> 2. Quitamos el paréntesis:
>    $$P \cdot Q - CF - CV_u \cdot Q = 0$$
> 
> 3. Dejamos los términos con $Q$ a un lado y pasamos los costes fijos al otro:
>    $$P \cdot Q - CV_u \cdot Q = CF$$
> 
> 4. Sacamos factor común a la incógnita $Q$:
>    $$Q \cdot (P - CV_u) = CF$$
> 
> 5. Despejamos $Q_0$:
>    $$Q_0 = \frac{CF}{P - CV_u}$$

---

> [!tip] Píldora teórica 3: ¿Qué significa $(P - CV_u)$?
> La resta del denominador $(P - CV_u)$ se denomina **margen de cobertura** o **margen de contribución unitario**.
> 
> * Cada vez que la empresa vende un producto a un precio $P$, primero tiene que pagar lo que costó fabricar ese producto específico ($CV_u$).
> * El dinero que sobra de esa venta es el margen neto disponible para ir «amortizando» o cubriendo la bolsa de los costes fijos ($CF$).
> * Una vez que entre todas las ventas han cubierto por completo los costes fijos, cada unidad vendida adicional aportará ese margen íntegro directamente al **beneficio neto**.

---

> [!info] Píldora teórica 4: Las tres zonas del punto muerto
> 
> * **Si $Q < Q_0$ (zona de pérdidas):** El volumen de ventas es insuficiente. $IT < CT \rightarrow B < 0$.
> * **Si $Q = Q_0$ (umbral o punto muerto):** Las ventas cubren exactamente los costes. $IT = CT \rightarrow B = 0$.
> * **Si $Q > Q_0$ (zona de beneficios):** Superado el umbral, la empresa gana dinero. $IT > CT \rightarrow B > 0$.

---

## Actividades prácticas

**1.** Un grupo de estudiantes de Bachillerato decide montar una pequeña empresa de camisetas personalizadas para financiar su viaje de estudios. Tienen los siguientes datos:
* Alquiler de la máquina estampadora: 300 € (pago único fijo).
* Coste de cada camiseta en blanco y tinta: 5 € por camiseta ($CV_u$).
* Precio de venta al público fijado: 15 € por camiseta ($P$).

* **a)** ¿Cuánto dinero «limpio» deja cada camiseta vendida para ayudar a pagar el alquiler de la máquina? Calcula el margen de contribución unitario ($P - CV_u$).
* **b)** Calcula los ingresos totales ($IT$), los costes totales ($CT$) y el beneficio ($B$) si venden:
  * 10 camisetas.
  * 20 camisetas.
  * 30 camisetas.
  * 40 camisetas.
* **c)** A la vista de los resultados del apartado anterior, ¿cuántas camisetas necesitaban vender como mínimo para empezar a obtener beneficios? Comprueba que coincide exactamente con la fórmula del umbral:
  $$Q_0 = \frac{CF}{P - CV_u}$$

> [!example]- Solución
> **a) Margen de contribución unitario:**
> $$P - CV_u = 15 - 5 = \mathbf{10\text{ € por camiseta}}$$
> Cada camiseta vendida cubre sus propios gastos de tela y tinta y aporta 10 € netos para saldar los 300 € del alquiler de la máquina.
>
> **b) Tabla de resultados:**
>
> | Camisetas ($Q$) | $IT = 15 \cdot Q$ | $CF$ | $CV = 5 \cdot Q$ | $CT = CF + CV$ | $B = IT - CT$ |
> | :---: | :---: | :---: | :---: | :---: | :---: |
> | **10** | 150 € | 300 € | 50 € | 350 € | **$-200\text{ €}$ (pérdidas)** |
> | **20** | 300 € | 300 € | 100 € | 400 € | **$-100\text{ €}$ (pérdidas)** |
> | **30** | 450 € | 300 € | 150 € | 450 € | **$0\text{ €}$ (punto muerto)** |
> | **40** | 600 € | 300 € | 200 € | 500 € | **$+100\text{ €}$ (beneficios)** |
>
> **c) Comprobación:**
> Para empezar a tener beneficios necesitaban vender **30 camisetas**. Aplicando la fórmula:
> $$Q_0 = \frac{CF}{P - CV_u} = \frac{300}{15 - 5} = \frac{300}{10} = \mathbf{30\text{ camisetas}}$$

---

**2.** Un ilustrador diseña y vende láminas artísticas a través de internet. Afronta unos costes fijos mensuales de 800 € (cuota de autónomos, servidor web y programas de diseño). La impresión, papel especial y empaquetado de cada lámina suponen un coste de 4 €. Vende cada lámina por 20 €.

* **a)** Deduce paso a paso, a partir de la ecuación $IT = CT$, cuántas láminas tiene que vender al mes para alcanzar el punto muerto.
* **b)** Si este mes vende 65 láminas, calcula el beneficio o pérdida obtenido mediante la fórmula $B = IT - CT$.
* **c)** Si el mes que viene consigue vender 100 láminas, calcula el nuevo beneficio. Comprueba que el incremento de beneficio coincide con vender 50 láminas por encima del umbral multiplicadas por el margen de contribución.

> [!example]- Solución
> **a) Deducción y cálculo:**
> $$IT = CT \rightarrow 20 \cdot Q = 800 + 4 \cdot Q$$
> $$20 \cdot Q - 4 \cdot Q = 800 \rightarrow 16 \cdot Q = 800 \rightarrow Q_0 = \frac{800}{16} = \mathbf{50\text{ láminas}}$$
> Debe vender 50 láminas al mes para no perder dinero.
>
> **b) Resultado con $Q = 65$ láminas:**
> * $IT = 65 \cdot 20 = 1300\text{ €}$
> * $CT = 800 + (65 \cdot 4) = 800 + 260 = 1060\text{ €}$
> * $B = 1300 - 1060 = \mathbf{+240\text{ €}}$ (está en zona de beneficios, pues $65 > 50$).
>
> **c) Resultado con $Q = 100$ láminas:**
> * $IT = 100 \cdot 20 = 2000\text{ €}$
> * $CT = 800 + (100 \cdot 4) = 1200\text{ €}$
> * $B = 2000 - 1200 = \mathbf{+800\text{ €}}$
> * *Comprobación marginal:* Vende $100 - 50 = 50$ láminas por encima del umbral. Como cada lámina aporta un margen de $16\text{ €}$ ($20 - 4$), el beneficio es directamente: $50 \cdot 16\text{ €} = \mathbf{800\text{ €}}$.

---

**3.** Reflexiona sobre la lógica económica del umbral de rentabilidad:
* **a)** Si el ilustrador del ejercicio anterior decide subir el precio de venta de sus láminas de 20 € a 24 €, ¿necesitará vender más o menos láminas para cubrir costes? Justifica tu respuesta sin hacer cálculos numéricos y luego compruébalo con la fórmula.
* **b)** ¿Qué ocurriría con el punto muerto si una crisis de suministros encarece el papel, elevando el coste variable unitario de 4 € a 8 € manteniendo el precio inicial en 20 €?

> [!example]- Solución
> **a) Subida del precio a 24 €:**
> * Al subir el precio, cada lámina deja un margen mayor ($24 - 4 = 20\text{ €}$ frente a 16 €). Al recaudar más por unidad para cubrir los mismos costes fijos, necesitará vender **menos láminas**.
> * *Cálculo:* $Q_0 = \frac{800}{24 - 4} = \frac{800}{20} = \mathbf{40\text{ láminas}}$ (10 láminas menos que antes).
>
> **b) Aumento del coste variable a 8 €:**
> * Si el coste de fabricación aumenta, el margen unitario se estrecha ($20 - 8 = 12\text{ €}$). Como cada lámina aporta menos dinero a la bolsa de costes fijos, la empresa se vuelve más vulnerable y necesitará vender **más láminas** para no entrar en pérdidas.
> * *Cálculo:* $Q_0 = \frac{800}{20 - 8} = \frac{800}{12} = \mathbf{66{,}67} \rightarrow \mathbf{67\text{ láminas}}$ (se redondea hacia arriba al tratarse de unidades indivisibles).

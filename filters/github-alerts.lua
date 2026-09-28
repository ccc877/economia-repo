-- Convierte los avisos con sintaxis de GitHub en callouts nativos de Quarto.
--
--   > [!tip] Título      -->   ::: {.callout-tip}
--   > cuerpo                 ## Título
--   >                        cuerpo
--                           :::
--
-- El sufijo "-" marca el callout como plegado y "+" como desplegado pero
-- plegable, igual que en GitHub. Si el aviso no empieza por un marcador
-- reconocido el bloque se devuelve tal cual, sin tocarlo.

local TIPOS = {
  note      = "note",
  tip       = "tip",
  important = "important",
  warning   = "warning",
  caution   = "caution",
  abstract  = "abstract",
  danger    = "danger",
  example   = "example",
  success   = "success",
  question  = "question",
  bug       = "bug",
  failure   = "failure",
  quote     = "quote",
  todo      = "todo",
  -- GitHub llama "info" a lo que Quarto llama "note".
  info      = "note",
}

local PATRON = "^%[!([%a][%w_%-]*)%]([+-]?)%s*(.*)$"

-- Quita el marcador "[!tipo]" del principio de una lista de inlines y devuelve
-- el tipo, el sufijo de plegado y los inlines del título. Se trabaja sobre los
-- inlines (y no sobre el texto) para no perder las fórmulas en línea.
local function quitar_marcador(inlines)
  local acumulado = ""

  for i, inl in ipairs(inlines) do
    local trozo

    if inl.t == "Str" then
      trozo = inl.text
    elseif inl.t == "Space" or inl.t == "SoftBreak" then
      trozo = " "
    else
      return nil
    end

    local nuevo = acumulado .. trozo
    local tipo, sufijo, resto = nuevo:match(PATRON)

    if tipo then
      local titulo = {}
      if resto ~= "" then
        table.insert(titulo, { Str = resto })
      end
      for j = i + 1, #inlines do
        -- El espacio que separa "[!tipo]" del título no debe abrir la lista.
        local inl = inlines[j]
        local vacio = inl.t == "Space" or inl.t == "SoftBreak"
        if vacio and #titulo == 0 then
          -- se descarta
        else
          table.insert(titulo, inl)
        end
      end
      return tipo, sufijo, titulo
    end

    acumulado = nuevo
  end

  return nil
end

function BlockQuote(el)
  local primero = el.content[1]
  if primero == nil or primero.t ~= "Para" then
    return nil
  end

  -- El título y el cuerpo suelen ir en el mismo párrafo separados por un salto
  -- de línea blando, así que se parte ahí.
  local corte
  for i, inl in ipairs(primero.content) do
    if inl.t == "SoftBreak" or inl.t == "LineBreak" then
      corte = i
      break
    end
  end

  local cabeza, cola = {}, {}
  for i = 1, (corte or (#primero.content + 1)) - 1 do
    table.insert(cabeza, primero.content[i])
  end
  if corte then
    for i = corte + 1, #primero.content do
      table.insert(cola, primero.content[i])
    end
  end

  local tipo, sufijo, titulo = quitar_marcador(cabeza)
  if tipo == nil or TIPOS[tipo:lower()] == nil then
    return nil
  end

  local bloques = {}

  if titulo and #titulo > 0 then
    -- `unnumbered` evita que el título se numere como un apartado, y `unlisted`
    -- que aparezca en el índice lateral. Sin esto, con un desplegable por
    -- ejercicio el TOC de cada documento se llenaría de soluciones.
    local attrs = pandoc.Attr("", { "unnumbered", "unlisted" }, { ["unnumbered"] = "true" })
    table.insert(bloques, pandoc.Header(2, titulo, attrs))
  end

  if #cola > 0 then
    table.insert(bloques, pandoc.Para(cola))
  end

  for i = 2, #el.content do
    table.insert(bloques, el.content[i])
  end

  local atributos = { "callout-" .. TIPOS[tipo:lower()] }
  if sufijo == "-" then
    atributos["callout-collapse"] = "true"
  elseif sufijo == "+" then
    atributos["callout-collapse"] = "false"
  end

  return pandoc.Div(bloques, pandoc.Attr("", atributos, { ["callout-appearance"] = "simple" }))
end

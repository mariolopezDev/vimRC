-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = { "html", "cssls" }
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end


-- Configuración avanzada para gopls
lspconfig.gopls.setup {
  on_attach = function(client, bufnr)
    -- Llamar a la función on_attach de NvChad para configuraciones predeterminadas
    nvlsp.on_attach(client, bufnr)
  end,

  on_init = nvlsp.on_init,

  capabilities = nvlsp.capabilities,

  settings = {
    gopls = {
      -- Configuración de análisis y diagnósticos
      analyses = {
        unusedparams = true,    -- Detecta parámetros no utilizados
        nilness = true,         -- Análisis de condiciones con nil
        shadow = true,          -- Detecta variables shadowed
        unusedwrite = true,     -- Detecta escrituras no utilizadas
        fillreturns = true,     -- Sugiere valores de retorno para funciones incompletas
        nonewvars = true,       -- Sugiere correcciones para errores de variables no nuevas
        unusedvariable = true,  -- Detecta variables no utilizadas
        simplifyslice = true,   -- Simplifica expresiones de slices
        staticcheck = true,     -- Habilita análisis adicionales de Staticcheck
      },
      staticcheck = true,        -- Habilitar Staticcheck
      usePlaceholders = true,    -- Habilita placeholders en las sugerencias de completado
      completeUnimported = true, -- Habilita completado de paquetes no importados
      matcher = "Fuzzy",         -- Configura el matcher para completados a "Fuzzy"
      experimentalPostfixCompletions = true, -- Habilita completaciones postfijas
      codelenses = {
        generate = true,       -- Habilita lentes de código para `go generate`
        gc_details = true,     -- Muestra detalles de optimización del GC
        regenerate_cgo = true, -- Habilita la regeneración de declaraciones cgo
        tidy = true,           -- Habilita `go mod tidy` como codelens
        upgrade_dependency = true, -- Sugiere actualizaciones de dependencias
        vendor = true,         -- Habilita `go mod vendor` como codelens
        run_govulncheck = true, -- Habilita el análisis de vulnerabilidades con govulncheck
      },
      hoverKind = "FullDocumentation", -- Muestra documentación completa en el hover
      --hoverKind = "SynopsisDocumentation",
      semanticTokens = true,          -- Habilita tokens semánticos
      directoryFilters = { "-**/node_modules" }, -- Excluye node_modules del workspace
      hints = {
        assignVariableTypes = true,  -- Muestra tipos de variables en asignaciones
        compositeLiteralFields = true, -- Muestra nombres de campos en literales compuestos
        compositeLiteralTypes = true, -- Muestra tipos de literales compuestos
        constantValues = true,       -- Muestra valores constantes
        functionTypeParameters = true, -- Muestra parámetros de tipo en funciones genéricas
        parameterNames = true,       -- Muestra nombres de parámetros
        rangeVariableTypes = true,   -- Muestra tipos de variables en bucles range
      },
    },
  },

  flags = {
    debounce_text_changes = 150,  -- Controla el tiempo de espera para cambios de texto
  },
}

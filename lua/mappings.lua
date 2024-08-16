require "nvchad.mappings"


local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")



--Prime
--Abre el explorador de archivos en modo normal con `<leader>pv`.
map("n", "<leader>pv", vim.cmd.Ex)

--Mueve las líneas seleccionadas hacia abajo en el modo visual.
map("v", "J", ":m '>+1<CR>gv=gv")

--Mueve las líneas seleccionadas hacia arriba en el modo visual.
map("v", "K", ":m '<-2<CR>gv=gv")

--Une la línea actual con la siguiente, manteniendo la posición del cursor.
map("n", "J", "mzJ`z")

--Desplaza media página hacia abajo y centra la vista.
map("n", "<C-d>", "<C-d>zz")

--Desplaza media página hacia arriba y centra la vista.
map("n", "<C-u>", "<C-u>zz")

--Navega a la siguiente coincidencia de búsqueda, centrando la vista.
map("n", "n", "nzzzv")

--Navega a la anterior coincidencia de búsqueda, centrando la vista.
map("n", "N", "Nzzzv")

--Pega sobre la selección sin copiar al portapapeles.
map("x", "<leader>p", [["_dP]])

--Copia al portapapeles del sistema en los modos normal y visual.
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

--Elimina sin copiar al portapapeles en los modos normal y visual.
map({ "n", "v" }, "<leader>d", [["_d]])

--Usa `<C-c>` para salir del modo de inserción.
map("i", "<C-c>", "<Esc>")

--Desactiva la tecla 'Q'.
map("n", "Q", "<nop>")

--Abre una nueva ventana de tmux con "tmux-sessionizer".
--map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

--Formatea el búfer actual con el servidor de lenguaje.
map("n", "<leader>f", vim.lsp.buf.format)

--Navega a la siguiente entrada de la lista de quickfix, centrando la vista.
map("n", "<C-k>", "<cmd>cnext<CR>zz")

--Navega a la anterior entrada de la lista de quickfix, centrando la vista.
map("n", "<C-j>", "<cmd>cprev<CR>zz")

--Navega al siguiente elemento de la lista de ubicaciones, centrando la vista.
map("n", "<leader>k", "<cmd>lnext<CR>zz")

--Navega al anterior elemento de la lista de ubicaciones, centrando la vista.
map("n", "<leader>j", "<cmd>lprev<CR>zz")

--Inicia una sustitución con la palabra actual.
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

--Hace ejecutable el archivo actual.
--map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--Inserta un bloque de manejo de errores.
--map("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

--Activa el comando "make_it_rain" del plugin "Cellular Automaton".
map("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

--Recarga la configuración actual de Neovim.
--map("n", "<leader><leader>", function() vim.cmd("so") end)

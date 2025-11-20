return {
	"kiyoon/jupynium.nvim",
	build = "pipx install --user .",
	opts = {
		default_notebook_URL = "localhost:8888/nbclassic",
	},

	--build = "uv pip install . --python=$HOME/.virtualenvs/jupynium/bin/python",
	-- build = "conda run --no-capture-output -n jupynium pip install .",
}

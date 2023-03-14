module main

import vweb
import os

const port = 8888

struct App {
	vweb.Context
}

fn main() {
	mut app := &App{}
	app.mount_static_folder_at(os.resource_abs_path('.'), '/')

	app.handle_static("src/assets", true)

	vweb.run(app, port)
}

pub fn (mut app App) before_request() {
	println('[vweb] before_request: ${app.req.method} ${app.req.url}')
}

["/"]
pub fn (mut app App) index() vweb.Result {
	return $vweb.html()
}

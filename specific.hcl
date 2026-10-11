
build "remain" {
  dockerfile = "Dockerfile"
  context    = "."
}


service "web" {
  build   = build.remain
  command = "npm start"

  endpoint {
    public = true
  }

  env = {
    PORT = port
  }
}

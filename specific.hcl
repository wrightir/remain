
build "remain" {
  dockerfile = "Dockerfile"
  context    = "."
}

service "web" {
  build = build.remain

  endpoint {
    public = true
  }

  env = {
    PORT = port
  }
}

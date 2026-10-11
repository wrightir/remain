secret "admin_password" {}

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
    PORT           = port
    ADMIN_PASSWORD = secret.admin_password
  }
}

secret "admin_password" {}
secret "rclone_conf" {}
secret "remote_folder" {}

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
    RCLONE_CONF    = secret.rclone_conf
    REMOTE_FOLDER  = secret.remote_folder
  }
}

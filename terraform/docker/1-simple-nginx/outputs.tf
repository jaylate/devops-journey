output container_id {
  description = "ID of the container"
  value = docker_container.nginx.id
}

output container_url {
  description = "Container's URL for faster acccess"
  value = "http://localhost:${docker_container.nginx.ports[0].external}/"
}

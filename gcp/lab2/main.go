package main

import (
  "fmt"
  "os"
  "log"
  "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Hello, World!")
}

func healthHandler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "OK")
}

func main() {
  http.HandleFunc("/health", healthHandler)
  http.HandleFunc("/", handler)
  log.Fatal(http.ListenAndServe(":"+os.Getenv("PORT"), nil))
}

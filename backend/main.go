package main

import (
  "log"
  "net/http"
  "fmt"

  "github.com/FLAIVIINGO/ShenRingApp/db"
  "github.com/FLAIVIINGO/ShenRingApp/models"
)

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Hello, Docker!")
}

func main() {
  database, err := db.ConnectWithRetry()
  if err != nil {
    log.Fatal(err)
  }

  if err := models.CreateQuestionsTable(database); err != nil {
    log.Fatalf("table create failed %v", err)
  }

  if err := models.SeedSampleQuestion(database); err != nil {
    log.Fatalf("seeding failed: %v", err)
  }

  http.HandleFunc("/", handler)
  log.Fatal(http.ListenAndServe(":8080", nil))
}

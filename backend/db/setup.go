package db

import (
  "database/sql"
  "fmt"
  "log"
  "os"
  "time"

  _ "github.com/lib/pq"
)

func ConnectWithRetry() (*sql.DB, error){
  host := os.Getenv("DB_HOST")
  port := os.Getenv("DB_PORT")
  user := os.Getenv("DB_USER")
  pass := os.Getenv("DB_PASS")
  name := os.Getenv("DB_NAME")

  conninfo := fmt.Sprintf(
    "postgres://%s:%s@%s:%s/%s?sslmode=disable",
    user, pass, host, port, name,
  )

  var db *sql.DB
  var err error

  maxAttempts := 10
  for attempts := 1; attempts <= maxAttempts; attempts++ {
    db, err = sql.Open("postgres", conninfo)
    if err == nil {
      err = db.Ping()
      if err == nil {
        fmt.Println("Connected to Postgres!")
        break
      }
    }
    log.Printf("DB not read (attempt %d/%d): %v", attempts, maxAttempts, err)
    time.Sleep(2 * time.Second)
  }

  if err != nil {
    log.Fatal("Could not connect to the database")
  }

  return db, nil
}

package main

import (
  "fmt"
  "log"
  "net/http"
  "database/sql"
  "os"
  "time"

  _ "github.com/lib/pq"
)

func handler(w http.ResponseWriter, r *http.Request) {
  fmt.Fprintf(w, "Hello, Docker!")
}

func main() {
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

    log.Printf("DB not ready (attempt %d/%d): %v", attempts, maxAttempts, err)
    time.Sleep(2 * time.Second)
  }

if err != nil {
  log.Fatal("Could not connect to the database")
}

  _, err = db.Exec(`
    CREATE TABLE IF NOT EXISTS questions (
    id SERIAL PRIMARY KEY,
    prompt TEXT NOT NULL,
    options TEXT[] NOT NULL,
    answer TEXT NOT NULL
    );
  `)
  if err != nil {
    log.Fatalf("Error creating table: %v", err)
  }

  db.Exec(`
    INSERT INTO questions (prompt, options, answer)
    SELECT 'Which one of these is a pair of leaves?', ARRAY['𓇌','𓃹','𓅦','𓆣'], '1'
    WHERE NOT EXISTS (
      SELECT 1 FROM questions WHERE prompt = 'Which one of these is a pair of leaves?'
    );
  `)

  http.HandleFunc("/", handler)
  log.Fatal(http.ListenAndServe(":8080", nil))
}

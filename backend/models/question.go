package models

import (
  "database/sql"
  "log"
)

func CreateQuestionsTable(db *sql.DB) error {
  _, err := db.Exec(`
    CREATE TABLE IF NOT EXISTS questions (
      id SERIAL PRIMARY KEY,
      prompt TEXT NOT NULL,
      options TEXT[] NOT NULL,
      answer TEXT NOT NULL
    );
  `)
  if err != nil {
    return err
  }

  log.Println("Questions table created")
  return nil
}

func SeedSampleQuestion(db *sql.DB) error {
  _, err := db.Exec(`
    INSERT INTO questions (prompt, options, answer)
    SELECT
      'Which one of these is a pair of leaves?',
      Array['𓇌','𓃹','𓅦','𓆣'],
      '𓇌'
    WHERE NOT EXISTS (
      SELECT 1 FROM questions WHERE prompt = 'Which one of these is a pair of leaves?'
    );
  `)
  if err != nil {
    return err
  }

  log.Println("Sample question inserted")
  return nil
}

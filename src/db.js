// database.js
const sqlite3 = require('sqlite3').verbose();

const db = new sqlite3.Database('./db/users.sqlite', (err) => {
  if (err) {
    console.error('Error opening database:', err.message);
  } else {
    db.run(
      `CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        email TEXT,
        mobile TEXT
      )`,
      (err) => {
        if (err) {
          console.log('Error creating table:', err.message);
        }
      }
    );
  }
});

module.exports = db;

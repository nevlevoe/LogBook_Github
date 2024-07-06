const express = require('express');
const bodyParser = require('body-parser');
const bcrypt = require('bcryptjs');
const cors = require('cors');
const { Pool } = require('pg');

const app = express();
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'trial',
    password: 'Mukund+1234',
    port: 5432,
});

app.use(bodyParser.json());
app.use(cors());

app.post('/register', async (req, res) => {
    const { username, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    try {
        const result = await pool.query(
            'INSERT INTO users (username, password) VALUES ($1, $2) RETURNING id',
            [username, hashedPassword]
        );
        res.status(201).json({ id: result.rows[0].id });
    } catch (error) {
        res.status(500).json({ error: 'Error registering new user' });
    }
});

app.post('/login', async (req, res) => {
    const { username, password } = req.body;
    try {
        const result = await pool.query('SELECT * FROM users WHERE username = $1', [username]);
        if (result.rows.length === 0) {
            return res.status(400).json({ error: 'Invalid username or password' });
        }
        const user = result.rows[0];
        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) {
            return res.status(400).json({ error: 'Invalid username or password' });
        }
        res.json({ id: user.id, username: user.username });
    } catch (error) {
        res.status(500).json({ error: 'Error logging in' });
    }
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});

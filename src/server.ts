import express from 'express';

const app = express();
const PORT = 3000;

// app.get('/', (req, res) => res.send('Welcome to Express.js Root'));

app.get('/', (req, res) => {
	res.send('Welcome to Express.js Root');
});

app.get('/api', (req, res) => {
	res.json({ message: 'Hello from /api' })
});
app.get('/redirect-me', (req, res) => {
	res.redirect('/new-path');
});
app.get('/new-path', (req, res) => {
	res.send('You have been redirected to /new-path');
});

app.listen(PORT, () => {
	console.log(`Express server running on http://localhost:${PORT}`);
});

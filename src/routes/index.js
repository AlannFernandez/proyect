const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', async (req, res) => {
    const Recommended = await pool.query('SELECT * FROM links WHERE field = 1');
    const Offers = await pool.query('SELECT * FROM links WHERE field = 2');
    const mostViewed = await pool.query('SELECT * FROM links WHERE field = 3');
    const companies = await pool.query('SELECT * FROM companys where active = 1 ORDER by sponsored desc');
    
    res.render('index',{ Recommended, Offers, mostViewed, companies});
});

module.exports = router;    
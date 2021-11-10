const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', async (req, res) => {    
    const companies = await pool.query('SELECT * FROM companys where active = 1 ORDER by sponsored desc');
    
    res.render('index',{companies});
});


module.exports = router;    
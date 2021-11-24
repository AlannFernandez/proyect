const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', async (req, res) => {    
    const companies = await pool.query('SELECT id,cuit,social_reason,category,makes_delivery,price_delivery,sponsored,online_payments,img_profile,points FROM companys where active = 1 ORDER by sponsored desc');
    console.log(companies)
    res.render('index',{companies});
});


module.exports = router;    
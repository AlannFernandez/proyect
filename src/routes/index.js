const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/', async (req, res) => {    
    const companies = await pool.query('SELECT * FROM companys where active = 1 ORDER by sponsored desc');
    
    res.render('index',{companies});
});


router.post('/', async(req, res)=>{
    const {category}=req.body
    const search = await pool.query('SELECT social_reason FROM companys where active = 1 AND category =? ORDER by sponsored desc ',[category]);        
    console.log(search)
    res.json(search);
})
module.exports = router;    
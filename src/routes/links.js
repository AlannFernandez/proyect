const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');

const path = require('path');
const multer = require('multer');
const { v4: uuidv4 } = require('uuid');

const storage = multer.diskStorage({
  destination: path.join(__dirname,'../public/uploads'),
  filename: (req, file, cb) => {
    cb(null, uuidv4() + path.extname(file.originalname).toLocaleLowerCase());
  }  
});


// function delete img products
const fs = require('fs');

function deleteFile(rout){
    fs.unlink(rout,(error)=>{
        if(error){console.error(error)};
        console.log('success file deleted');
    });
};
 
                                                        // routes


router.get('../', (req, res)=>{
console.log("estas en el inicio");
});

// add product
router.get('/add', isLoggedIn, (req, res) => {
    res.render('links/add');
});

router.post('/add', async (req, res) => {   
    const { title, price, description} = req.body;
    const img = req.file['filename'];
    const newProduct = {
        title,
        price,
        description,
        img,
        user_id: req.user.id
    };
    await pool.query('INSERT INTO links set ?', [newProduct]);
    req.flash('success', 'Producto agregado exitosamente');
    res.redirect('/links');
});


// section address
router.get('/address',(req, res) =>{
    res.render('links/address');
});

router.post('/address', async (req, res) => {
   
    const { nameClient, cp, province, locality,district,street,numberST,departament,street1,street2,extraReferences,address} = req.body;
    const newAddress = {
        nameClient,
        cp,
        province,
        locality,
        district,
        street,
        numberST,
        departament,
        street1,
        street2,
        extraReferences,
        address,
        user_id: req.user.id
    };    
    await pool.query('INSERT INTO addresses set ?', [newAddress]);
    req.flash('success', 'Dirección agregada exitosamente');
    res.redirect('/profile');
});


// add item at cart user
router.post('/addCart', isLoggedIn, async(req, res) => {
    const {product_id}= req.body;      
    const addCart = {
        user_id: req.user.id,
        product_id,
        quantity:1
    };
    await pool.query('INSERT INTO users_cart set ?', [addCart]);
    res.json("success");
});

// delete item from cart
router.post('/quitCart', isLoggedIn, async (req, res)=>{
    const {product_id} = req.body;
    
    console.log(product_id, req.user.id);
    await pool.query('DELETE FROM users_cart WHERE user_id = ? AND product_id = ?',[req.user.id, product_id]);
    res.json('success');
});

//get items from cart user
router.get('/cart', isLoggedIn, async(req, res) =>{
    const product =await pool.query("SELECT links.id, links.img, links.title, links.description, links.price FROM links INNER JOIN users_cart  ON links.id = users_cart.product_id  WHERE users_cart.user_id = ?",[req.user.id]);            
    res.render('links/cart',{product});   
})



// search
router.post('/search', async(req, res)=>{
    const {search}= req.body;
    const request ="%"+search+"%";    
    const result = await pool.query("SELECT * FROM links WHERE title LIKE ?",[request]);        
    res.render('links/search',{result});
});


//view products 
router.get('/view/:id', async (req, res) => {
    const { id } = req.params;
    const links = await pool.query('SELECT * FROM links WHERE id = ?', [id]);    
    res.render('links/view', {link: links[0]});
});
router.post('/view/:id',isLoggedIn, async (req, res) => {
    const { id } = req.params;
    const links = await pool.query('SELECT * FROM links WHERE id = ?', [id]);    
});

// delete products
router.get('/delete/:id/:img', async (req, res) => {

    const { id } = req.params;
    const {img} = req.params;
    const rout = path.join(__dirname,'../public/uploads/');
    deleteFile(rout+img);
    await pool.query('DELETE FROM links WHERE ID = ?', [id]);    
    req.flash('success', 'Producto eliminado exitosamente');
    res.redirect('/links/dashboard');
});

// edits products
router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const links = await pool.query('SELECT * FROM links WHERE id = ?', [id]);
    res.render('links/edit', {link: links[0]});
});


router.post('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const { title, description, price} = req.body; 
    const update = {
        title,
        description,
        price       
    };    
    await pool.query('UPDATE links set ? WHERE id = ?', [update, id]);
  
    req.flash('success', 'Producto actualizado exitosamente');
    res.redirect('/links');
});


// view shop

router.get('/shops', async (req, res) => {
    
    res.render('links/shops');
});

// dashboard
router.get('/dashboard',isLoggedIn, async (req, res) =>{
    const product = await pool.query('SELECT * FROM links WHERE user_id = ?', [req.user.id]);
    res.render('links/dashboard', { product });
});


module.exports = router;
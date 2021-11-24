const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');
const io = require('socket.io');
const mercadopago = require ('mercadopago');
const webpush = require('../webpush');

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
let pushSubscription;

// test notificaciones
router.post("/pedido", async (req, res) => {
    pushSubscription = req.body;
    res.status(200).json();
    const payload= JSON.stringify({
        title:"notificación",
        message:"hello world"
    });
    try{
        await webpush.sendNotification(pushSubscription, payload);
    }catch(error){
        console.log(error);
    }
})


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
    res.redirect('/links/dashboard');
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
router.get('/forms',  async (req, res)=>{
    res.render('links/forms');
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
    console.log(product_id)
    console.log(req.user.id)
    console.log("se envio una peticion para eliminar ese producto")
     await pool.query('DELETE FROM users_cart WHERE user_id = ? AND product_id = ?',[req.user.id, product_id]);
    res.json('success');
});


router.post('/compra', isLoggedIn, async (req, res)=>{    
    console.log(req.body)  
    console.log("usuario "+req.user.id)
    const{company}=req.body ;
    console.log("compania "+ company[0]);
    const {total}= req.body;
    console.log("importe "+ total);
    
});



// checkout
router.get('/checkout', isLoggedIn, async (req, res)=>{
    const id_compra= uuidv4();
    console.log(id_compra)

    console.log(req.body)
    const userDir = await pool.query("SELECT * FROM addresses  WHERE user_id = ?",[req.user.id]);     
    const productos = await pool.query('SELECT * FROM users_cart WHERE user_id = ?', [req.user.id])
    console.log(userDir)
    console.log(productos)
     res.render('links/checkout',{direccion:userDir[0]});
});
router.get('/checkout/notes', isLoggedIn, async (req, res)=>{
    res.render('links/notes');
});
router.post('/notes', isLoggedIn, async (req, res)=>{    
    const {notes}= req.body;
    
    res.redirect('/links/checkout');
});

router.get('/checkout/payment', isLoggedIn, async (req, res)=>{
    res.render('links/payment');
});
router.post('/method_payment', isLoggedIn, async (req, res)=>{
    const{method_payment} = req.body;

    res.redirect('/links/checkout');
});
// configuracion de mercado pago

// Agrega credenciales
mercadopago.configure({
    access_token: 'APP_USR-4037073938063396-102918-9548b26cf609d150c11074cae50e2554-1009171182'
});

router.post('/checkout1', (req, res) => {
    // Crea un objeto de preferencia
    console.log(req.body);
    let preference = {
        
        items: [
          {
            title:"item de prueba",
            unit_price: 200,
            quantity: 1,
          }
        ]
    };
      
    mercadopago.preferences.create(preference)
      .then(function(response){
        console.log(response.body);
        res.redirect(response.body.init_point);
       
      }).catch(function(error){
        console.log(error);
    });
});


//get items from cart user
router.get('/cart', isLoggedIn, async(req, res) =>{
    const product = await pool.query("SELECT * FROM links INNER JOIN users_cart  ON links.id = users_cart.product_id  WHERE users_cart.user_id = ?",[req.user.id]);            
    console.log(product)    
    res.render('links/cart',{product});   
})

// addresses users
router.get('/addresses',isLoggedIn, async(req, res) =>{
    const userDir = await pool.query("SELECT * FROM addresses  WHERE user_id = ?",[req.user.id]);        
    res.render('links/addressView',{userDir});
});



// search
router.post('/search', async(req, res)=>{
    const {search}= req.body;
    const request ="%"+search+"%";    
    const result = await pool.query("SELECT * FROM links WHERE title LIKE ?",[request]);        
    res.render('links/search',{result});
});

// view shop
router.get('/shops/:id_s', async (req, res) => {
    const { id_s } = req.params;
    const id_shop = {id_s}
    const nombre = await pool.query('SELECT id,cuit,social_reason,category,makes_delivery,price_delivery,sponsored,online_payments,img_profile,points FROM companys where id =?', [id_s]);
    const direccion = await pool.query('SELECT * FROM addresses WHERE user_id = ? ', [id_s]);    
    const categorias = await pool.query('SELECT DISTINCT category FROM links WHERE user_id = ?',[id_s]);
    const productos = await pool.query('SELECT * FROM links WHERE user_id = ? ', [id_s]); 
    console.log(nombre)
    res.render('links/shops',{id_shop, categorias, productos, tienda:nombre[0], ubi: direccion[0]});
});

// all shops
router.get('/companies', async (req, res) => {
    const companies = await pool.query('SELECT * FROM companys where active = 1 ORDER by sponsored desc');
    res.render('links/allshops',{companies});
});


router.get('/info/:id', async (req, res) => {    
    const {id}= req.params;
    const nombre = await pool.query('SELECT id,social_reason,category,makes_delivery,price_delivery,sponsored,online_payments,img_profile,points FROM companys where id =?', [id]);
    const add = await pool.query('SELECT * FROM addresses WHERE user_id =?',[id]);
    res.render('links/compInfo',{shop:nombre[0], direccion:add[0]});
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




// dashboard
router.get('/dashboard',isLoggedIn, async (req, res) =>{
    const product = await pool.query('SELECT * FROM links WHERE user_id = ?', [req.user.id]);
    res.render('links/dashboard', { product });
});

// function count items cart
router.post('/inicio',isLoggedIn, async (req, res) =>{
    const cart = await pool.query('SELECT count(*) FROM users_cart WHERE user_id = ?',[req.user.id]);        
    res.json(cart);    
});


// purchases
router.get('/purchases',isLoggedIn, async (req, res) =>{    
    const purchases = await pool.query('SELECT * FROM purchases WHERE user_id = ?',[req.user.id]);
    res.render('links/purchases', {purchases});
});

// favorites
router.get('/favorites',isLoggedIn, async (req, res) =>{        
    res.render('links/favorites');
});

// Update tel users
router.post('/UpdateTel',isLoggedIn, async (req, res) =>{
    const {telephone} = req.body; 
    console.log("usuario "+ req.user.id);        
    console.log(telephone);      
    const update = {telephone};
    await pool.query('UPDATE users set ? WHERE id = ?', [update, req.user.id]);
    res.redirect('/profile');
}); 

router.get('/sell', isLoggedIn, async(req, res)=>{
res.render('links/sell');
});





module.exports = router;
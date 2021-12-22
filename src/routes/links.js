const express = require('express');
const router = express.Router();

const pool = require('../database');
const { isLoggedIn } = require('../lib/auth');



const mercadopago = require ('mercadopago');
const push =require('web-push');

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

// dni 
router.post('/adddni', isLoggedIn, async (req, res) => {
  const {dni} = req.body;
  await pool.query('UPDATE users SET dni = ? WHERE id = ?',[dni, req.user.id]);
  res.redirect('/profile');
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
    res.redirect('/links/dashboard');
});

router.post('/userPhoto', async (req, res) => {  
    const img = req.file['filename'];
    console.log('tenemos la imagen');
    await pool.query('UPDATE users SET img = ? WHERE id = ?',[img, req.user.id]);
    console.log("Se guardo la imagen");
    res.redirect('/profile');
})
// delivery
router.get('/delivery',(req, res) =>{
    res.render('links/delivery');
});
router.get('/requests', isLoggedIn, async(req, res) =>{
    const toMake= await pool.query('SELECT * FROM orders WHERE id_company = ? AND status = 0', [req.user.id]);
    
    const ready= await pool.query('SELECT * FROM orders WHERE id_company = ? AND status = 1', [req.user.id]);
    const onWay= await pool.query('SELECT * FROM orders WHERE id_company = ? AND status = 2', [req.user.id]);
    const success= await pool.query('SELECT * FROM orders WHERE id_company = ? AND status = 3', [req.user.id]);
    const canceled= await pool.query('SELECT * FROM orders WHERE id_company = ? AND status = 4', [req.user.id]);
    
    const pedido =await pool.query('SELECT * FROM orders INNER JOIN links ON orders.id_product = links.id WHERE id_company =?',[req.user.id]);
    // const deli =await pool.query('SELECT * FROM delivery INNER JOIN users ON delivery.id = users.id WHERE delivery.company_id =?',[req.user.id]);
    const delivery = await pool.query ('SELECT * FROM delivery WHERE company_id = ?',[req.user.id])       
    console.log(ready)
    res.render('links/requests',{delivery:delivery[0],pedido:pedido[0], toMake:toMake[0],ready:ready[0],onWay:onWay[0],success:success[0],canceled});
});
// section address
// edit address
router.get('/address/:id',isLoggedIn, async(req, res) =>{
    const { id } = req.params;
    const dirUser = await pool.query('SELECT * from addresses where id=? AND user_id=?',[id,req.user.id]);
    var type=dirUser[0].address;    
    // verifico si la direccion de entrega es una casa o trabajo
    if(type=="casa"){
        // si es una casa le doy valor true a una variable de lo contrario es false 
        var address=1;
    }else{
        var address=0;
    }
    res.render('links/address',{direccion:dirUser[0],address} );
});
// update address
router.post('/address/updateAddress', isLoggedIn, async (req, res) => {
    console.log(req.body)
    const {id}=req.body;
    const { nameClient, cp, province, locality,district,street,numberST,departament,street1,street2,extraReferences,address} = req.body;
    const UpdateAddres = {
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
        address        
    };  
    await pool.query('UPDATE addresses set ? WHERE id = ?', [UpdateAddres, id]);
    res.redirect('/links/addresses');
});
// delete address
router.post('/address/deleteAddress', isLoggedIn, async (req, res) => {    
    const {id}=req.body;
    await pool.query('DELETE FROM addresses WHERE id = ?',[id]);
    res.redirect('/links/addresses');
});

// view address
router.get('/address',isLoggedIn, async(req, res) =>{        
    res.render('links/address');
});
// add address
router.post('/addAddress', isLoggedIn, async (req, res) => {
   
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
    res.redirect('/links/addresses');
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


// checkout
router.post('/checkout', isLoggedIn, async (req, res)=>{
    const id_compra= uuidv4();
    console.log(req.body);
    console.log(req.user.id);
     
    
// loop para guardar cada uno de los item en la orden
    // var a = product.length;    
    // for (var i = 0; i < a; i++) {
    //     console.log(product[i]);
    //     // more statements
    // }
    // obtengo id del producto
    const {product} =req.body;
    const {total} =req.body;        
    // busco la empresa al que pertenece el producto
    const id_company = await pool.query("SELECT user_id from links WHERE id =?",[product]);    
    console.log(id_company)
    // guardo el id de la compania 
    var {quantity}=req.body;
    const user_id = id_company[0].user_id;    
    const company = await pool.query("SELECT * FROM companys  WHERE id_user = ?",[user_id]);    
    const compDir = await pool.query("SELECT * FROM addresses  WHERE user_id = ?",[user_id]);    
    const userLocation = await pool.query("SELECT * FROM locations  WHERE user_id = ?",[req.user.id]); 

    res.render('links/checkout',{product,quantity,userLocation,Locations:userLocation[0], dirCompany:compDir[0], company:company[0], total});
});



// configuracion de mercado pago

// Agrega credenciales
mercadopago.configure({
    access_token: 'APP_USR-4037073938063396-102918-9548b26cf609d150c11074cae50e2554-1009171182'
});

router.post('/checkout_finish', (req, res) => {
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
    res.render('links/cart',{product});   
})

// addresses users
router.get('/addresses',isLoggedIn, async(req, res) =>{
    const userDir = await pool.query("SELECT * FROM locations  WHERE user_id = ?",[req.user.id]);        
    res.render('links/addressView',{userDir});
});
// geolocation users
router.get('/geo',isLoggedIn, async(req, res) =>{
    
    res.render('links/geo');
});
// save geo
router.post('/savegeo',isLoggedIn, async(req, res) =>{    
    const { name,lat,lng} = req.body;
    const location = {
        user_id:req.user.id,
        name,
        lat,
        lng
    };    
    await pool.query('INSERT INTO locations set ?', [location]);
    
    res.redirect('/links/addresses');
});
// delete geo
router.get('/deleteLocation/:id',isLoggedIn, async(req, res) =>{
    
    const {id}= req.params;
    await pool.query('DELETE FROM locations WHERE id = ?',[id]);
    res.redirect('/links/addresses');
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
    // notificacion
    
    

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

// view product company
router.get('/viewProduct/:id', async (req, res) => {
    const { id } = req.params;
    console.log(id)
    const products = await pool.query('SELECT * FROM links WHERE id = ?', [id]);    
    res.render('links/viewProduct', {product:products[0]});
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
    res.redirect('/links/dashProducts');
});

// edits products
router.get('/edit/:id', async (req, res) => {
    const { id } = req.params;
    const links = await pool.query('SELECT * FROM links WHERE id = ?', [id]);
    const categorias = await pool.query('SELECT * FROM categories');
    res.render('links/edit', {product: links[0], category:categorias[0] });
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

// dashboard products
router.get('/dashProducts',isLoggedIn, async (req, res) =>{
    const products = await pool.query('SELECT * FROM links WHERE user_id = ?', [req.user.id]);
    console.log(products)
    res.render('links/dashProducts', { products });
});




// function count items cart
router.post('/inicio',isLoggedIn, async (req, res) =>{
    const cart = await pool.query('SELECT count(*) FROM users_cart WHERE user_id = ?',[req.user.id]);        
    res.json(cart);    
});


// purchases
router.get('/purchases',isLoggedIn, async (req, res) =>{    
    const purchases = await pool.query('SELECT * FROM orders WHERE user_id = ?',[req.user.id]);
        console.log(purchases)
        var products = await pool.query('SELECT img, title, description, price FROM links WHERE id =?',[purchases[0].id_product]);
        var status= purchases[0].status; 
        var iconStatus;
        let text;
        console.log(purchases)
        if(status==0){
            status="Pendiente" ,
            iconStatus="ri-information-line",
            text="blue-text";   
        }
        if(status==1){
            status="Se está preparando tu pedido",
            iconStatus="ri-loader-line",text="green-text";
        }
        if(status==2){
            status="En camino",
            iconStatus="ri-takeaway-fill", text="green-text";  
            var viewDelivery =1 ;
        }
        if(status==3){
            status="Entregado",iconStatus="ri-check-fill", text="green-text";
        }
        if(status==4){
            status="Rechazado",iconStatus="ri-thumb-down-line", text="red-text";
        }
    
    
    res.render('links/purchases', {purchases:purchases[0], product:products[0], status, iconStatus, text,viewDelivery});
});

// acept order
router.post('/aceptOrder',isLoggedIn, async (req, res) =>{   
    var {id}=req.body;
    await pool.query('UPDATE orders set status = 1 WHERE id = ?', [id]);
    res.redirect(req.get('referer'));
});
// order DElivery
router.post('/onway',isLoggedIn, async (req, res) =>{   
    var id_co = req.user.id;
    const id_comp = await pool.query('SELECT id FROM companys WHERE id_user = ?',[id_co]);        
    var id_company=id_comp[0];
    var {id_delivery}=req.body;
    var {id_order} = req.body;
    var status = 0;
    const onway={
        id_company,
        id_delivery,
        id_order,
        status
    };    
    console.log(onway)
    await pool.query('INSERT INTO onway SET ?',[onway]);    
    res.redirect(req.get('referer'));
});

router.get('/Onway',isLoggedIn, async (req, res) =>{   
    const delivery = await pool.query('SELECT * FROM delivery WHERE user_id = ?',[req.user.id]);
    const myID = delivery[0].id;
    const pedidos = await pool.query('SELECT * FROM onway WHERE status = 0 AND id_delivery = ?',[myID]);
    var idOrder = pedidos[0].id_order;
    var order = await pool.query('SELECT id,id_product,qt,notes,import,delivery_address FROM orders WHERE status = 1 AND  id= ?',[idOrder]);
    var idProduct =order[0].id_product;
    var product = await pool.query('SELECT title,price, img FROM links WHERE id= ?',[idProduct]);
    res.render('links/onway', {pedidos:pedidos[0],order:order[0], product:product[0]});
});
// start delivery
router.post('/aceptDelivery', isLoggedIn, async(req, res )=>{
    console.log("El repartidor acepto el envio")
    const{id_order}=req.body;
    await pool.query('UPDATE orders SET status = 2 WHERE id=?',[id_order]);
    
    const{id_address}=req.body;
    const address = await pool.query('SELECT * FROM locations WHERE id=?',[id_address]);
    var userID = address[0].user_id;
    const userInfo =await pool.query('SELECT name, lastname, telephone, altphone FROM users WHERE id=?',[userID]);

    res.render('links/delivery',{id_order,address:address[0], userInfo:userInfo[0]})
});
// finish order
router.post('/finishOrder', isLoggedIn, async(req, res )=>{
    console.log("PEdido finalizado")
    // console.log(req.body)
    const {id_order}= req.body;
    await pool.query('UPDATE orders SET status = 3 WHERE id=?',[id_order]);
    res.redirect('/');
});

// favorites
router.get('/favorites',isLoggedIn, async (req, res) =>{        
    res.render('links/favorites');
});

// Update tel users
router.post('/UpdateTel',isLoggedIn, async (req, res) =>{
    const {telephone} = req.body;         
    const update = {telephone};
    await pool.query('UPDATE users set ? WHERE id = ?', [update, req.user.id]);
    res.redirect('/profile');
}); 
// add alternative telephone
router.post('/addAltPhone',isLoggedIn, async (req, res) =>{
    const {altPhone} = req.body;         
    const altphone = {altPhone};
    await pool.query('UPDATE users set ? WHERE id = ?', [altphone, req.user.id]);
    res.redirect('/profile');
}); 

// Update alternative telephone
router.post('/UpdateAltPhone',isLoggedIn, async (req, res) =>{         
    const {altphone} = req.body;    
    const newaltphone = {altphone};
    await pool.query('UPDATE users set ? WHERE id = ?', [newaltphone, req.user.id]);
    res.redirect('/profile');
}); 

// delete alternative Telephone
router.get('/deleteAltPhone', isLoggedIn, async(req, res)=>{
    await pool.query('UPDATE users SET altphone="" WHERE id = ?',[req.user.id]);
    res.redirect('/profile');
});

router.get('/sell', isLoggedIn, async(req, res)=>{
res.render('links/sell');
});

// about
router.get('/about', (req, res)=>{
res.render('links/about');
});

// finish checkout
router.post('/compra',isLoggedIn, async(req, res)=>{
    console.log(req.user.id);
    console.log(req.body);
    const status=0;
    
    const delivery_id ="";
    const {id_company,id_product,qt,total,delivery_from,delivery_price,id_address_user,method_payment,notesToProduct}=req.body;
    const order ={
        user_id:req.user.id,
        id_company,
        id_product,
        qt,
        import:total,
        status,
        notes:notesToProduct,
        method_payment,
        delivery_from,
        delivery_price,
        delivery_id,
        delivery_address:id_address_user
    };
    await pool.query('INSERT INTO orders SET ?',[order]);
    res.redirect('/links/purchases');
});

// 
router.get('/company', isLoggedIn, async(req, res)=>{
    const categories = await pool.query('SELECT * FROM categories');
    res.render('links/company',{categories});
});


router.post('/createCompany',isLoggedIn, async (req, res) => {  
    const img_profile = req.file['filename'];        
    const id_user = req.user.id;
    const active = 0;
    const {cuit,social_reason,category,m_d,price_delivery, o_p} = req.body;
    if(m_d){
        var makes_delivery=1;
    }else{
        var makes_delivery=0;
    }
    if(o_p){
        var online_payments=1;
    }else{
        var online_payments=0;
    }
   
    const newCompany = {
       id_user,
       cuit,
       social_reason,
       category,
       active,
       makes_delivery,
       price_delivery,
       online_payments,
       img_profile
    };  
    
    await pool.query('INSERT INTO companys set ?', [newCompany]);
    res.redirect('/')
})

// select days & time
router.get('/days&times', isLoggedIn, async(req, res)=>{
res.render('links/days&times');
});
router.post('/days', isLoggedIn, async(req, res)=>{
    var {day}=req.body;             
    var {time1}=req.body;
    var {time2}=req.body;
    for (var i = 0; i < day.length; i++) {
        console.log("usuario "+req.user.id+" "+day[i] +" "+time1[i]+" "+time2[i]);
        const times = {
            user_id: req.user.id,
            day:day[i],
            since:time1[i],
            until:time2[i]
        };
        await pool.query('INSERT INTO timesanddays set ?', [times]);
    }
    res.redirect('links/company'); 
});

module.exports = router;

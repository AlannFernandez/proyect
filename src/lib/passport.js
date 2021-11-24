const passport = require('passport');
const LocalStrategy = require('passport-local').Strategy;

const pool = require('../database');
const helpers = require('./helpers');

passport.use('local.signin', new LocalStrategy({
  usernameField: 'username',
  passwordField: 'password',
  passReqToCallback: true
}, async (req, username, password, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE email = ?', [username]);
  if (rows.length > 0) {
    const user = rows[0];
    const validPassword = await helpers.matchPassword(password, user.password)
    
    if (validPassword) {      
      done(null, user, req);   
    } else {
      done(null, false, req.flash('message', 'Contraseña incorrecta'));       

    }
  } else {
    return done(null, false, req.flash('message', 'Este usuario no existe.'));
  }
}));

// passport.use('local.signup', new LocalStrategy({
//   usernameField: 'username',
//   passwordField: 'password',
//   passReqToCallback: true
// }, async (req, username, password, done) => {

//   const { fullname } = req.body;
//   let newUser = {
//     fullname,
//     username,
//     password
//   };
//   newUser.password = await helpers.encryptPassword(password);
//   // Saving in the Database
//   const result = await pool.query('INSERT INTO users SET ? ', newUser);
//   newUser.id = result.insertId;
//   return done(null, newUser);
// }));


// new sign up users
passport.use('local.signup', new LocalStrategy({
  usernameField: 'name',
  passwordField: 'password',
  passReqToCallback: true
}, async (req, name, password, done) => {

  const { lastname,dni,email } = req.body;
  let id_rol=0,
    newUser = {  
    id_rol,
    lastname,
    email,
    dni,
    name,
    password
  };
  const query = await pool.query('SELECT * FROM users WHERE email = ?', [email]);
  if (query.length > 0) {
     done(null, false, req.flash('message', 'Este email ya está registrado'));  
  } else {
      newUser.password = await helpers.encryptPassword(password);
    // Saving in the Database
    const result = await pool.query('INSERT INTO users SET ? ', newUser);
    newUser.id = result.insertId;    
    return done(null, newUser);
  } 
  // 
  
}));



passport.serializeUser((user, done) => {
  done(null, user.id);
});

passport.deserializeUser(async (id, done) => {
  const rows = await pool.query('SELECT * FROM users WHERE id = ?', [id]);
  done(null, rows[0]);
});


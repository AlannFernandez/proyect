const express = require('express');
const router = express.Router();

const passport = require('passport');
const { isLoggedIn } = require('../lib/auth');



// SINGUP COMPANYS
router.get('/company', (req, res) => {
  res.render('auth/company');
});
router.post('/company', passport.authenticate('local.company', {
  successRedirect: '/profile', // switch to redirect to dashbord
  failureRedirect: '/company',
  failureFlash: true
}));

// SIGNUP
router.get('/signup', (req, res) => {
  res.render('auth/signup');
});
router.get('/ingreso', (req, res) => {
  res.render('auth/ingreso');
});

router.get('/ingreso', isLoggedIn, async (req, res)=>{
  console.log("ya está logeado")
});

router.post('/signup', passport.authenticate('local.signup', {
  successRedirect: '/profile',
  failureRedirect: '/signup',
  failureFlash: true
}));

// SINGIN
router.get('/signin', (req, res) => {
  res.render('auth/signin');
});

router.post('/signin', (req, res, next) => {
  req.check('username', 'Ingresá tu usuario').notEmpty();
  req.check('password', 'ingresá una contraseña').notEmpty();
  const errors = req.validationErrors();
  if (errors.length > 0) {
    req.flash('message', errors[0].msg);         
    res.redirect('/ingreso');
  }
  passport.authenticate('local.signin', {
    successRedirect: '/',
    failureRedirect: '/ingreso',
    failureFlash: true
  })(req, res, next);
});

router.get('/logout', (req, res) => {
  req.logOut();
  res.redirect('/');
});

router.get('/profile', isLoggedIn, (req, res) => {
  res.render('profile');
});



module.exports = router;

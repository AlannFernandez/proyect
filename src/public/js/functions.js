document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems);
  


  $('.category_item[category="restaurante"] .dDVVFO .img-bg').addClass('item-active');

  // select category
  $('.category_item').click(function(){
    var catProduct = $(this).attr('category');
		console.log(catProduct);

    // agreagando borde
    $('.category_item').removeClass('jMHddQ');
		$(this).addClass('');

    // OCULTANDO PRODUCTOS =========================
		$('.company-category').css('transform', 'scale(0)');
		function hideProduct(){
			$('.company-category').hide();
		} setTimeout(hideProduct,400);

    // MOSTRANDO PRODUCTOS =========================
		function showProduct(){
			const sc = $('.company-category[category="'+catProduct+'"]').show();
      if (sc.length<1){      
        $('#busqueda').html('<p>Ups! al paracer no hay locales disponibles </p>')
        
      }else{
        
        $('.company-category[category="'+catProduct+'"]').css('transform', 'scale(1)');
        
      }
		} setTimeout(showProduct,400);
  });


  // carrito delete
  $('.quit-cart').click(function(){
    var prod = $(this).attr('id');
		console.log(prod);

    // se envia el id del producto a eliminar y se envia por ajax
    product_id = prod;

    const URI = '/links/quitCart';

    $.ajax({
      url: URI,
      method: 'POST',
      data: {
        product_id
      },
      success: function(res) {
        if(res){

          toastr["warning"]("eliminado del carrito", "Hecho")
          toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "100",
            "hideDuration": "1000",
            "timeOut": "2000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
          }

        }

      },
      error: function(error){

      }

    });


    // se oculta la etiqueta del producto
    $('.'+prod+'').hide();
  });

  // aumentar cantidad del item
  $('.plus-cart').click(function (){
    var prod = $(this).attr('id');
    console.log("aumentar "+prod )
    
  })



});



const PUBLIC_VAPID_KEY = 'BM4IVJoZisF0FAc_Bx0VDnRvCgRifTTmY-3asAvfWUHTmG5l2pr14HTI6Y2B7MSX_BnOWPNuVWX8sX0jJG8ijKE';


const subscription = async () => {
  // Service Worker
  console.log("Registering a Service worker");
  const register = await navigator.serviceWorker.register("/sw.js", {
    scope: "/"
  });
  console.log("New Service Worker");

  // Listen Push Notifications
  console.log("Listening Push Notifications");
  const subscription = await register.pushManager.subscribe({
    userVisibleOnly: true,
    applicationServerKey: urlBase64ToUint8Array(PUBLIC_VAPID_KEY)
  });

  console.log(subscription);

  // Send Notification
  await fetch("/push", {
    method: "POST",
    body: JSON.stringify(subscription),
    headers: {
      "Content-Type": "application/json"
    }
  });
  console.log("Subscribed!");
};


function urlBase64ToUint8Array(base64String) {
  const padding = "=".repeat((4 - (base64String.length % 4)) % 4);
  const base64 = (base64String + padding).replace(/-/g, "+").replace(/_/g, "/");

  const rawData = window.atob(base64);
  const outputArray = new Uint8Array(rawData.length);

  for (let i = 0; i < rawData.length; ++i) {
    outputArray[i] = rawData.charCodeAt(i);
  }
  return outputArray;
}




const form = document.querySelector('#myform');
const message = document.querySelector('#message');
form.addEventListener('submit', (e) => {
  e.preventDefault();
  fetch('/links/pedido', {
    method: 'POST',
    body: JSON.stringify({message: message.value}),
    headers: {
      'Content-Type': 'application/json'
    }
  });
  form.reset();
});

// Service Worker Support
if ("serviceWorker" in navigator) {
  subscription().catch(err => console.log(err));
}


$(document).ready(function(){
  // ejecutar el sidenav para dispostivos mobiles
  $('.sidenav').sidenav();

 

  

  
  
});

function countChars(obj){
  var maxLength = 120;
  var strLength = obj.value.length;
  var charRemain = (maxLength - strLength);
  
  if(charRemain < 0){
      document.getElementById("charNum").innerHTML = '<span style="color: red;">Excediste los '+maxLength+' caracteres permitidos</span>';
      document.getElementById("checkout__notes__continue").disabled = true;
  }else{
      document.getElementById("charNum").innerHTML = charRemain+' caracteres disponibles';
      document.getElementById("checkout__notes__continue").disabled = false;
  }
}



// -----------------------  validations forms -------------------------

// form signUp
const SignUp = document.getElementById('formSingup');
const inputs = document.querySelectorAll('#formSingup input');
const expresions = {
  email: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
  names: /^[a-zA-ZÀ-ÿ\s]{1,40}$/, // Letras y espacios, pueden llevar acentos.
	password: /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d){8,15}[^'\s]/,
	dni: /^\d{8}$/ // 8 numeros.
}


const validateForm = (e)=>{
  switch(e.target.name){
    
    // NAME
    case "name":
      if(expresions.names.test(e.target.value)){
        console.log('nombre aceptado');
               
      }else{      
        console.log('ingrese un nombre valido');
      }
    break;
    // LASTNAME
    case "lastname":
      if(expresions.names.test(e.target.value)){
        console.log('apellido aceptado');
      }else{      
        console.log('ingrese un apellido valido');
      }
    break;
    // dni
    case "dni":
      if(expresions.dni.test(e.target.value)){
        console.log('dni aceptado');        
      }else{      
        console.log('ingrese un dni valido');
      }
    break;
    // MAIL
    case "email":
      if(expresions.email.test(e.target.value)){
        console.log('email aceptado');        
      }else{      
        console.log('ingrese un email valido');
      }
    break;
    // PASSWORD
    case "password":
      if(expresions.password.test(e.target.value)){
        console.log('contraseña aceptado');
      }else{      
        console.log('ingrese una contraseña valida');
      }
    break;
  }
}

inputs.forEach((input)=>{
  input.addEventListener('keyup', validateForm);
  input.addEventListener('blur', validateForm);
});



// --------------------cart functions--------------------------
function add(id){
const bntCart = document.getElementById(id);
 if(bntCart.value == "add"){ 
    let product_id=id;
    const URI = '/links/addCart';
    $.ajax({
        url: URI,
        method: 'POST',
        data: {
          product_id
        },
        success: function(res) {       
          if(res){
            toastr["success"]("añadido al carrito", "Hecho")
            toastr.options = {
              "closeButton": false,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-top-left",
              "preventDuplicates": false,
              "onclick": null,
              "showDuration": "300",
              "hideDuration": "1000",
              "timeOut": "5000",
              "extendedTimeOut": "1000",
              "showEasing": "swing",
              "hideEasing": "linear",
              "showMethod": "fadeIn",
              "hideMethod": "fadeOut"
            }
          }
          
        },
        error: function (err) {
          console.log(err);
          toastr["error"]("Al parecer ha ocurrido un error", "Ups");
        }
    });   
    bntCart.classList.remove('bttnapc');
    bntCart.classList.add('bttnqpc'); 
    bntCart.innerHTML ='Quitar<svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="#fff"><path d="M0 0h24v24H0z" fill="none"/><path d="M22.73 22.73L2.77 2.77 2 2l-.73-.73L0 2.54l4.39 4.39 2.21 4.66-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h7.46l1.38 1.38c-.5.36-.83.95-.83 1.62 0 1.1.89 2 1.99 2 .67 0 1.26-.33 1.62-.84L21.46 24l1.27-1.27zM7.42 15c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h2.36l2 2H7.42zm8.13-2c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H6.54l9.01 9zM7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2z"/></svg>'
    bntCart.value = "quit";    
    return;
  }else{
    let product_id=id;
    const URI = '/links/quitCart';
    $.ajax({
      url: URI,
      method: 'POST',
      data: {
        product_id
      },
      success: function(res) {
        if(res){
          toastr["warning"]("eliminado del carrito", "Hecho")
          toastr.options = {
            "closeButton": false,
            "debug": false,
            "newestOnTop": false,
            "progressBar": false,
            "positionClass": "toast-top-center",
            "preventDuplicates": false,
            "onclick": null,
            "showDuration": "100",
            "hideDuration": "1000",
            "timeOut": "2000",
            "extendedTimeOut": "1000",
            "showEasing": "swing",
            "hideEasing": "linear",
            "showMethod": "fadeIn",
            "hideMethod": "fadeOut"
          }

        }
      },
      error: function (err) {
        console.log(err);
      }
    });
    bntCart.classList.remove('bttnqpc');
    bntCart.classList.add('bttnapc');
    bntCart.innerHTML ='Añadir<svg xmlns="http://www.w3.org/2000/svg" height="20px" viewBox="0 0 24 24" width="20px" fill="#fff"><path d="M0 0h24v24H0zm18.31 6l-2.76 5z" fill="none"/><path d="M11 9h2V6h3V4h-3V1h-2v3H8v2h3v3zm-4 9c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2zm-9.83-3.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.86-7.01L19.42 4h-.01l-1.1 2-2.76 5H8.53l-.13-.27L6.16 6l-.95-2-.94-2H1v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.13 0-.25-.11-.25-.25z"/></svg>';
    bntCart.value = "add";
    return; 
  }
  
}
function quit(id){
const bntCart = document.getElementById(id);
const div = document.getElementsByClassName(id);
  let product_id=id;
  const URI = '/links/quitCart';
  $.ajax({
    url: URI,
    method: 'POST',
    data: {
      product_id
    },
    success: function(res) {
      if(res){
      toastr["warning"]("eliminado del carrito", "Hecho")
      toastr.options = {
        "closeButton": false,
        "debug": false,
        "newestOnTop": false,
        "progressBar": false,
        "positionClass": "toast-top-center",
        "preventDuplicates": false,
        "onclick": null,
        "showDuration": "100",
        "hideDuration": "1000",
        "timeOut": "2000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
      }
      div.style.display="none";
    }
    },
    error: function (err) {
      console.log(err);
    }
  });
  return; 
  
  
}

// ////////////////////  /cart functions  ////////////////////// 



// ////////////////////   PROFILE    /////////////////////////////


// Updates users thelephones

  $("#updateTel").click(function(e){
    e.preventDefault();
      const tel = document.querySelector('#newTel').value;      
      let telephone=tel;
      const URI = '/links/UpdateTel';
      $.ajax({
        url: URI,
        method: 'POST',
        data: {
          telephone
        },
          success: function(){
              console.log("se cambio el telefono");
          }
      });
  });







// datatable
window.addEventListener('DOMContentLoaded', event => {
  // Simple-DataTables
  // https://github.com/fiduswriter/Simple-DataTables/wiki
  
  const datatablesSimple = document.getElementById('datatablesSimple');
  if (datatablesSimple) {
      new simpleDatatables.DataTable(datatablesSimple,{
        searchable: true,
        perPage:5,
        language: {
          url:"spanish.json"
        }   
      });      
  }
});
 



// area chart

Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

function number_format(number, decimals, dec_point, thousands_sep) {
  // *     example: number_format(1234.56, 2, ',', ' ');
  // *     return: '1 234,56'
  number = (number + '').replace(',', '').replace(' ', '');
  var n = !isFinite(+number) ? 0 : +number,
    prec = !isFinite(+decimals) ? 0 : Math.abs(decimals),
    sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep,
    dec = (typeof dec_point === 'undefined') ? '.' : dec_point,
    s = '',
    toFixedFix = function(n, prec) {
      var k = Math.pow(10, prec);
      return '' + Math.round(n * k) / k;
    };
  // Fix for IE parseFloat(0.55).toFixed(0) = 0;
  s = (prec ? toFixedFix(n, prec) : '' + Math.round(n)).split('.');
  if (s[0].length > 3) {
    s[0] = s[0].replace(/\B(?=(?:\d{3})+(?!\d))/g, sep);
  }
  if ((s[1] || '').length < prec) {
    s[1] = s[1] || '';
    s[1] += new Array(prec - s[1].length + 1).join('0');
  }
  return s.join(dec);
}

// Area Chart Example
var ctx = document.getElementById("myAreaChart");
var numeros = [0, 10000, 15000, 15000, 10000, 20000, 10500, 25000, 42000, 43000, 25000, 40000];
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
    datasets: [{
      label: "Ingresos",
      lineTension: 0.3,
      backgroundColor: "rgba(78, 115, 223, 0.05)",
      borderColor: "rgba(78, 115, 223, 1)",
      pointRadius: 3,
      pointBackgroundColor: "rgba(78, 115, 223, 1)",
      pointBorderColor: "rgba(78, 115, 223, 1)",
      pointHoverRadius: 3,
      pointHoverBackgroundColor: "rgba(78, 115, 223, 1)",
      pointHoverBorderColor: "rgba(78, 115, 223, 1)",
      pointHitRadius: 10,
      pointBorderWidth: 2,
      data: numeros,
    }],
  },
  options: {
    maintainAspectRatio: false,
    layout: {
      padding: {
        left: 10,
        right: 25,
        top: 25,
        bottom: 0
      }
    },
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false,
          drawBorder: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          maxTicksLimit: 5,
          padding: 10,
          // Include a dollar sign in the ticks
          callback: function(value, index, values) {
            return '$' + number_format(value);
          }
        },
        gridLines: {
          color: "rgb(234, 236, 244)",
          zeroLineColor: "rgb(234, 236, 244)",
          drawBorder: false,
          borderDash: [2],
          zeroLineBorderDash: [2]
        }
      }],
    },
    legend: {
      display: false
    },
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      titleMarginBottom: 10,
      titleFontColor: '#6e707e',
      titleFontSize: 14,
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      intersect: false,
      mode: 'index',
      caretPadding: 10,
      callbacks: {
        label: function(tooltipItem, chart) {
          var datasetLabel = chart.datasets[tooltipItem.datasetIndex].label || '';
          return datasetLabel + ': $' + number_format(tooltipItem.yLabel);
        }
      }
    }
  }
});
// Set new default font family and font color to mimic Bootstrap's default styling
Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#858796';

// Pie Chart Example
var ctx = document.getElementById("myPieChart");
var myPieChart = new Chart(ctx, {
  type: 'doughnut',
  data: {
    labels: ["Bebidas", "Pizza", "Hamburguesa"],
    datasets: [{
      data: [55, 30, 15],
      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
      hoverBorderColor: "rgba(234, 236, 244, 1)",
    }],
  },
  options: {
    maintainAspectRatio: false,
    tooltips: {
      backgroundColor: "rgb(255,255,255)",
      bodyFontColor: "#858796",
      borderColor: '#dddfeb',
      borderWidth: 1,
      xPadding: 15,
      yPadding: 15,
      displayColors: false,
      caretPadding: 10,
    },
    legend: {
      display: false
    },
    cutoutPercentage: 80,
  },
});

// function view img add product

function archivo(evt) {
  var files = evt.target.files;
   
  //Obtenemos la imagen del campo "file". 
  for (var i = 0, f; f = files[i]; i++) {         
    //Solo admitimos imágenes.
    if (!f.type.match('image.*')) {
      continue;
    }
   
    var reader = new FileReader();
       
    reader.onload = (function(theFile) {
      return function(e) {
        // Creamos la imagen.
        document.getElementById("list").innerHTML = ['<img class="thumb" src="', e.target.result,'" title="', escape(theFile.name), '"/>'].join('');
      };
    })(f);

    reader.readAsDataURL(f);
   }
}
document.getElementById('files').addEventListener('change', archivo, false);

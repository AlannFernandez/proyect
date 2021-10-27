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


document.addEventListener('DOMContentLoaded', function() {
  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems);
});

$(document).ready(function(){
  // ejecutar el sidenav para dispostivos mobiles
  $('.sidenav').sidenav();

  // envia un evento post para comprobar si el usuario tiene productos en el carrito
  const URI ='/links/inicio';
  $.ajax({
    url: URI,
    method: 'POST',
    data: {
    },
    success: function(res) {       
      if(res.length>0){               
        let bdcart = document.querySelector('#badge-cart');
        bdcart.style.display = "block";        
      }
    },
    error: function (err) {
      console.log(err);
    }
  });

  
  
});
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
            toastr["success"]("Producto agregado al carrito", "EXITO")
            toastr.options = {
              "closeButton": true,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-bottom-right",
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
    bntCart.classList.remove('btn-primary');
    bntCart.classList.add('btn-grey');
    bntCart.innerHTML ='<i class="fas fa-cart-plus mr-2" aria-hidden="true"></i>Quitar del carrito';
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
        toastr["info"]("Producto quitado del carrito", "EXITO")

        toastr.options = {
          "closeButton": true,
          "debug": false,
          "newestOnTop": false,
          "progressBar": false,
          "positionClass": "toast-bottom-right",
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
      }
    });
    bntCart.classList.remove('btn-grey');
    bntCart.classList.add('btn-primary');
    bntCart.innerHTML ='<i class="fas fa-cart-plus mr-2" aria-hidden="true"></i>Añadir al carrito';
    bntCart.value = "add";
    return; 
  }
  
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

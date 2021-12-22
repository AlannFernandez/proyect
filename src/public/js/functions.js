
document.addEventListener('DOMContentLoaded', function() {
  $('.preloader').fadeOut('slow');
  


  var elems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(elems);
  


  $('.category_item[category="restaurante"] .dDVVFO .img-bg').addClass('item-active');
  $('.company-category').hide();
  $('.company-category[category="restaurante"]').show();
  // select category
  $('.category_item').click(function(){
    var catProduct = $(this).attr('category');
		

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
        $('#busqueda').html('<img src="/img/icons/undraw_house_searching_re_stk8.svg" alt="emptys companies" srcset="">')
        
      }else{
        $('.empty').hide();
        $('.company-category[category="'+catProduct+'"]').css('transform', 'scale(1)');
        
      }
		} setTimeout(showProduct,400);
  });

  // section shops
  $('.full_width').ready(function () {
    
    // obtengo todos los elemento con las clases catego
    var divs=$('.catego');

    // mediante la estructura for obtengo el atributo nombre de los div con clases catego 
    for (let i = 0; i < divs.length; i++) {
      
      // guardo los nombre en la variable namecategory
      var namecategory=$(divs[i]).attr('name');            

      // selecciono todos los productos donde el atributo category sea igual al namecategory
      const prods = $('#infocard[category="'+namecategory+'"]');

      // realizo un conteo de los productos con esa categoria mediante otra estructura for
      for(let j=0; j<prods.length; j++){
        const ps = $('#infocard[category="'+namecategory+'"]');
        $('.catego[name="'+namecategory+'"]').append(ps);                       
      }
      
      // $(divs[i]).append("prods"+[i]);

      
    }
  })


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
    $('.ProductContainer[id="'+prod+'"]').remove();
  });

  // aumentar cantidad del item
  $('.plus-cart').click(function (){
    var item = $(this).attr('id');
    var price=$('.Price-unitary[id="'+item+'"]').val();
    $('.quit-cart[id="'+item+'"]').hide();    
    $('.minus-cart[id="'+item+'"]').show();
    var qc=$('.quant-cart[id="'+item+'"]').val();
    qc++;
    $('.quant-cart[id="'+item+'"]').val(qc);
    
    $('.kcpDNn[id="'+item+'"]').html(qc)
    
    var total = price*qc;
    
    totalPurchase()
  })
  // disminur cantidad del item
  $('.minus-cart').click(function (){
    var item = $(this).attr('id');
    var price=$('.Price-unitary[id="'+item+'"]').val();
    var qc=$('.quant-cart[id="'+item+'"]').val();
    if(qc>1){
      qc--;
      $('.quant-cart[id="'+item+'"]').val(qc);      
      $('.kcpDNn[id="'+item+'"]').html(qc);
      var total = price*qc;
      totalPurchase();
      if(qc==1){
        $('.minus-cart[id="'+item+'"]').hide();
        $('.quit-cart[id="'+item+'"]').show();
      }
    }
    
    
  })
  
  // total purchase
  function totalPurchase(){
    var PriceUnitary=$('.Price-unitary').val();
    var Q=$('.quant-cart').val();
    var total = PriceUnitary * Q;
    $('.priceTotalPurchase').val(total);
  }
 
  $('.priceTotalPurchase').ready(totalPurchase);
  
  $('.pricePurchase').ready(function(){
    // var subTotal=$('.subTotal').val();
    // var PriceDelivery=$('.priceDelivery').val();
    totalPur = parseInt($('.subTotal').val()) + parseInt($('.priceDelivery').val());
    $('.pricePurchase').val(totalPur);
    $('.spntlprcs').html('$'+totalPur);

  });
  // add shops favorite

  $('#addFav  ').click(function() {
    $('#addFav').hide();
    $('.lkWCDe').append('<svg id="quitFav" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="15" height="15"><path fill="none" d="M0 0H24V24H0z"/><path d="M12.001 4.529c2.349-2.109 5.979-2.039 8.242.228 2.262 2.268 2.34 5.88.236 8.236l-8.48 8.492-8.478-8.492c-2.104-2.356-2.025-5.974.236-8.236 2.265-2.264 5.888-2.34 8.244-.228z" fill="rgba(231,76,60,1)"/></svg>')
  })

  $('#quitFav').click(function () {
    $('#quitFav').hide();
    $('#addFav').show();
    
  })



  $('.add-add1').click(function(){
    $(location).attr('href','/links/address');
  })
  
  // ocultar productos vista shops
 

  // carga de mapa comercios
  // $('#map').ready(function(){
  //   const lat = $('#lat').val();
  //   const lng = $('#lng').val();
    
  //   var mymap = L.map('map',{zoomControl:false}).setView([-28.05815970583552,-56.01599463603798], 15 );
  //   L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {

  //   }).addTo(mymap);
  //   // add marker 
  //   L.marker([lat,lng]).addTo(mymap)
  //   .bindPopup('Estamos aquí')
  //   .openPopup();

  // })
  

  // modals
  $('.modal').modal();
  
  // img profile users
  $('#img_url').click(function(){
    $('#files').click();
  })
  
  // data table for dashboard 
  $('#tableProducts').DataTable( {
    
    language: {
      "processing": "Procesando...",
      "lengthMenu": "Mostrar _MENU_ registros",
      "zeroRecords": "No se encontraron resultados",
      "emptyTable": "Ningún dato disponible en esta tabla",
      "infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
      "infoFiltered": "(filtrado de un total de _MAX_ registros)",
      "search": "Buscar:",
      "infoThousands": ",",
      "loadingRecords": "Cargando...",
      "paginate": {
          "first": "Primero",
          "last": "Último",
          "next": "Siguiente",
          "previous": "Anterior"
      },
      "aria": {
          "sortAscending": ": Activar para ordenar la columna de manera ascendente",
          "sortDescending": ": Activar para ordenar la columna de manera descendente"
      },
      "buttons": {
          "copy": "Copiar",
          "colvis": "Visibilidad",
          "collection": "Colección",
          "colvisRestore": "Restaurar visibilidad",
          "copyKeys": "Presione ctrl o u2318 + C para copiar los datos de la tabla al portapapeles del sistema. <br \/> <br \/> Para cancelar, haga clic en este mensaje o presione escape.",
          "copySuccess": {
              "1": "Copiada 1 fila al portapapeles",
              "_": "Copiadas %d fila al portapapeles"
          },
          "copyTitle": "Copiar al portapapeles",
          "csv": "CSV",
          "excel": "Excel",
          "pageLength": {
              "-1": "Mostrar todas las filas",
              "_": "Mostrar %d filas"
          },
          "pdf": "PDF",
          "print": "Imprimir"
      },
      "autoFill": {
          "cancel": "Cancelar",
          "fill": "Rellene todas las celdas con <i>%d<\/i>",
          "fillHorizontal": "Rellenar celdas horizontalmente",
          "fillVertical": "Rellenar celdas verticalmentemente"
      },
      "decimal": ",",
      "searchBuilder": {
          "add": "Añadir condición",
          "button": {
              "0": "Constructor de búsqueda",
              "_": "Constructor de búsqueda (%d)"
          },
          "clearAll": "Borrar todo",
          "condition": "Condición",
          "conditions": {
              "date": {
                  "after": "Despues",
                  "before": "Antes",
                  "between": "Entre",
                  "empty": "Vacío",
                  "equals": "Igual a",
                  "notBetween": "No entre",
                  "notEmpty": "No Vacio",
                  "not": "Diferente de"
              },
              "number": {
                  "between": "Entre",
                  "empty": "Vacio",
                  "equals": "Igual a",
                  "gt": "Mayor a",
                  "gte": "Mayor o igual a",
                  "lt": "Menor que",
                  "lte": "Menor o igual que",
                  "notBetween": "No entre",
                  "notEmpty": "No vacío",
                  "not": "Diferente de"
              },
              "string": {
                  "contains": "Contiene",
                  "empty": "Vacío",
                  "endsWith": "Termina en",
                  "equals": "Igual a",
                  "notEmpty": "No Vacio",
                  "startsWith": "Empieza con",
                  "not": "Diferente de"
              },
              "array": {
                  "not": "Diferente de",
                  "equals": "Igual",
                  "empty": "Vacío",
                  "contains": "Contiene",
                  "notEmpty": "No Vacío",
                  "without": "Sin"
              }
          },
          "data": "Data",
          "deleteTitle": "Eliminar regla de filtrado",
          "leftTitle": "Criterios anulados",
          "logicAnd": "Y",
          "logicOr": "O",
          "rightTitle": "Criterios de sangría",
          "title": {
              "0": "Constructor de búsqueda",
              "_": "Constructor de búsqueda (%d)"
          },
          "value": "Valor"
      },
      "searchPanes": {
          "clearMessage": "Borrar todo",
          "collapse": {
              "0": "Paneles de búsqueda",
              "_": "Paneles de búsqueda (%d)"
          },
          "count": "{total}",
          "countFiltered": "{shown} ({total})",
          "emptyPanes": "Sin paneles de búsqueda",
          "loadMessage": "Cargando paneles de búsqueda",
          "title": "Filtros Activos - %d"
      },
      "select": {
          "cells": {
              "1": "1 celda seleccionada",
              "_": "%d celdas seleccionadas"
          },
          "columns": {
              "1": "1 columna seleccionada",
              "_": "%d columnas seleccionadas"
          },
          "rows": {
              "1": "1 fila seleccionada",
              "_": "%d filas seleccionadas"
          }
      },
      "thousands": ".",
      "datetime": {
          "previous": "Anterior",
          "next": "Proximo",
          "hours": "Horas",
          "minutes": "Minutos",
          "seconds": "Segundos",
          "unknown": "-",
          "amPm": [
              "AM",
              "PM"
          ],
          "months": {
              "0": "Enero",
              "1": "Febrero",
              "10": "Noviembre",
              "11": "Diciembre",
              "2": "Marzo",
              "3": "Abril",
              "4": "Mayo",
              "5": "Junio",
              "6": "Julio",
              "7": "Agosto",
              "8": "Septiembre",
              "9": "Octubre"
          },
          "weekdays": [
              "Dom",
              "Lun",
              "Mar",
              "Mie",
              "Jue",
              "Vie",
              "Sab"
          ]
      },
      "editor": {
          "close": "Cerrar",
          "create": {
              "button": "Nuevo",
              "title": "Crear Nuevo Registro",
              "submit": "Crear"
          },
          "edit": {
              "button": "Editar",
              "title": "Editar Registro",
              "submit": "Actualizar"
          },
          "remove": {
              "button": "Eliminar",
              "title": "Eliminar Registro",
              "submit": "Eliminar",
              "confirm": {
                  "_": "¿Está seguro que desea eliminar %d filas?",
                  "1": "¿Está seguro que desea eliminar 1 fila?"
              }
          },
          "error": {
              "system": "Ha ocurrido un error en el sistema (<a target=\"\\\" rel=\"\\ nofollow\" href=\"\\\">Más información&lt;\\\/a&gt;).<\/a>"
          },
          "multi": {
              "title": "Múltiples Valores",
              "info": "Los elementos seleccionados contienen diferentes valores para este registro. Para editar y establecer todos los elementos de este registro con el mismo valor, hacer click o tap aquí, de lo contrario conservarán sus valores individuales.",
              "restore": "Deshacer Cambios",
              "noMulti": "Este registro puede ser editado individualmente, pero no como parte de un grupo."
          }
      },
      "info": "Mostrando _START_ a _END_ de _TOTAL_ registros"
    }
  });

  // count chars text area
  $('input#input_text, textarea#textarea2').characterCounter();
  
  // select address delivery
  $( "#direction input[name='address_delivery']" ).change(function() {
    var direccion = $(this).val();  
    var id_dir =$(this).attr('id');    
    $('#user_id_add').val(id_dir);    
    $('#address_selected').val(direccion);    
  });

  // select method_payment
  $( "#methods_payment input[name='method_payment']" ).change(function() {
    var metodo = $(this).val();     
    $('#method_selected').val(metodo);    
  });
    
  $('.chip').ready(function(){
    $('.chip').hide();
  })

  // add notes to product  
  $('#Add_notes').click(function(){        
    var notes = $("textarea[name='notesToProduct']").val();   
    // verifica si la nota no supera los 120 caracteres 
    if(notes.length<120){
      $('#msg_notes').hide();
      // si no pasa los 120 caracteres añade la nota y agrega un  chip para quitar la nota
      $('#notes_To_Product').val(notes);               
      var chip = $('.chip').show();
        chip.click(function(){
          $('#notes_To_Product').val("");
          $("textarea[name='notesToProduct']").val("");       
          $('.chip').hide();  
        });
    }else{    
      // si pasa los caracteres permitidos no permite agregar la nota 
      $('#msg_notes').show();
      $('#msg_notes').html("Se pasó de carácteres permitidos");
      return false;
    }
    
  });
  
  $('.dropdown-trigger').dropdown();
  $('select').formSelect();
  $('.collapsible').collapsible();

  $("#mkdlvy").click(function() {  
    if($("#mkdlvy").is(':checked')) {  
        $('#price_delivey').show();
    } else {  
      $('#price_delivey').hide();
    }  
  });  

  $('.AttentionDays').click(function(){
    
      var day = $(this).attr('id');
      
  
  });
  $('.timepicker').timepicker({twelveHour:false});

  $('.fixed-action-btn').floatingActionButton({
    direction: 'top',
    hoverEnabled: false
  });
  $('.tabs').tabs();
  // save locations
  $('#map').ready(function(){
                   
    if(!navigator.geolocation) {
      alert("tu dispositivo no es compatible con esta funcion");
    } else {
      
      var mymap = L.map('map',{zoomControl:false}).setView([-28.05815970583552,-56.01599463603798], 17 );
      L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
  
      }).addTo(mymap);
      // geolocalizar al usuario cuando haga click en el boton
      $('#eneable-geo').click(function(){      
        navigator.geolocation.getCurrentPosition(getPosition,showError);
      }); 
      // 
      // set variables to marker
      var latitud;
      var longitud;
      var marker;
      
      // eneable high accuracy to geolocation
      mymap.locate({enableHighAccuracy: true})
      
      // disable zoom dblclick
      mymap.doubleClickZoom.disable();  

      // function to geolocation user
      function getPosition(position){
          
        var lat = position.coords.latitude
        var long = position.coords.longitude
        var accuracy = position.coords.accuracy

        if(marker) {
          mymap.removeLayer(marker);
        }    

        marker = L.marker([lat, long]);
        
        var featureGroup = L.featureGroup([marker]).addTo(mymap);

        mymap.fitBounds(featureGroup.getBounds());   
        latitud = position.coords.latitude;
        longitud = position.coords.longitude;
      }
      // types of errors
      function showError(error){
        switch(error.code) {
            case error.PERMISSION_DENIED:
              alert ( "El usuario denegó el acceso a su ubicación.")
              break;
            case error.POSITION_UNAVAILABLE:
             alert( "La ubicacón no está disponible")
              break;
            case error.TIMEOUT:
              alert( "Se agotó el tiempo de espera.")
              break;
            case error.UNKNOWN_ERROR:
             alert( "Ha ocurrido un error inesperado.")
              break;
          }
      }
      //add marker click
      mymap.on('click', e=>{        
        let latlng = mymap.mouseEventToLatLng(e.originalEvent);
        if(marker) {
          mymap.removeLayer(marker);
        }
        marker = L.marker([latlng.lat, latlng.lng]);

        var featureGroup = L.featureGroup([marker]).addTo(mymap);

        mymap.fitBounds(featureGroup.getBounds());  
        latitud = latlng.lat;
        longitud = latlng.lng;
      });
      $('#save-geo').click(function(){      
          if(!marker){
            toastr["error"]("Debes ingresar una ubicación antes", "Error")
            toastr.options = {
              "closeButton": true,
              "debug": false,
              "newestOnTop": false,
              "progressBar": false,
              "positionClass": "toast-top-full-width",
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
          }else{
            // modal
            $('#nameToGeo').click();              
            //  set values
            $('#latitud').val(latitud);
            $('#longitud').val(longitud);
           
          }
      }); 
      
    }  

  });

 

});

function img_pathUrl(input){
  $('#img_url')[0].src = (window.URL ? URL : webkitURL).createObjectURL(input.files[0]);
  $('#img_url').show();
  $('#profile_img').show();
  $('#lblfl').hide();
}  

const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container-auth");

sign_up_btn.addEventListener("click", () => {
  container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
  container.classList.remove("sign-up-mode");
});





// ////////////////////////////////////////////////////////////////////////////////////////////////
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




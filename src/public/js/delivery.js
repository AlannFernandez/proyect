
    let map = L.map('map-template').setView([-28.05815970583552,-56.01599463603798], 15);
    
    

    // si el navegador soporta geolocalizacion inicia el codigo
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(mostrarUbicacion,showError);    
        
        var latDes = $('#lat-clien').val()
        var lngDes = $('#lng-clien').val()
        // determina la ubicacion del dispositivo y la agrega al mapa
        function mostrarUbicacion (ubicacion) {        
            const lng = ubicacion.coords.longitude;
            const lat = ubicacion.coords.latitude;        
            usuario = L.marker([lat, lng]).bindPopup('estas aca');
            map.addLayer(usuario);   
            userdir = [lat,lng];                            
                        
            let latLng1 = L.latLng(-28.053390897785075,-56.0173548459352); //ubicacion del dispositivo
            let latLng2 = L.latLng(latDes, lngDes); //ubicacion del cliente
            
            
            // setea los puntos para trazar la ruta
            let wp1 = new L.Routing.Waypoint(latLng1);
            let wp2 = new L.Routing.Waypoint(latLng2);   
            
            //añade una nueva capa al mapa
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png').addTo(map);
            
            L.Routing.control({
                waypoints: [latLng1,latLng2],
                language: 'es'       
            }).addTo(map);

            let routeUs = L.Routing.osrmv1();
            routeUs.route([wp1,wp2],(err,routes)=>{
                if(!err)
                {
                    let best = 100000000000000;
                    let bestRoute = 0;
                    for(i in routes)
                    {
                        if(routes[i].summary.totalDistance < best) {
                            bestRoute = i;
                            best = routes[i].summary.totalDistance;
                        }
                    }
                    console.log('best route',routes[bestRoute]);
                    const totalKm =best/1000;
                    const to = parseInt(totalKm, 10)
                    const price = 200*to;
                    // alert("hay "+to+" km");
                    // alert("precio a pagar es $"+ price);
                    L.Routing.line(routes[bestRoute]).addTo(map);    
                }
            })
        }
        
        

        function showError(error){
            switch(error.code) {
                case error.PERMISSION_DENIED:
                  alert ( "User denied the request for Geolocation.")
                  break;
                case error.POSITION_UNAVAILABLE:
                 alert( "Location information is unavailable.")
                  break;
                case error.TIMEOUT:
                  alert( "The request to get user location timed out.")
                  break;
                case error.UNKNOWN_ERROR:
                 alert( "An unknown error occurred.")
                  break;
              }
        }
    }

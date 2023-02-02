
function search() {
	var form_action = "http://localhost:8080/listings/search/" + document.getElementsByName("q")
	var my_form = document.getElementById('search-form')
	my_form.action = form_action;
}

const icon = document.getElementById('icon-star');

icon.addEventListener('click', function onClick() {
	if(icon.style.color != "red") {
		icon.style.color = 'red';	
	} else {
		icon.style.color = '#ff93a3';
	}
})


// Initialize and add the map
function initMap() {
	var lat = Number(document.getElementById('lat').value)
	var lng = Number(document.getElementById('lng').value)
  const location = {lat: lat, lng:lng}
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 15,
    center: location,
  });
  const marker = new google.maps.Marker({
    position: location,
    map: map,
  });
}

window.initMap = initMap;

var fullAddress = '' 
function getFullAddress() {
	fullAddress = 
	document.getElementById('address').value + ' ' + 
	document.getElementById('city').value + ' ' + 
	document.getElementById('state').value + ' ' + 
	document.getElementById('zipcode').value + ' '
	};

var addressForm = document.getElementById('post-form');

addressForm.addEventListener('submit', geocode)

function geocode(e) {
	
	e.preventDefault();	
	
	var location = fullAddress
	console.log(location)
	axios.get('https://maps.googleapis.com/maps/api/geocode/json', {
		params: {
			address: location,
			key:'AIzaSyC3JKsnszRzH16v9NllpAI5h1l9_NIi_Bc'
		}	
	})	
	.then(function(res) {
		console.log(res)
		var formattedAddress = res.data.results[0].formatted_address;
		var formattedAddressOutput = `
		<ul class="list-group">
			<li class="list-group-item">${formattedAddress}</li>
		</ul>
		`;
		
		var addressComponents = res.data.results[0].address_components;
		var addressComponentsOutput = '<ul class="list-group">';
		for(var i = 0; i < addressComponents.length; i++) {
			addressComponentsOutput += `
				<li class="list-group-item"><strong>${addressComponents[i].types[0]}</strong>: ${addressComponents[i].long_name}</li>
			`;
		}
		
		addressComponentsOutput += '</ul>';
		
		//Geometry
		
		var lat = res.data.results[0].geometry.location.lat;
		var lng = res.data.results[0].geometry.location.lng;
		var geometryOutput = `
			<ul class="list-group">
				<li class="list-group-item"><strong>Latitude</strong>: ${lat}</li>
				<li class="list-group-item"><strong>Longitude</strong>: ${lng}</li>
			</ul>
		`;
		document.getElementById('addressLat').value = lat;
		document.getElementById('addressLng').value = lng;
		
		
		//output
		document.getElementById('formatted-address').innerHTML = formattedAddressOutput;
		document.getElementById('address-components').innerHTML = addressComponentsOutput;
		document.getElementById('geometry').innerHTML = geometryOutput;	

	})
	.catch(function(error) {
		console.log(error)
	})
}

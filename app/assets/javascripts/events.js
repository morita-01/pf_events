let map
let geocoder
//let centerp = {lat: 33.60639, lng: 130.41806}

//マップを表示する
function initMap(){
  geocoder = new google.maps.Geocoder()

  map = new google.maps.Map(document.getElementById('target'), {
    //center: codeAddress(),
    zoom: 17,
  });

  marker = new google.maps.Marker({
    //position: codeAddress(),
    map: map
  });
  
  //住所を地図の初期値に設定
  codeAddress()
}

//地図の住所の取得とマーカーを指定
function codeAddress(){
  let inputAddress = document.getElementById('address').value;

  geocoder.geocode( { 'address': inputAddress}, function(results, status) {
    if (status == 'OK') {
      map.setCenter(results[0].geometry.location);
      var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
      });
    } else {
      alert('該当する結果がありませんでした：' + status);
    }
  });   
}

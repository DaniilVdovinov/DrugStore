ymaps.ready(init);

function init(){
    var myMap = new ymaps.Map("map", {
        center: [55.79, 49.11],
        zoom: 12
    });
    yellowCollection = new ymaps.GeoObjectCollection(null, {
        preset: 'islands#yellowIcon'
    });

    blueCollection = new ymaps.GeoObjectCollection(null, {
        preset: 'islands#blueIcon'
    })

    greenCollection = new ymaps.GeoObjectCollection(null, {
        preset: 'islands#greenIcon'
    })

    for (var i = 0, l = AptekaRuMarkers.length; i < l; i++) {
        yellowCollection.add(new ymaps.Placemark(AptekaRuMarkers[i].geometry.coordinates, {
            hintContent: 'AptekaRu'
        }));
    }

    for(var i = 0, l = SakuraMarkers.length; i < l; i++){
        greenCollection.add(new ymaps.Placemark(SakuraMarkers[i].geometry.coordinates,{
            hintContent: 'Аптека Сакура'
        }));
    }

    myMap.geoObjects.add(yellowCollection).add(greenCollection);
}



{
  "propiedad": "Casa demo — Recorrido 360°",
  "inicio": "sala",
  "habitaciones": [
    {
      "id": "sala",
      "nombre": "Sala",
      "imagen": "img/sala.jpg",
      "yawInicial": 0,
      "conexiones": [
        { "destino": "cocina",   "pitch": -10, "yaw": 90 },
        { "destino": "recamara", "pitch": -10, "yaw": -90 }
      ]
    },
    {
      "id": "cocina",
      "nombre": "Cocina",
      "imagen": "img/cocina.jpg",
      "conexiones": [
        { "destino": "sala", "pitch": -10, "yaw": 180, "texto": "Regresar a la sala" }
      ]
    },
    {
      "id": "recamara",
      "nombre": "Recámara",
      "imagen": "img/recamara.jpg",
      "conexiones": [
        { "destino": "sala", "pitch": -10, "yaw": 180, "texto": "Regresar a la sala" }
      ]
    }
  ]
}
package handler

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api"
)

func GetSpotCity(w http.ResponseWriter, r *http.Request) {
	spotCity := mux.Vars(r)["city"]

	for _, singleSpot := range urbexSpots {
		if singleSpot.City == spotCity {
			json.NewEncoder(w).Encode(singleSpot)
		}
	}
}

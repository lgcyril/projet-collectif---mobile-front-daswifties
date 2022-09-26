package handler

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api"
)

func GetSpotName(w http.ResponseWriter, r *http.Request) {
	spotName := mux.Vars(r)["name"]

	for _, singleSpot := range urbexSpots {
		if singleSpot.ImageName == spotName {
			json.NewEncoder(w).Encode(singleSpot)
		}
	}
}

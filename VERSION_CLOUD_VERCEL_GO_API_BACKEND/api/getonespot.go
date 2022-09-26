package handler

import (
	"encoding/json"
	"github.com/gorilla/mux"
	"net/http"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api"
)

func GetOneSpot(w http.ResponseWriter, r *http.Request) {
	spotID := mux.Vars(r)["id"]

	for _, singleSpot := range urbexSpots {
		if singleSpot.ID == spotID {
			json.NewEncoder(w).Encode(singleSpot)
		}
	}
}

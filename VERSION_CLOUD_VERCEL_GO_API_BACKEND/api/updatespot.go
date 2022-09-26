package handler

import (
	"encoding/json"
	"fmt"
	"github.com/gorilla/mux"
	"io/ioutil"
	"net/http"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api"
)

func UpdateSpot(w http.ResponseWriter, r *http.Request) {
	spotID := mux.Vars(r)["id"]
	var updatedSpot urbex

	reqBody, err := ioutil.ReadAll(r.Body)
	if err != nil {
		fmt.Fprintf(w, "Kindly enter data with the event Name and description only in order to update")
	}
	json.Unmarshal(reqBody, &updatedSpot)

	for i, singleSpot := range urbexSpots {
		if singleSpot.ID == spotID {
			singleSpot.Name = updatedSpot.Name
			singleSpot.Description = updatedSpot.Description
			urbexSpots = append(urbexSpots[:i], singleSpot)
			json.NewEncoder(w).Encode(singleSpot)
		}
	}
}

package handler

import (
	"encoding/json"
	"fmt"
	"io/ioutil"

	//"log"
	"net/http"
	//"github.com/gorilla/mux"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api/crud"
)

func CreateSpot(w http.ResponseWriter, r *http.Request) {
	var newSpot urbex
	reqBody, err := ioutil.ReadAll(r.Body)
	if err != nil {
		fmt.Fprintf(w, "Kindly enter data with the urbex title and description only in order to update")
	}

	json.Unmarshal(reqBody, &newSpot)
	urbexSpots = append(urbexSpots, newSpot)
	w.WriteHeader(http.StatusCreated)

	json.NewEncoder(w).Encode(newSpot)
}

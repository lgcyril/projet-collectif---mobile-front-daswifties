package handler

import (
	"fmt"
	"github.com/gorilla/mux"
	"net/http"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api"
)

func DeleteSpot(w http.ResponseWriter, r *http.Request) {
	spotID := mux.Vars(r)["id"]

	for i, singleSpot := range urbexSpots {
		if singleSpot.ID == spotID {
			urbexSpots = append(urbexSpots[:i], urbexSpots[i+1:]...)
			fmt.Fprintf(w, "The event with ID %v has been deleted successfully", spotID)
		}
	}
}

package handler

import (
	"github.com/gorilla/mux"
	"log"
	"net/http"
	//"github.com/lgcyril/projet-collectif---mobile-front-daswifties/GO/api/crud"
)

func API(w http.ResponseWriter, r *http.Request) {

	router := mux.NewRouter().StrictSlash(true)
	//router.HandleFunc("/api", HomeLink)
	//router.HandleFunc("/api", CreateSpot).Methods(http.MethodPost)
	//router.HandleFunc("/api", GetAllUrbexSpots).Methods(http.MethodGet)
	//router.HandleFunc("/api/{id}", GetOneSpot).Methods(http.MethodGet)
	//router.HandleFunc("/api/urbexName/{imagename}", GetSpotName).Methods(http.MethodGet)
	//router.HandleFunc("/api/urbexCity/{city}", GetSpotCity).Methods(http.MethodGet)
	//router.HandleFunc("/api/{id}", UpdateSpot).Methods(http.MethodPatch)
	//router.HandleFunc("/api/{id}", DeleteSpot).Methods(http.MethodDelete)
	log.Fatal(http.ListenAndServe(":8080", router))
	router.ServeHTTP(w, r)
}

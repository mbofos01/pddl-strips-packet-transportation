(define (problem very_small_problem ) (:domain pkg_transport)
(:objects 
;; Cities
Thessaloniki
Patras
Roma
;; Countries
Italy
Greece 
;; Stations
Station_Patras
Station_Thessaloniki
Station_Roma
;; Harbours
Harbour_Roma
Harbour_Patras
;; Storage
Storage_Roma
Storage_Thessaloniki
;; Truck
Truck_Roma_1
Truck_Roma_2
Truck_Roma_3
Truck_Roma_4
Truck_Roma_5
;; Trains
Engine_Thessaloniki
;; Wagons
wagon1
wagon2 
wagon3
;; Ships
Mediterenian
;; Packages
pkg1 pkg2 pkg3 pkg4 pkg5
)

(:init
    ;; Geography 
    (country Italy)
    (country Greece)

    (city Thessaloniki)
    (city Patras)
    (city Roma)

    (located Thessaloniki Greece)
    (located Patras Greece)
    (located Roma Italy)

    ;; Locations
    (station Station_Patras)
    (facility Station_Patras)
    (located Station_Patras Patras)
    (stationAtPort Station_Patras Harbour_Patras)



    (station Station_Thessaloniki)
    (facility Station_Thessaloniki)
    (located Storage_Thessaloniki Thessaloniki)



    (station Station_Roma)
    (facility Station_Roma)
    (located Station_Roma Roma)
    (stationAtPort Station_Roma Harbour_Roma)


    ;; Harbour
    (harbour Harbour_Roma)
    (facility Harbour_Roma)
    (located Harbour_Roma Roma)

    (harbour Harbour_Patras)
    (facility Harbour_Patras)
    (located Harbour_Patras Patras)


    ;; Storage
    (facility Storage_Roma)
    (storage Storage_Roma)
    (located Storage_Roma Roma)

    (storage Storage_Thessaloniki)
    (facility Station_Thessaloniki)
    (located Station_Thessaloniki Thessaloniki)



    ;; Vehicles
    ;; Truck
    (truck Truck_Roma_1)
    (located Truck_Roma_1 Storage_Roma)
    (truck Truck_Roma_2)
    (located Truck_Roma_2 Storage_Roma)
    (truck Truck_Roma_3)
    (located Truck_Roma_3 Storage_Roma)
    (truck Truck_Roma_4)
    (located Truck_Roma_4 Storage_Roma)
    (truck Truck_Roma_5)
    (located Truck_Roma_5 Storage_Roma)


    ;; Engines
    (train_engine Engine_Thessaloniki)
    (located Engine_Thessaloniki Station_Thessaloniki)

    (wagon Wagon1)
    (wagon Wagon2)
    (wagon Wagon3)
    (located Wagon1 Station_Thessaloniki)
    (located Wagon2 Station_Thessaloniki)
    (located Wagon3 Station_Thessaloniki)

    ;; Ship
    (ship Mediterenian)
    (located Mediterenian Harbour_Roma)
    (located Mediterenian Roma)

    ;; packages
    (package pkg1)
    (package pkg2)
    (package pkg3)
    (package pkg4)
    (package pkg5)

    (located pkg1 Storage_Roma)
    (located pkg2 Storage_Roma)

)

(:goal (and
    ;;;todo: put the goal condition here
    (located pkg1 Station_Thessaloniki)
    (located pkg2 Station_Thessaloniki)
));;

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

(define (problem small_problem) (:domain pkg_transport)
(:objects 
    ;; countries
    USA UK
    ;; cities
    Boston Chicago London
    ;; harbours
    Boston_Harbour London_Port
    ;; train_stations
    Boston_Station_Harbour London_Station_Harbour Chicago_Station
    ;; storages
    Chicago_Storage London_Storage
    ;; trucks
    Chicago_Truck_1 Chigaco_Truck_2 
    Boston_Truck_1 Boston_Truck_2 
    London_Truck_1 London_Truck_2
    ;; trains
    Boston_Engine Chicago_Engine
    ;; wagons
    Wagon1 Wagon2 Wagon3 Wagon4 Wagon5 Wagon6
    ;; ships
    Evergiven BlueSea
    ;; packages
    package1
    package2
    package3
    package4
    package5
    package6
    package7
    package8
    package9
    package10
)

(:init
    ;todo: put the initial state's facts and numeric values here
    ;; Geography 
    (country USA)
    (country UK)

    (city Boston)
    (city Chicago)
    (city London)

    (located Boston USA)
    (located Chicago USA)
    (located London UK)

    ;; Places
    ;; Boston
    (facility Boston_Harbour)
    (facility Boston_Station_Harbour)

    (located Boston_Harbour Boston)
    (harbour Boston_Harbour)
    (located Boston_Station_Harbour Boston)
    (station Boston_Station_Harbour)
    (stationAtPort Boston_Station_Harbour Boston_Harbour)
    ;; London
    (facility London_Station_Harbour)
    (station London_Station_Harbour)
    (facility London_Harbour)
    (harbour London_Station_Harbour)
    (facility London_Storage)
    (storage London_Storage)

    (located London_Station_Harbour London)
    (located London_Storage London)
    (located London_Harbour London)
    (stationAtPort London_Station_Harbour London_Harbour)
    ;; Chicago
    (facility Chicago_Station)
    (station Chicago_Station)
    (facility Chicago_Storage)
    (storage Chicago_Storage)

    (located Chicago_Station Chicago)
    (located Chicago_Storage Chicago)

    ;; Vehicles
    ;; Trucks
    (truck Boston_Truck_1)
    (truck Boston_Truck_2)
    (located Boston_Truck_1 Boston_Station_Harbour)
    (located Boston_Truck_2 Boston_Station_Harbour)

    (truck Chicago_Truck_1)
    (truck Chicago_Truck_2)
    (located Chicago_Truck_1 Chicago_Storage)
    (located Chicago_Truck_2 Chicago_Station)

    (truck London_Truck_1)
    (truck London_Truck_2)
    (located London_Truck_1 London_Storage)
    (located London_Truck_2 London_Station_Harbour)

    ;; Engines
    (train_engine Boston_Engine)
    (located Boston_Engine Boston_Station_Harbour)
    (train_engine Chicago_Engine)
    (located Chicago_Engine Chicago_Station)

    ;; Wagons
    (wagon Wagon1)
    (wagon Wagon2)
    (wagon Wagon3)
    (located Wagon1 Boston_Station_Harbour)
    (located Wagon2 Boston_Station_Harbour)
    (located Wagon3 Boston_Station_Harbour)

    (wagon Wagon4)
    (wagon Wagon5)
    (wagon Wagon6)
    (located Wagon4 Chicago_Station)
    (located Wagon5 Chicago_Station)
    (located Wagon6 Chicago_Station)

    ;; Ships
    (ship Evergiven)
    (located Evergiven London_Harbour)
    (located Evergiven London)

    (ship BlueSea)
    (located BlueSea Boston_Harbour)
    (located BlueSea Boston)

    ;; Packages
    (package package1)
    (package package2)
    (package package3)
    (package package4)
    (package package5)
    (package package6)
    (package package7)
    (package package8)
    (package package9)
    (package package10)

    (located package1 London_Storage)
    (located package2 London_Storage)
    (located package3 London_Storage)
    (located package4 London_Storage)
    (located package5 Boston_Station_Harbour)
    (located package6 Boston_Station_Harbour)
    (located package7 Boston_Station_Harbour)
    (located package8 Chicago_Storage)
    (located package9 Chicago_Storage)
    (located package10 Chicago_Storage)
)

(:goal (and
    ;todo: put the goal condition here
    (located package1 Boston_Station_Harbour)
    (located package2 Boston_Station_Harbour)
    (located package3 Boston_Station_Harbour)
    (located package4 Chicago_Storage)
    (located package5 Chicago_Storage)
    (located package6 Chicago_Storage)
    (located package7 Chicago_Storage)
    (located package8 London_Storage)
    (located package9 London_Storage)
    (located package10 London_Storage)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

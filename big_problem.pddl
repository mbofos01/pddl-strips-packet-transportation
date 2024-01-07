(define (problem big_problem) (:domain pkg_transport)
(:objects 
    ;; Countries
    USA Mexico UK Brazil
    ;; Cities
    Boston Chicago LosAngeles MexicoCity SaoPaolo Brasilia London
    ;; Harbours
    Boston_Harbour London_Harbour SaoPaolo_Harbour LosAngeles_Harbour
    ;; Harbour Stations
    Boston_Station_Harbour London_Station_Harbour SaoPaolo_Station_Harbour LosAngeles_Station_Harbour 
    ;; Stations
    MexicoCity_Station Chicago_Station
    ;; Storages
    Brasilia_Storage London_Storage LosAngeles_Storage Chicago_Storage Boston_Storage
    ;; Trucks
    Chicago_Truck_1 Chicago_Truck_2 
    Boston_Truck_1 Boston_Truck_2 
    LosAngeles_Truck_1 LosAngeles_Truck_2
    London_Truck_1 London_Truck_2
    MexicoCity_Truck_1 MexicoCity_Truck_2
    SaoPaolo_Truck_1 SaoPaolo_Truck_2
    Brasilia_Truck_1 Brasilia_Truck_2
    ;; Ships
    Evergiven     BlueSea     Pacific     IntraCont
    ;; Engines
    London_Engine Boston_Engine SaoPaolo_Engine LosAngeles_Engine
    ;; Wagons
    wagon1     wagon2     wagon3
    wagon4     wagon5     wagon6
    wagon7     wagon8     wagon9
    wagon10    wagon11    wagon12
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
    package11
    package12
    package13
    package14
    package15
    package16
    package17
    package18
    package19
    package20
)

(:init
    ;todo: put the initial state's facts and numeric values here
    ;; Geography
    (country USA)
    (country UK)
    (country Mexico)
    (country Brazil)

    (connectedByLand USA Mexico)
    (connectedByLand Mexico Brazil)
    (connectedByLand USA Brazil)

    ;; USA
    (city Boston)
    (city Chicago)
    (city LosAngeles)
    (located Boston USA)
    (located Chicago USA)
    (located LosAngeles USA)

    ;; Mexico
    (city MexicoCity)
    (located MexicoCity Mexico)

    ;; Brazil
    (city SaoPaolo)
    (city Brasilia)
    (located SaoPaolo Brazil)
    (located Brasilia Brazil)

    ;; UK
    (city London)
    (located London UK)

    ;; London Facilities
    (storage London_Storage)
    (facility London_Storage)
    (located London_Storage London)

    (harbour London_Harbour)
    (facility London_Harbour)
    (located London_Harbour London)

    (station London_Station_Harbour)
    (facility London_Station_Harbour)
    (located London_Station_Harbour London)
    (stationAtPort London_Station_Harbour London_Harbour)

    (truck London_Truck_1)
    (truck London_Truck_2)
    (located London_Truck_1 London_Storage)
    (located London_Truck_2 London_Storage)

    (ship Evergiven)
    (located Evergiven London_Harbour)
    (located Evergiven London)  

    (train_engine London_Engine)
    (located London_Engine London_Station_Harbour) 

    ;; Boston Facilities
    (storage Boston_Storage)
    (facility Boston_Storage)
    (located Boston_Storage Boston)

    (harbour Boston_Harbour)
    (facility Boston_Harbour)
    (located Boston_Harbour Boston)

    (station Boston_Station_Harbour)
    (facility Boston_Station_Harbour)
    (located Boston_Station_Harbour Boston)
    (stationAtPort Boston_Station_Harbour Boston_Harbour)

    (truck Boston_Truck_1)
    (truck Boston_Truck_2)
    (located Boston_Truck_1 Boston_Storage)
    (located Boston_Truck_2 Boston_Storage)
    
    (ship BlueSea)
    (located BlueSea Boston_Harbour)
    (located BlueSea Boston)  

    (train_engine Boston_Engine)
    (located Boston_Engine Boston_Station_Harbour) 

    ;; Chicago Facilities
    (storage Chicago_Storage)
    (facility Chicago_Storage)
    (located Chicago_Storage Chicago)

    (station Chicago_Station)
    (facility Chicago_Station)
    (located Chicago_Station Chicago)

    (truck Chicago_Truck_1)
    (truck Chicago_Truck_2)
    (located Chicago_Truck_1 Chicago_Storage)
    (located Chicago_Truck_2 Chicago_Storage)

    ;; Los Angeles Facilities
    (harbour LosAngeles_Harbour)
    (facility LosAngeles_Harbour)
    (located LosAngeles_Harbour LosAngeles)

    (station LosAngeles_Station_Harbour)
    (facility LosAngeles_Station_Harbour)
    (located LosAngeles_Station_Harbour LosAngeles)
    (stationAtPort LosAngeles_Station_Harbour LosAngeles_Harbour)

    (storage LosAngeles_Storage)
    (facility LosAngeles_Storage)
    (located LosAngeles_Storage LosAngeles)

    (truck LosAngeles_Truck_1)
    (truck LosAngeles_Truck_2)
    (located LosAngeles_Truck_1 LosAngeles_Storage)
    (located LosAngeles_Truck_2 LosAngeles_Storage)

    (train_engine LosAngeles_Engine)
    (located LosAngeles_Engine LosAngeles_Station_Harbour)

    (ship Pacific)
    (located Pacific LosAngeles_Harbour)
    (located Pacific LosAngeles) 

    ;; Mexico Facilities
    (station MexicoCity_Station)
    (facility MexicoCity_Station)
    (located MexicoCity_Station MexicoCity)

    (truck MexicoCity_Truck_1)
    (truck MexicoCity_Truck_2)
    (located MexicoCity_Truck_1 MexicoCity_Station)
    (located MexicoCity_Truck_2 MexicoCity_Station)

    ;; Sao Paolo Facilities
    (harbour SaoPaolo_Harbour)
    (facility SaoPaolo_Harbour)
    (located SaoPaolo_Harbour SaoPaolo)

    (station SaoPaolo_Station_Harbour)
    (facility SaoPaolo_Station_Harbour)
    (located SaoPaolo_Station_Harbour SaoPaolo)
    (stationAtPort SaoPaolo_Station_Harbour SaoPaolo_Harbour)

    (truck SaoPaolo_Truck_1)
    (truck SaoPaolo_Truck_2)
    (located SaoPaolo_Truck_1 SaoPaolo_Station_Harbour)
    (located SaoPaolo_Truck_2 SaoPaolo_Station_Harbour)

    (train_engine SaoPaolo_Engine)
    (located SaoPaolo_Engine SaoPaolo_Station_Harbour)

    (ship IntraCont)
    (located IntraCont SaoPaolo_Harbour)
    (located IntraCont SaoPaolo) 

    ;; Brasilia Facilities
    (storage Brasilia_Storage)
    (facility Brasilia_Storage)
    (located Brasilia_Storage Brasilia)

    (truck Brasilia_Truck_1)
    (truck Brasilia_Truck_2)
    (located Brasilia_Truck_1 Brasilia_Storage)
    (located Brasilia_Truck_2 Brasilia_Storage)


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

    (wagon Wagon7)
    (wagon Wagon8)
    (wagon Wagon9)
    (located Wagon7 MexicoCity_Station)
    (located Wagon8 MexicoCity_Station)
    (located Wagon9 MexicoCity_Station)

    (wagon Wagon10)
    (wagon Wagon11)
    (wagon Wagon12)
    (located Wagon10 SaoPaolo_Station_Harbour)
    (located Wagon11 SaoPaolo_Station_Harbour)
    (located Wagon12 SaoPaolo_Station_Harbour)


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
    (package package11)
    (package package12)
    (package package13)
    (package package14)
    (package package15)
    (package package16)
    (package package17)
    (package package18)
    (package package19)
    (package package20)


    (located package1 London_Storage)
    (located package2 London_Storage)
    (located package3 London_Storage)
    (located package4 London_Storage)
    (located package5 London_Storage)
    (located package6 Chicago_Station)
    (located package7 Chicago_Station)
    (located package8 Chicago_Station)
    (located package9 Chicago_Station)
    (located package10 LosAngeles_Storage)
    (located package11 LosAngeles_Storage)
    (located package12 LosAngeles_Storage)
    (located package13 LosAngeles_Storage)
    (located package14 LosAngeles_Storage)
    (located package15 SaoPaolo_Station_Harbour)
    (located package16 SaoPaolo_Station_Harbour)
    (located package17 SaoPaolo_Station_Harbour)
    (located package18 SaoPaolo_Station_Harbour)
    (located package19 SaoPaolo_Station_Harbour)
    (located package20 SaoPaolo_Station_Harbour)


    
)

(:goal (and
    ;todo: put the goal condition here

    (located package1 Brasilia_Storage)
    (located package2 Brasilia_Storage)
    (located package3 Brasilia_Storage)
    (located package4 Brasilia_Storage)
    (located package5 Brasilia_Storage)
    (located package6 Brasilia_Storage)
    (located package7 Brasilia_Storage)
    (located package8 Brasilia_Storage)
    (located package9 Brasilia_Storage)
    (located package10 London_Storage)
    (located package11 London_Storage)
    (located package12 London_Storage)
    (located package13 London_Storage)
    (located package14 London_Storage)
    (located package15 Boston_Storage)
    (located package16 Boston_Storage)
    (located package17 Boston_Storage)
    (located package18 Boston_Storage)
    (located package19 Boston_Storage)
    (located package20 Boston_Storage)
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)

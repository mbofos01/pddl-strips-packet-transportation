;Header and description

(define (domain pkg_transport)

    ;remove requirements that are not needed
    (:requirements :strips :negative-preconditions :equality)

    (:predicates ;todo: define predicates here

        ;;dynamic predicates
        (located ?x ?y) ;;something is located somewhere
        (inside ?x ?y) ;; something is in a trasport mean
        (stationAtPort ?x ?y) ;; a station is a port
        (paired_with ?x ?y) ;; a wagon is attached to an engine
        (connectedByLand ?C1 ?C2) ;; two cities are connected by land (used for trains)

        ;;static predicates
        (fullVehicle ?VE)  ;; a vehicle is full
        (truck ?TRUCK) 
        (country ?COUNTRY) 
        (city ?CITY)
        (package ?PKG)
        (facility ?FACILITY)
        (station ?STATION)
        (storage ?STORAGE)
        (harbour ?HARBOUR)
        (ship ?SHIP)
        (wagon ?WAGON)
        (connected ?WAGON)
        (train_engine ?ENGINE)
    )
    (:action move_package_from_harbour_to_station ;;package must be inside the harbour and go to the station
        :parameters (?PKG ?STATION ?HARBOUR ?CITY ?COUNTRY)
        :precondition (and
            (package ?PKG)
            (station ?STATION)
            (harbour ?HARBOUR)
            (city ?CITY)
            (country ?COUNTRY)

            (stationAtPort ?STATION ?HARBOUR) ;; the station must be part of the harbour
            (located ?PKG ?HARBOUR) ;; package is located at the harbour
            (located ?HARBOUR ?CITY) ;; harbour is located at the city
            (located ?STATION ?CITY) ;; station is located at the city
            (located ?CITY ?COUNTRY) ;; city is located at the country
        )
        :effect (and
            (not (located ?PKG ?HARBOUR)) ;; now the package isn't at the harbour
            (located ?PKG ?STATION) ;; it is at the station
        )
    )
    (:action move_package_from_station_to_harbour
        :parameters (?PKG ?STATION ?HARBOUR ?CITY ?COUNTRY)
        :precondition (and
            (package ?PKG)
            (station ?STATION)
            (harbour ?HARBOUR)
            (city ?CITY)
            (country ?COUNTRY)

            (stationAtPort ?STATION ?HARBOUR) ;; the station must be part of the harbour
            (located ?PKG ?STATION) ;; package is located at the harbour
            (located ?HARBOUR ?CITY) ;; harbour is located at the city
            (located ?STATION ?CITY) ;; station is located at the city
            (located ?CITY ?COUNTRY) ;; city is located at the country

        )
        :effect (and
            (not (located ?PKG ?STATION)) ;; now the package isn't at the station 
            (located ?PKG ?HARBOUR) ;; it is at the harbour
        )
    )

    (:action load_package_to_truck
        :parameters (?TRUCK ?PKG ?CITY ?FACILITY ?COUNTRY)
        :precondition (and
            (package ?PKG)
            (truck ?TRUCK)
            (facility ?FACILITY)
            (city ?CITY)
            (country ?COUNTRY)

            (located ?FACILITY ?CITY);; our facility is located at the city
            (located ?CITY ?COUNTRY) ;; the city belongs to the country
            (located ?PKG ?FACILITY) ;; the package is located at the facility
            (located ?TRUCK ?FACILITY) ;; the truck is located at the facility
            (not(fullVehicle ?TRUCK)) ;; the truck is empty

        )
        :effect (and
            (fullVehicle ?TRUCK) ;;the truck is now full
            (not (located ?PKG ?FACILITY)) ;; the package is not at the facility
            (inside ?PKG ?TRUCK) ;; and it is inside the truck
        )
    )

    (:action unload_package_from_truck
        :parameters (?TRUCK ?PKG ?CITY ?FACILITY ?COUNTRY)

        :precondition (and
            (package ?PKG)
            (truck ?TRUCK)
            (facility ?FACILITY)
            (city ?CITY)
            (country ?COUNTRY)

            (located ?FACILITY ?CITY);; our facility is located at the city
            (located ?CITY ?COUNTRY) ;; the city belongs to the country
            (inside ?PKG ?TRUCK)     ;; the package is inside the truck
            (located ?TRUCK ?FACILITY) ;; the truck is located at the facility
            (fullVehicle ?TRUCK) ;; the truck is full
        )
        :effect (and
            (not (fullVehicle ?TRUCK)) ;; the truck is empty
            (located ?PKG ?FACILITY)   ;; the package is located at the facility
            (not (inside ?PKG ?TRUCK)) ;; and it's not inside the truck
        )
    )

    (:action drive_truck_anywhere
        :parameters (?TRUCK ?FACILITY_FROM ?CITY_FROM ?FACILITY_TO ?CITY_TO ?COUNTRY)
        :precondition (and
            (truck ?TRUCK)
            (facility ?FACILITY_FROM)
            (city ?CITY_FROM)
            (facility ?FACILITY_TO)
            (city ?CITY_TO)
            (country ?COUNTRY)

            (located ?CITY_FROM ?COUNTRY)  ;; the city we start belongs to the country
            (located ?CITY_TO ?COUNTRY)  ;; the city we want to go belongs to the country
            (located ?FACILITY_FROM ?CITY_FROM) ;; our starting facility is located at the city we start
            (located ?FACILITY_TO ?CITY_TO) ;; our goal facility is located at the city we want to go
            (located ?TRUCK ?FACILITY_FROM) ;; the truck is located at the starting facility

        )
        :effect (and 
            (located ?TRUCK ?FACILITY_TO) ;; the truck is located at the facility we want to go
            (not (located ?TRUCK ?FACILITY_FROM)) ;; the truck is not located at the facility we started
        )
    )

    (:action load_ship_with_package
        :parameters (?SHIP ?PKG ?CITY ?FACILITY ?COUNTRY)
        :precondition (and
            (harbour ?FACILITY)
            (country ?COUNTRY)
            (package ?PKG)
            (ship ?SHIP)
            (city ?CITY)

            (located ?SHIP ?FACILITY) 
            (located ?FACILITY ?CITY) 
            (located ?CITY ?COUNTRY) 
            (located ?PKG ?FACILITY) 

        )
        :effect (and
            (inside ?PKG ?SHIP) 
            (not (located ?PKG ?FACILITY)) 

        )
    )

    (:action unload_ship_from_package
        :parameters (?SHIP ?PKG ?CITY ?FACILITY ?COUNTRY)
        :precondition (and
            (harbour ?FACILITY)
            (country ?COUNTRY)
            (package ?PKG)
            (ship ?SHIP)
            (city ?CITY)

            (located ?SHIP ?FACILITY) 
            (located ?FACILITY ?CITY) 
            (located ?CITY ?COUNTRY) 
            (inside ?PKG ?SHIP) 

        )
        :effect (and
            (located ?PKG ?FACILITY) 
            (not (inside ?PKG ?SHIP)) 
        )
    )

    (:action sail_to_port
        :parameters (?SHIP ?FACILITY_FROM ?CITY_FROM ?FACILITY_TO ?CITY_TO ?COUNTRY_FROM ?COUNTRY_TO)
        :precondition (and
            (harbour ?FACILITY_FROM)
            (harbour ?FACILITY_TO)
            (country ?COUNTRY_TO)
            (country ?COUNTRY_FROM)
            (city ?CITY_FROM)
            (city ?CITY_TO)
            (ship ?SHIP)

            (not (= ?COUNTRY_TO ?COUNTRY_FROM))
            (located ?FACILITY_FROM ?CITY_FROM) 
            (located ?FACILITY_TO ?CITY_TO) 

            (located ?CITY_FROM ?COUNTRY_FROM) 
            (located ?CITY_TO ?COUNTRY_TO) 

            (located ?SHIP ?FACILITY_FROM)
            (located ?SHIP ?CITY_FROM)
        )
        :effect (and
            (located ?SHIP ?FACILITY_TO)
            (located ?SHIP ?CITY_TO)
            (not (located ?SHIP ?FACILITY_FROM))
            (not (located ?SHIP ?CITY_FROM))
        )
    )
    (:action load_a_wagon_with_package
        :parameters (?WAGON ?PKG ?FACILITY ?CITY ?COUNTRY)
        :precondition (and
            (package ?PKG)
            (wagon ?WAGON)
            (facility ?FACILITY)
            (city ?CITY)
            (country ?COUNTRY)

            (located ?FACILITY ?CITY)
            (located ?CITY ?COUNTRY) 
            (located ?PKG ?FACILITY) 
            (located ?WAGON ?FACILITY) 
            (not(fullVehicle ?WAGON)) 

        )
        :effect (and
            (fullVehicle ?WAGON)
            (not (located ?PKG ?FACILITY))
            (inside ?PKG ?WAGON)
        )
    )

    (:action unload_package_from_wagon
        :parameters (?WAGON ?PKG ?FACILITY ?CITY ?COUNTRY)
        :precondition (and
            (package ?PKG)
            (wagon ?WAGON)
            (facility ?FACILITY)
            (city ?CITY)
            (country ?COUNTRY)

            (located ?FACILITY ?CITY)
            (located ?CITY ?COUNTRY)
            (inside ?PKG ?WAGON) 
            (located ?WAGON ?FACILITY)
            (fullVehicle ?WAGON)
        )
        :effect (and
            (not (fullVehicle ?WAGON)) 
            (not (inside ?PKG ?WAGON))
            (located ?PKG ?FACILITY) 
        )
    )

    (:action attach_wagon_to_train
        :parameters (?WAGON ?ENGINE ?FACILITY ?CITY ?COUNTRY)
        :precondition (and
            (wagon ?WAGON)
            (facility ?FACILITY)
            (city ?CITY)
            (country ?COUNTRY)
            (train_engine ?ENGINE)

            (located ?FACILITY ?CITY)
            (located ?CITY ?COUNTRY) 
            (not (connected ?WAGON)) 
            (located ?ENGINE ?FACILITY)
            (located ?WAGON ?FACILITY) 

        )
        :effect (and
            (connected ?WAGON) 
            (paired_with ?WAGON ?ENGINE)
            (not (located ?WAGON ?FACILITY))
        )
    )

    (:action dettach_wagon_from_train
        :parameters (?WAGON ?ENGINE ?FACILITY ?CITY ?COUNTRY)
        :precondition (and
            (wagon ?WAGON)
            (facility ?FACILITY)
            (city ?CITY)
            (country ?COUNTRY)
            (train_engine ?ENGINE)
            (located ?FACILITY ?CITY)
            (located ?CITY ?COUNTRY)
            (connected ?WAGON)
            (located ?ENGINE ?FACILITY)
            (paired_with ?WAGON ?ENGINE)
        )
        :effect (and
            (not (connected ?WAGON))
            (not (paired_with ?WAGON ?ENGINE))
            (located ?WAGON ?FACILITY)
        )
    )
    
    (:action railway_a_train
        :parameters (?ENGINE ?FACILITY_FROM ?CITY_FROM ?COUNTRY_FROM ?FACILITY_TO ?CITY_TO ?COUNTRY_TO)
        :precondition (and
            (train_engine ?ENGINE)
            (facility ?FACILITY_FROM)
            (facility ?FACILITY_TO)
            
            (city ?CITY_FROM)
            (city ?CITY_TO)

            (country ?COUNTRY_FROM)
            (country ?COUNTRY_TO)

            (located ?CITY_FROM ?COUNTRY_FROM)
            (located ?CITY_TO ?COUNTRY_TO)

            (located ?FACILITY_FROM ?CITY_FROM)
            (located ?FACILITY_TO ?CITY_TO)

           (or (connectedByLand ?COUNTRY_FROM ?COUNTRY_TO) (connectedByLand ?COUNTRY_TO ?COUNTRY_FROM) (= ?COUNTRY_FROM ?COUNTRY_TO)) 

            (station ?FACILITY_FROM) 
            (station ?FACILITY_TO)
            
            (located ?ENGINE ?FACILITY_FROM) 

        )
        :effect (and
            (located ?ENGINE ?FACILITY_TO)
            (not (located ?ENGINE ?FACILITY_FROM))
        )
    )



)
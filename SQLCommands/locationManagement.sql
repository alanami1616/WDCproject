/*SQL commands for needed location table interactions*/

/*New location creation*/
INSERT INTO location (country, city, street_name, street_number)
    VALUES ($country_in, $city_in, $sName_In, $sNum_In );

/*Existing location editing*/
UPDATE location
    SET &locationCol = $newVal
    WHERE location_id === $foundLocId ;
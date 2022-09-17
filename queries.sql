/*Queries that provide answers to the questions FROM all projects.*/

SELECT * FROM animals WHERE name LIKE '%mon';
SELECT name FROM animals WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-01-01';
SELECT name FROM animals WHERE neutered = true AND escape_attempts < 3;
SELECT date_of_birth FROM animals WHERE name IN ('Agumon', 'Pikachu');
SELECT name, escape_attempts FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered = true;
SELECT * FROM animals WHERE name != 'Gabumon';
SELECT * FROM animals WHERE weight_kg >= 10.4 AND weight_kg <= 17.3;

BEGIN;
UPDATE animals SET species = 'unspecified';
ROLLBACK;

ALTER TABLE animals
ADD species TEXT;

BEGIN;
UPDATE animals SET species = 'digimon' WHERE name LIKE '%mon';
UPDATE animals SET species = 'pokemon' WHERE name NOT LIKE '%mon';
COMMIT;

BEGIN;
DELETE FROM animals;
ROLLBACK;

BEGIN;
DELETE FROM animals WHERE date_of_birth > '2022-01-01';
SAVEPOINT SP1;
UPDATE animals SET weight_kg = weight_kg * -1;
ROLLBACK TO SP1;
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;
COMMIT;

SELECT COUNT(*) FROM animals;
SELECT COUNT(*) FROM animals WHERE escape_attempts = 0;
SELECT AVG(weight_kg) FROM animals;
SELECT neutered, AVG(escape_attempts) FROM animals GROUP BY neutered;
SELECT species, MIN(weight_kg), MAX(weight_kg) FROM animals GROUP BY species;
SELECT species, AVG(escape_attempts) FROM animals WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-01-01' GROUP BY species;

SELECT name as Melody_Pond_animals FROM animals JOIN owners ON animals.owner_id = owners.id WHERE owners.id = 4;

SELECT animals.name as pokemons FROM animals JOIN species ON animals.species_id = species.id WHERE species.id = 1;

SELECT o.full_name, string_agg(a.name, ',') AS animals FROM owners o full JOIN animals a ON o.id = a.owner_id GROUP BY o.full_name;

SELECT s.name as species, count(*) as number_of_animals FROM species s JOIN animals a ON s.id = a.species_id GROUP BY s.name;

SELECT o.full_name, string_agg(a.name, ',') AS digimons FROM owners o full JOIN animals a ON o.id = a.owner_id WHERE o.id = 2 AND a.species_id = 2 GROUP BY o.full_name;

SELECT o.full_name, string_agg(a.name, ',') AS escaped_animals FROM owners o full JOIN animals a ON o.id = a.owner_id WHERE o.id = 5 AND a.escape_attempts = 0 GROUP BY o.full_name;

SELECT o.full_name, count(*) AS number_of_animals FROM owners o FULL JOIN animals a ON o.id = a.owner_id GROUP BY o.full_name ORDER BY number_of_animals DESC limit 1;


SELECT vets.name, animals.name, visits.date_of_visit  FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'William Tatcher' ORDER BY visits.date_of_visit DESC LIMIT 1;  

SELECT vets.name, COUNT(animals.name) FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' GROUP BY vets.name;

SELECT vets.name, S.name as Speciality FROM vets
LEFT JOIN specializations ON vets.id = specializations.vets_id LEFT JOIN species S ON S.id = specializations.species_id; 

SELECT animals.name, visits.date_of_visit  FROM animals JOIN visits ON visits.animal_id = animals.id
JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Stephanie Mendez' AND visits.date_of_visit BETWEEN '2020-4-1' AND '2020-8-30';

SELECT a.name, COUNT(A.name) as number_of_visits FROM animals A JOIN visits vi ON vi.animal_id = A.id JOIN vets ve ON vi.vets_id = Ve.id GROUP BY A.name ORDER BY number_of_visits DESC LIMIT 1;

SELECT animals.name as animal_name, visits.date_of_visit  
FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id = vets.id WHERE vets.name = 'Maisy Smith' ORDER BY visits.date_of_visit LIMIT 1;

SELECT animals.name AS animal_name, species.name as specie, animals.date_of_birth AS birth_date, animals.escape_Attempts, animals.neutered, 
animals.weight_kg, owners.full_name AS Owner_name, vets.name as Vet_name, vets.age AS Vet_age, vets.date_of_graduation, visits.date_of_visit  FROM animals JOIN visits ON visits.animal_id = animals.id JOIN vets ON visits.vets_id = vets.id
JOIN species ON animals.species_id = species.id
JOIN owners ON animals.owner_id = owners.id
ORDER BY visits.date_of_visit DESC
LIMIT 1;

SELECT count(*) FROM visits LEFT JOIN animals ON animals.id = visits.animal_id LEFT JOIN vets ON vets.id = visits.vets_id WHERE animals.species_id NOT IN (select animals.species_id FROM specializations WHERE specializations.vets_id = vets.id);

SELECT species.name, count(*) from visits LEFT JOIN animals ON animals.id = visits.animal_id LEFT JOIN species ON animals.species_id = species.id LEFT JOIN vets ON vets.id = visits.vets_id where vets.name = 'Maisy Smith' GROUP BY species.name ORDER BY species.name ASC LIMIT 1;
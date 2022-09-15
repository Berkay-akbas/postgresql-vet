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

/* Populate database with sample data. */


INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Agumon', '2020-02-03', 0, true, 10.23);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Gabumon', '2018-11-15', 2, true, 8);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Pikachu', '2021-01-07', 1, false, 15.04);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Devimon', '2017-05-12', 5, true, 11.0);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Charmander', '2020-02-08', 0, false, -11);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Plantmon', '2021-11-15', 2, true, -5.7);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Squirtle', '1993-04-02', 3, false, -12.13);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Angemon', '2005-06-12', 1, true, -45);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Boarmon', '2005-06-07', 7, true, 20.4);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Blossom', '1998-10-13', 3, true, 17);

INSERT INTO animals (name, date_of_birth, escape_attempts, neutered, weight_kg) VALUES ('Ditto', '2022-05-14', 4, true, 22);

INSERT INTO owners(full_name, age)
VALUES 
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);

INSERT INTO species(name)
VALUES
  ('Pokemon'),
  ('Digimon');

UPDATE animals
SET species_id = 1;

UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon%';


UPDATE animals
SET owner_id = 1
WHERE name = 'Agumon';

UPDATE animals
SET owner_id = 2
WHERE name IN ('Gabumon', 'Pikachu');

UPDATE animals
SET owner_id = 3
WHERE name IN ('Devimon', 'Plantmon');

UPDATE animals
SET owner_id = 4
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

UPDATE animals
SET owner_id = 5
WHERE name IN ('Angemon','Boarmon');

INSERT INTO vets (name, age, date_of_graduation)
VALUES
  ('William Tatcher', 45, '23-apr-2000'),
  ('Maisy Smith', 26, '17-jan-2019'),
  ('Stephanie Mendez', 64, '4-may-1981'),
  ('Jack Harkness', 38, '8-jun-2008');

INSERT INTO specializations (species_id, vets_id)
VALUES
  (1, 1),
  (1, 3),
  (2, 3),
  (2, 4);

INSERT INTO visits (animal_id, vets_id, date_of_visit)
VALUES
  (1, 1, '24-may-2020'),
  (1, 3, '22-jul-2020'),
  (2, 4, '2-feb-2021'),
  (3, 2, '5-jan-2020'),
  (3, 2, '8-mar-2020'),
  (3, 2, '14-may-2020'),
  (4, 3, '4-may-2021'),
  (5, 4, '24-feb-2021'),
  (6, 2, '21-dec-2019'),
  (6, 1, '10-aug-2020'),
  (6, 2, '7-apr-2021'),
  (7, 3, '29-sep-2019'),
  (8, 4, '3-oct-2020'),
  (8, 4, '4-nov-2020'),
  (9, 2, '24-jan-2019'),
  (9, 2, '15-may-2019'),
  (9, 2, '27-feb-2020'),
  (9, 2, '3-aug-2020'),
  (10, 3, '24-may-2020'),
  (10, 1, '11-jan-2021');
/* Database schema to keep the structure of entire database. */

CREATE TABLE animals(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR(250),
date_of_birth DATE,
escape_attempts INT,
neutered BOOLEAN,
weight_kg DECIMAL,
species TEXT,
);

CREATE TABLE species (
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR,
    PRIMARY KEY (id)
);

CREATE TABLE owners (
    id INT GENERATED ALWAYS AS IDENTITY,
    full_name VARCHAR,
    age INT,
    PRIMARY KEY (id)
);


ALTER TABLE animals ADD PRIMARY KEY (id);
ALTER TABLE animals DROP column species;

ALTER TABLE animals ADD column species_id INT

ALTER TABLE animals ADD column owner_id INT

ALTER TABLE animals 
   ADD CONSTRAINT fk_species
    FOREIGN KEY (species_id) 
     REFERENCES species(id);

ALTER TABLE animals 
   ADD CONSTRAINT fk_owners
    FOREIGN KEY (owner_id) 
      REFERENCES owners(id)
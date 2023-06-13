DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE category(
    id SERIAL PRIMARY KEY,
    category TEXT NOT NULL
);
CREATE TABLE region(
    id SERIAL PRIMARY KEY,
    region TEXT NOT NULL
);
CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE ,
    pref_region_id INT REFERENCES region
);
CREATE TABLE post(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    user_id INT REFERENCES users,
    category_id INT REFERENCES category,
    region_id INT REFERENCES region
);

CREATE INDEX username_idx ON users(username);
DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE teams(
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL,
    location TEXT NOT NULL,
    wins INT DEFAULT 0,
    losses INT DEFAULT 0
);
CREATE TABLE players(
    id SERIAL PRIMARY KEY,
    player_name TEXT NOT NULL,
    team_id INT REFERENCES teams
);
CREATE TABLE matches(
    id SERIAL PRIMARY KEY,
    home_team INT REFERENCES teams,
    home_score INT DEFAULT 0,
    away_team INT REFERENCES teams,
    away_score INT DEFAULT 0,
    tied BOOLEAN DEFAULT TRUE CHECK (home_score=away_score),
    winner_id INT REFERENCES teams,
    loser_id INT REFERENCES teams
);
CREATE TABLE goals(
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches,
    player_id INT REFERENCES players
);
CREATE TABLE referees(
    id SERIAL PRIMARY KEY,
    ref_name TEXT NOT NULL
);
CREATE TABLE matches_referees(
    id SERIAL PRIMARY KEY,
    match_id INT REFERENCES matches,
    ref_id INT REFERENCES referees
);
CREATE TABLE league_dates(
    id SERIAL PRIMARY KEY,
    yr INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    champion_id INT REFERENCES teams
);
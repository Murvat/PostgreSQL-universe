--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    distance_from_earth integer NOT NULL,
    number_of_stars integer,
    is_observable boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    size integer NOT NULL,
    is_habitable boolean DEFAULT false,
    has_atmosphere boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer NOT NULL,
    distance_from_star integer NOT NULL,
    is_habitable boolean DEFAULT false,
    number_of_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    is_intelligent boolean DEFAULT false
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer NOT NULL,
    mass numeric(10,2) NOT NULL,
    luminosity integer,
    is_alive boolean DEFAULT true
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 2537000, 1000000000, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 0, 200000000, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 23100000, 500000000, false);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 3000000, 500000000, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 28000000, 500000000, true);
INSERT INTO public.galaxy VALUES (6, 'Messier 87', 54000000, 300000000, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3474, true, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12, false, false);
INSERT INTO public.moon VALUES (4, 'Europa', 3, 3121, true, true);
INSERT INTO public.moon VALUES (5, 'Io', 3, 3643, false, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 5262, true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 4821, false, false);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 5150, true, true);
INSERT INTO public.moon VALUES (9, 'Rhea', 6, 1528, false, false);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 504, true, true);
INSERT INTO public.moon VALUES (11, 'Iapetus', 6, 1469, false, false);
INSERT INTO public.moon VALUES (12, 'Triton', 7, 2706, true, true);
INSERT INTO public.moon VALUES (13, 'Miranda', 7, 471, false, false);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 1152, true, true);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 1177, false, false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 1578, true, true);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 1522, false, false);
INSERT INTO public.moon VALUES (18, 'Charon', 9, 1212, true, true);
INSERT INTO public.moon VALUES (19, 'Ceres', 10, 940, false, false);
INSERT INTO public.moon VALUES (22, 'Luna', 1, 3474, true, true);
INSERT INTO public.moon VALUES (23, 'Adrastea', 3, 20, false, false);
INSERT INTO public.moon VALUES (24, 'Metis', 3, 40, false, false);
INSERT INTO public.moon VALUES (25, 'Ganymede II', 3, 8000, true, true);
INSERT INTO public.moon VALUES (26, 'Callisto I', 3, 4850, false, false);
INSERT INTO public.moon VALUES (27, 'Europa II', 3, 3150, true, true);
INSERT INTO public.moon VALUES (28, 'Titan IV', 6, 5200, true, true);
INSERT INTO public.moon VALUES (29, 'Dione II', 6, 1150, false, false);
INSERT INTO public.moon VALUES (30, 'Hyperion II', 6, 145, true, false);
INSERT INTO public.moon VALUES (31, 'Tethys I', 6, 1070, false, false);
INSERT INTO public.moon VALUES (32, 'Pandora II', 3, 125, false, true);
INSERT INTO public.moon VALUES (33, 'Mab II', 7, 150, true, true);
INSERT INTO public.moon VALUES (34, 'Triton II', 7, 2720, true, true);
INSERT INTO public.moon VALUES (35, 'Miranda II', 7, 470, false, false);
INSERT INTO public.moon VALUES (36, 'Ariel II', 7, 1160, true, true);
INSERT INTO public.moon VALUES (37, 'Umbriel II', 7, 1180, false, false);
INSERT INTO public.moon VALUES (38, 'Titania II', 7, 1590, true, true);
INSERT INTO public.moon VALUES (39, 'Oberon II', 7, 1530, false, false);
INSERT INTO public.moon VALUES (40, 'Charon II', 9, 1220, true, true);
INSERT INTO public.moon VALUES (41, 'Ceres II', 10, 950, false, false);
INSERT INTO public.moon VALUES (42, 'Phoebe II', 6, 220, false, false);
INSERT INTO public.moon VALUES (43, 'Mimas II', 6, 400, false, false);
INSERT INTO public.moon VALUES (44, 'Rhea II', 6, 1530, false, false);
INSERT INTO public.moon VALUES (45, 'Galatea II', 7, 225, false, false);
INSERT INTO public.moon VALUES (46, 'Thalassa II', 7, 145, true, false);
INSERT INTO public.moon VALUES (47, 'Desdemona II', 7, 105, true, true);
INSERT INTO public.moon VALUES (48, 'Naiad II', 7, 95, true, true);
INSERT INTO public.moon VALUES (49, 'Ganymede III', 3, 5300, true, true);
INSERT INTO public.moon VALUES (50, 'Io II', 3, 3650, false, false);
INSERT INTO public.moon VALUES (51, 'Selene II', 1, 5100, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 3, 15, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 3, 23, false, 2);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4, 78, false, 79);
INSERT INTO public.planet VALUES (4, 'Venus', 2, 10, false, 0);
INSERT INTO public.planet VALUES (5, 'Saturn', 4, 14, false, 82);
INSERT INTO public.planet VALUES (6, 'Neptune', 6, 44, false, 14);
INSERT INTO public.planet VALUES (7, 'Uranus', 5, 28, false, 27);
INSERT INTO public.planet VALUES (8, 'Mercury', 2, 6, false, 0);
INSERT INTO public.planet VALUES (9, 'Pluto', 5, 59, false, 5);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 1, 6, true, 1);
INSERT INTO public.planet VALUES (11, 'Gliese 581g', 2, 20, true, 3);
INSERT INTO public.planet VALUES (12, 'Proxima b', 2, 47, true, 0);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'Human', 3, 'A species native to Earth, known for their intelligence and technological advancements.', true);
INSERT INTO public.species VALUES (2, 'Martian', 2, 'A species that has evolved on Mars, adapted to the harsh environment.', false);
INSERT INTO public.species VALUES (3, 'Jovian', 4, 'Large, gas-like species with cloud-covered bodies and multiple tentacles.', false);
INSERT INTO public.species VALUES (4, 'Venusian', 2, 'A species from Venus, capable of surviving extreme temperatures and acid rains.', false);
INSERT INTO public.species VALUES (5, 'Saturnian', 6, 'Species that lives on the moons of Saturn, adapted to cold and extreme environments.', false);
INSERT INTO public.species VALUES (6, 'Neptunian', 7, 'A species evolved on Neptune, capable of withstanding high pressures and icy conditions.', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', 2, 1.10, 100, true);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 1, 20.00, 100000, false);
INSERT INTO public.star VALUES (3, 'Sirius', 2, 2.02, 2500, true);
INSERT INTO public.star VALUES (4, 'Polaris', 3, 5.00, 150, true);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 2, 0.12, 1, true);
INSERT INTO public.star VALUES (6, 'Rigel', 4, 21.00, 90000, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 51, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_unique UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_unique UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_name_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


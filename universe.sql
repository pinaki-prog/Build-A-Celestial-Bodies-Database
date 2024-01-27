--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: celestial_body; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE celestial_body (
    celestial_body_id SERIAL PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    type VARCHAR(20),
    mass_kg NUMERIC,
    radius_km NUMERIC,
    has_atmosphere BOOLEAN,
    discovery_year INT
);


ALTER TABLE public.celestial_body OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_body_celestial_body_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_body_celestial_body_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_body_celestial_body_id_seq OWNED BY public.celestial_body.celestial_body_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type text,
    size_light_years numeric,
    has_black_hole integer,
    num_stars integer NOT NULL
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
    name character varying(100) NOT NULL,
    type character varying(20),
    diameter_km integer NOT NULL,
    has_water boolean,
    planet_id integer
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
    name character varying(100) NOT NULL,
    type character varying(20),
    mass_kg numeric,
    radius_km integer NOT NULL,
    has_life boolean,
    star_id integer
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    spectral_type character varying(10),
    mass_kg numeric,
    radius_km integer NOT NULL,
    luminosity boolean,
    galaxy_id integer
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
-- Name: celestial_body celestial_body_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body ALTER COLUMN celestial_body_id SET DEFAULT nextval('public.celestial_body_celestial_body_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_body; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_body VALUES (1, 'Andromeda Galaxy', 'Galaxy', NULL, 5, NULL, 1764, NULL);
INSERT INTO public.celestial_body VALUES (2, 'Betelgeuse', 'Star', 7.71, 1180, false, NULL, NULL);
INSERT INTO public.celestial_body VALUES (3, 'Earth', 'Planet', 5.924, 6371, true, 0, 2);
INSERT INTO public.celestial_body VALUES (4, 'Luna', 'Moon', NULL, 3474, NULL, NULL, 3);
INSERT INTO public.celestial_body VALUES (5, 'Messier', 'Galaxy', NULL, 46, NULL, 1781, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky 1 Way', 'Spiral', 1000, 5, 400);
INSERT INTO public.galaxy VALUES (2, 'Andrmeda', 'Spiral', 2200, 41, 1400);
INSERT INTO public.galaxy VALUES (3, 'Triangu', 'Spiral', 5000, 24, 540);
INSERT INTO public.galaxy VALUES (4, 'Messier', 'Elliptical', 15000, 41, 5100);
INSERT INTO public.galaxy VALUES (5, 'NGC', 'Barred Spiral', 700, 456, 810);
INSERT INTO public.galaxy VALUES (6, 'Sombro', 'Spiral', 5000, 45, 610);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'Terrestrial', 3474, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Irregular', 22, false, 2);
INSERT INTO public.moon VALUES (3, 'Europa', 'Ice Moon', 3122, true, 3);
INSERT INTO public.moon VALUES (4, 'Titan', 'Saturnian Moon', 5150, true, 4);
INSERT INTO public.moon VALUES (5, 'Deimos', 'Irregular', 12, false, 2);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Galilean Moon', 5262, true, 3);
INSERT INTO public.moon VALUES (7, 'Enceladus', 'Ice Moon', 504, true, 4);
INSERT INTO public.moon VALUES (8, 'Io', 'Galilean Moon', 3642, false, 3);
INSERT INTO public.moon VALUES (9, 'Triton', 'Neptunian Moon', 2707, true, 5);
INSERT INTO public.moon VALUES (10, 'Callisto', 'Galilean Moon', 4800, true, 4);
INSERT INTO public.moon VALUES (11, 'Charon', 'Plutonian Moon', 1212, true, 6);
INSERT INTO public.moon VALUES (12, 'Oberon', 'Umbriel Moon', 1523, true, 5);
INSERT INTO public.moon VALUES (13, 'Titania', 'Umbriel Moon', 1578, false, 5);
INSERT INTO public.moon VALUES (14, 'Rhea', 'Titanian Moon', 1528, true, 4);
INSERT INTO public.moon VALUES (15, 'Iapetus', 'Titanian Moon', 1468, false, 4);
INSERT INTO public.moon VALUES (16, 'Miranda', 'Uranian Moon', 472, true, 5);
INSERT INTO public.moon VALUES (17, 'Dione', 'Titanian Moon', 1123, false, 4);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'Titanian Moon', 270, false, 4);
INSERT INTO public.moon VALUES (19, 'Phoebe', 'Irregular', 214, false, 4);
INSERT INTO public.moon VALUES (20, 'Amalthea', 'Jovian Moon', 250, false, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 5.924, 6371, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 6.323, 3389, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 'Gas Giant', 1.827, 691, false, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas Giant', 5.6826, 232, false, 2);
INSERT INTO public.planet VALUES (5, 'Venus', 'Terrestrial', 4.8624, 6052, false, 3);
INSERT INTO public.planet VALUES (6, 'Kepler', 'Exoplanet', 3.24, 680, true, 4);
INSERT INTO public.planet VALUES (7, 'Gliese ', 'Exoplanet', 3.25, 500, false, 4);
INSERT INTO public.planet VALUES (8, 'WASP', 'Hot Jupiter', 6.227, 1442, false, 5);
INSERT INTO public.planet VALUES (9, 'TOI', 'Exoplanet', 1.475, 8570, true, 6);
INSERT INTO public.planet VALUES (10, 'Trappist', 'Exoplanet', 4.24, 9450, true, 6);
INSERT INTO public.planet VALUES (11, 'Cancri e', 'Super Earth', 8.625, 23900, false, 6);
INSERT INTO public.planet VALUES (12, 'HD b', 'Exoplanet', 4.724, 6635, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G2V', 1.98, 6340, true, 1);
INSERT INTO public.star VALUES (2, 'Beteluse', 'M1', 7.1, 180, true, 1);
INSERT INTO public.star VALUES (3, 'Sirius', 'A1', 2.30, 2, true, 2);
INSERT INTO public.star VALUES (4, 'Proxima', 'MVe', 2.429, 1900, false, 2);
INSERT INTO public.star VALUES (5, 'Alpha A', 'GV', 2.230, 8340, true, 2);
INSERT INTO public.star VALUES (6, 'Alpha B', 'KV', 1.30, 6900, false, 2);


--
-- Name: celestial_body_celestial_body_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_body_celestial_body_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_body celestial_body_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_name_key UNIQUE (name);


--
-- Name: celestial_body celestial_body_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_body
    ADD CONSTRAINT celestial_body_pkey PRIMARY KEY (celestial_body_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


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
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


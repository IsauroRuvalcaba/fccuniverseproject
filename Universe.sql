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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    name character varying(25) NOT NULL,
    comet_id integer NOT NULL,
    orbital_period_yrs numeric(5,2),
    luminosity_abs_magnitude numeric(4,1)
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars_in_billions integer,
    galaxy_type character varying(15),
    distance_light_yrs_millions numeric(10,3)
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
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_radius_km integer,
    type text,
    tidally_locked boolean
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
    name character varying(30) NOT NULL,
    star_id integer,
    planet_type character varying(25),
    habitable_zone boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_type character varying(25),
    hosting_planets boolean,
    age_in_billions_of_years numeric(10,3)
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES ('Halley', 1, 75.32, 5.5);
INSERT INTO public.comet VALUES ('Encke', 2, 3.30, 15.5);
INSERT INTO public.comet VALUES ('Biela', 3, 6.65, 7.1);
INSERT INTO public.comet VALUES ('Faye', 4, 7.52, 10.9);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 250, 'barred spiral', 0.000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000, 'barred spiral', 2.500);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40, 'spiral', 3.200);
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', NULL, 'giant ellipt', 13.000);
INSERT INTO public.galaxy VALUES (5, 'Bodes', NULL, 'sprial', 12.000);
INSERT INTO public.galaxy VALUES (6, 'Sculptor Galaxy', NULL, 'silver dollar', 12.000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 10, 1738, 'massive', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 11, 'rocky', true);
INSERT INTO public.moon VALUES (3, 'Delmos', 11, 6, 'd-type', true);
INSERT INTO public.moon VALUES (4, 'Ganymede', 12, 2634, NULL, true);
INSERT INTO public.moon VALUES (5, 'Titan', 13, 2574, NULL, true);
INSERT INTO public.moon VALUES (6, 'Callisto', 12, 2410, NULL, true);
INSERT INTO public.moon VALUES (7, 'Io', 12, 1821, NULL, true);
INSERT INTO public.moon VALUES (8, 'Europa', 12, 1560, NULL, true);
INSERT INTO public.moon VALUES (9, 'Triton', 15, 1353, 'irregular', true);
INSERT INTO public.moon VALUES (10, 'Titania', 14, 789, NULL, true);
INSERT INTO public.moon VALUES (11, 'Rhea', 13, 763, NULL, true);
INSERT INTO public.moon VALUES (12, 'Oberon', 14, 761, 'III(3)', true);
INSERT INTO public.moon VALUES (13, 'Iapetus', 13, 735, 'VII(8)', true);
INSERT INTO public.moon VALUES (14, 'Umbriel', 14, 584, 'II(2)', true);
INSERT INTO public.moon VALUES (15, 'Ariel', 14, 578, 'I(1)', true);
INSERT INTO public.moon VALUES (16, 'Dione', 13, 561, NULL, true);
INSERT INTO public.moon VALUES (17, 'Tethys', 13, 533, NULL, true);
INSERT INTO public.moon VALUES (18, 'Enceladus', 13, 252, 'II(2)', true);
INSERT INTO public.moon VALUES (19, 'Miranda', 14, 235, 'V(5)', true);
INSERT INTO public.moon VALUES (20, 'Proteus', 15, 210, 'VII(8)', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 9, 'rocky', true);
INSERT INTO public.planet VALUES (2, 'Proxima Centauri c', 9, 'gas', false);
INSERT INTO public.planet VALUES (3, 'Ross 128 b', 10, 'rocky', true);
INSERT INTO public.planet VALUES (4, 'Gliese 1061 c', 11, 'rocky', true);
INSERT INTO public.planet VALUES (5, 'Gliese 1061 d', 11, 'rocky', true);
INSERT INTO public.planet VALUES (6, 'Teegardens Star b', 12, 'rocky', true);
INSERT INTO public.planet VALUES (7, 'Teegardens Star c', 12, 'rocky', true);
INSERT INTO public.planet VALUES (8, 'Mercury', 13, 'rocky', false);
INSERT INTO public.planet VALUES (9, 'Venues', 13, 'rocky', false);
INSERT INTO public.planet VALUES (10, 'Earth', 13, 'rocky', true);
INSERT INTO public.planet VALUES (11, 'Mars', 13, 'rocky', false);
INSERT INTO public.planet VALUES (12, 'Jupiter', 13, 'gas', false);
INSERT INTO public.planet VALUES (13, 'Saturn', 13, 'gas', false);
INSERT INTO public.planet VALUES (14, 'Uranus', 13, 'gas', false);
INSERT INTO public.planet VALUES (15, 'Neptune', 13, 'gas', false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Trianguli', 3, 'F6IV', NULL, 1.600);
INSERT INTO public.star VALUES (2, 'Gamma Trianguli', 3, 'A1Vnn', NULL, 0.300);
INSERT INTO public.star VALUES (3, 'Delta Trianguli', 3, 'G0V', NULL, NULL);
INSERT INTO public.star VALUES (4, 'Upsilon Andromedae', 2, 'binary', NULL, 3.100);
INSERT INTO public.star VALUES (5, 'Polaris', 1, 'F7lb', NULL, 0.070);
INSERT INTO public.star VALUES (6, 'Sirius', 1, 'binary', false, 0.230);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 1, 'red supergiant', false, 0.014);
INSERT INTO public.star VALUES (8, 'Rigel', 1, 'blue supergiant', true, 0.009);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 1, 'red dwarf', true, 4.850);
INSERT INTO public.star VALUES (10, 'Ross 128', 1, 'red dwarf', true, 9.450);
INSERT INTO public.star VALUES (11, 'Gliese 1061', 1, 'red dwarf', true, 7.000);
INSERT INTO public.star VALUES (12, 'Teegardens Star', 1, 'M-type red dwarf', true, 8.000);
INSERT INTO public.star VALUES (13, 'Sun', 1, 'G-type main-sequence', true, 4.600);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 13, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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


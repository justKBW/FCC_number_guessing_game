--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    played_game integer DEFAULT 0,
    best_game integer DEFAULT 0
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'm', 0, 0);
INSERT INTO public.users VALUES (2, 'bjhgfxjcxgfcfh', 0, 0);
INSERT INTO public.users VALUES (3, 'user_1775829153269', 0, 0);
INSERT INTO public.users VALUES (4, 'user_1775829153268', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1775829170728', 0, 0);
INSERT INTO public.users VALUES (6, 'user_1775829170727', 0, 0);
INSERT INTO public.users VALUES (7, 'user_1775829215357', 0, 0);
INSERT INTO public.users VALUES (8, 'user_1775829215356', 0, 0);
INSERT INTO public.users VALUES (9, 'user_1775829263296', 0, 0);
INSERT INTO public.users VALUES (10, 'user_1775829263295', 0, 0);
INSERT INTO public.users VALUES (11, 'me', 0, 0);
INSERT INTO public.users VALUES (12, 'jhbkgiuz', 0, 7);
INSERT INTO public.users VALUES (13, 'dfsy', 0, 6);
INSERT INTO public.users VALUES (14, 'scdacsag', 1, 3);
INSERT INTO public.users VALUES (16, 'user_1775830052060', 1, 195);
INSERT INTO public.users VALUES (15, 'user_1775830052061', 1, 7);
INSERT INTO public.users VALUES (18, 'user_1775830104854', 1, 421);
INSERT INTO public.users VALUES (17, 'user_1775830104855', 1, 486);
INSERT INTO public.users VALUES (20, 'user_1775830178603', 1, 740);
INSERT INTO public.users VALUES (19, 'user_1775830178604', 1, 850);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 20, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--


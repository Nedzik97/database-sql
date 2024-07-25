--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7
-- Dumped by pg_dump version 15.7

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
-- Name: characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.characters (
    id integer NOT NULL,
    name character varying(255),
    description text,
    role character varying(50),
    actor_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT characters_role_check CHECK (((role)::text = ANY ((ARRAY['leading'::character varying, 'supporting'::character varying, 'background'::character varying])::text[])))
);


ALTER TABLE public.characters OWNER TO postgres;

--
-- Name: characters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.characters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.characters_id_seq OWNER TO postgres;

--
-- Name: characters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.characters_id_seq OWNED BY public.characters.id;


--
-- Name: countries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(150) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.countries OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countries_id_seq OWNER TO postgres;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: directors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.directors (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    avatar integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directors OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.directors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directors_id_seq OWNER TO postgres;

--
-- Name: directors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.directors_id_seq OWNED BY public.directors.id;


--
-- Name: favorite_movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.favorite_movies (
    user_id integer NOT NULL,
    movie_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.favorite_movies OWNER TO postgres;

--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.files (
    id integer NOT NULL,
    file_name character varying(255) NOT NULL,
    "MIME type" character varying(50),
    "Key" character varying(255) NOT NULL,
    "URL" text,
    createdat timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updatedat timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.files_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.files_id_seq OWNED BY public.files.id;


--
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.genres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genres_id_seq OWNER TO postgres;

--
-- Name: genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.genres_id_seq OWNED BY public.genres.id;


--
-- Name: movie_characters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_characters (
    movie_id integer NOT NULL,
    character_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.movie_characters OWNER TO postgres;

--
-- Name: movie_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genres (
    movie_id integer NOT NULL,
    genre_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.movie_genres OWNER TO postgres;

--
-- Name: movies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movies (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description text,
    budget numeric(15,0),
    release_date date,
    duration interval,
    director_id integer,
    country_id integer,
    poster_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.movies OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_id_seq OWNER TO postgres;

--
-- Name: movies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movies_id_seq OWNED BY public.movies.id;


--
-- Name: persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.persons (
    id integer NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    biography text,
    date_of_birth date,
    gender character varying(10),
    country integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.persons OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.persons_id_seq OWNER TO postgres;

--
-- Name: persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.persons_id_seq OWNED BY public.persons.id;


--
-- Name: pictures_of_persons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pictures_of_persons (
    id integer NOT NULL,
    photo_url text NOT NULL,
    is_primary boolean DEFAULT false,
    person_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.pictures_of_persons OWNER TO postgres;

--
-- Name: pictures_of_persons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pictures_of_persons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pictures_of_persons_id_seq OWNER TO postgres;

--
-- Name: pictures_of_persons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pictures_of_persons_id_seq OWNED BY public.pictures_of_persons.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    avatar integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: characters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters ALTER COLUMN id SET DEFAULT nextval('public.characters_id_seq'::regclass);


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: directors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors ALTER COLUMN id SET DEFAULT nextval('public.directors_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files ALTER COLUMN id SET DEFAULT nextval('public.files_id_seq'::regclass);


--
-- Name: genres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres ALTER COLUMN id SET DEFAULT nextval('public.genres_id_seq'::regclass);


--
-- Name: movies id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies ALTER COLUMN id SET DEFAULT nextval('public.movies_id_seq'::regclass);


--
-- Name: persons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons ALTER COLUMN id SET DEFAULT nextval('public.persons_id_seq'::regclass);


--
-- Name: pictures_of_persons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures_of_persons ALTER COLUMN id SET DEFAULT nextval('public.pictures_of_persons_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.characters (id, name, description, role, actor_id, created_at, updated_at) FROM stdin;
1	Hero	A brave hero who saves the world.	leading	1	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
2	Villain	An evil villain who causes trouble.	leading	2	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
3	Sidekick	A helpful sidekick to the hero.	supporting	3	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
4	Mysterious Figure	\N	supporting	4	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
5	Enigmatic Stranger	\N	supporting	5	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
6	Masked Avenger	\N	leading	6	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
7	Silent Guardian	\N	supporting	7	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
8	\N	\N	background	\N	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
9	\N	\N	background	\N	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
10	\N	\N	background	\N	2024-07-25 16:07:18.941791	2024-07-25 16:07:18.941791
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.countries (id, name, created_at, updated_at) FROM stdin;
1	New Zealand	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
2	USA	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
3	Mexico	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
4	UK	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
5	Canada	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
6	Australia	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
7	France	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
8	Germany	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
9	Italy	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
10	Japan	2024-07-25 16:05:50.208112	2024-07-25 16:05:50.208112
\.


--
-- Data for Name: directors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.directors (id, first_name, last_name, avatar, created_at, updated_at) FROM stdin;
1	Peter	Jackson	17	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
2	Ridley	Scott	11	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
3	Guillermo	del Toro	19	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
4	James	Cameron	13	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
5	Steven	Spielberg	20	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
6	Christopher	Nolan	12	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
7	Quentin	Tarantino	14	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
8	Martin	Scorsese	18	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
9	David	Fincher	16	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
10	Francis	Ford Coppola	15	2024-07-25 16:08:33.747591	2024-07-25 16:08:33.747591
\.


--
-- Data for Name: favorite_movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.favorite_movies (user_id, movie_id, created_at, updated_at) FROM stdin;
1	1	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
1	2	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
1	3	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
2	1	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
2	5	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
3	2	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
3	4	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
3	5	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
4	3	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
5	3	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
5	6	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
6	7	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
7	8	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
7	9	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
8	10	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
9	1	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
9	4	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
10	2	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
10	5	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
10	6	2024-07-25 16:10:09.040648	2024-07-25 16:10:09.040648
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.files (id, file_name, "MIME type", "Key", "URL", createdat, updatedat) FROM stdin;
1	user_icon_1.jpg	image/jpeg	Development/user_icon_1.xls	https://example.com/files/Development/user_icon_1.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
2	user_icon_2.jpg	image/jpeg	Finance/user_icon_2.pdf	https://example.com/files/Finance/user_icon_2.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
3	user_icon_3.jpg	image/jpeg	Private/user_icon_3.pdf	https://example.com/files/Private/user_icon_3.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
4	user_icon_4.jpg	image/jpeg	Public/user_icon_4.xls	https://example.com/files/Public/user_icon_4.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
5	user_icon_5.jpg	image/jpeg	Documents/user_icon_5.pdf	https://example.com/files/Documents/user_icon_5.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
6	user_icon_6.jpg	image/jpeg	Development/user_icon_6.xls	https://example.com/files/Development/user_icon_6.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
7	user_icon_7.jpg	image/jpeg	Finance/user_icon_7.pdf	https://example.com/files/Finance/user_icon_7.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
8	user_icon_8.jpg	image/jpeg	Private/user_icon_8.pdf	https://example.com/files/Private/user_icon_8.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
9	user_icon_9.jpg	image/jpeg	Public/user_icon_9.xls	https://example.com/files/Public/user_icon_9.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
10	user_icon_10.jpg	image/jpeg	Documents/user_icon_10.pdf	https://example.com/files/Documents/user_icon_10.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
11	director_photo_1.jpg	image/jpeg	Development/director_photo_1.pdf	https://example.com/files/Development/director_photo_1.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
12	director_photo_2.jpg	image/jpeg	Finance/director_photo_2.pdf	https://example.com/files/Finance/director_photo_2.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
13	director_photo_3.jpg	image/jpeg	Private/director_photo_3.xls	https://example.com/files/Private/director_photo_3.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
14	director_photo_4.jpg	image/jpeg	Public/director_photo_4.pdf	https://example.com/files/Public/director_photo_4.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
15	director_photo_5.jpg	image/jpeg	Documents/director_photo_5.xls	https://example.com/files/Documents/director_photo_5.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
16	director_photo_6.jpg	image/jpeg	Development/director_photo_6.pdf	https://example.com/files/Development/director_photo_6.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
17	director_photo_7.jpg	image/jpeg	Finance/director_photo_7.xls	https://example.com/files/Finance/director_photo_7.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
18	director_photo_8.jpg	image/jpeg	Private/director_photo_8.pdf	https://example.com/files/Private/director_photo_8.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
19	director_photo_9.jpg	image/jpeg	Public/director_photo_9.xls	https://example.com/files/Public/director_photo_9.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
20	director_photo_10.jpg	image/jpeg	Documents/director_photo_10.pdf	https://example.com/files/Documents/director_photo_10.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
21	poster_1.jpg	image/jpeg	Development/poster_1.xls	https://example.com/files/Development/poster_1.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
22	poster_2.jpg	image/jpeg	Finance/poster_2.pdf	https://example.com/files/Finance/poster_2.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
23	poster_3.jpg	image/jpeg	Private/poster_3.pdf	https://example.com/files/Private/poster_3.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
24	poster_4.jpg	image/jpeg	Public/poster_4.xls	https://example.com/files/Public/poster_4.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
25	poster_5.jpg	image/jpeg	Documents/poster_5.pdf	https://example.com/files/Documents/poster_5.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
26	poster_6.jpg	image/jpeg	Development/poster_6.xls	https://example.com/files/Development/poster_6.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
27	poster_7.jpg	image/jpeg	Finance/poster_7.pdf	https://example.com/files/Finance/poster_7.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
28	poster_8.jpg	image/jpeg	Private/poster_8.pdf	https://example.com/files/Private/poster_8.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
29	poster_9.jpg	image/jpeg	Public/poster_9.xls	https://example.com/files/Public/poster_9.xls	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
30	poster_10.jpg	image/jpeg	Documents/poster_10.pdf	https://example.com/files/Documents/poster_10.pdf	2024-07-25 15:54:31.971566	2024-07-25 15:54:31.971566
\.


--
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genres (id, name, created_at, updated_at) FROM stdin;
1	Action	2024-07-25 16:07:57.883215	2024-07-25 16:07:57.883215
2	Comedy	2024-07-25 16:07:57.883215	2024-07-25 16:07:57.883215
3	Drama	2024-07-25 16:07:57.883215	2024-07-25 16:07:57.883215
4	Horror	2024-07-25 16:07:57.883215	2024-07-25 16:07:57.883215
5	Science Fiction	2024-07-25 16:07:57.883215	2024-07-25 16:07:57.883215
6	Thriller	2024-07-25 16:07:57.883215	2024-07-25 16:07:57.883215
\.


--
-- Data for Name: movie_characters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_characters (movie_id, character_id, created_at, updated_at) FROM stdin;
1	1	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
1	2	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
2	3	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
2	4	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
3	1	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
3	2	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
4	1	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
4	3	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
5	2	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
5	5	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
6	1	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
6	4	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
7	2	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
7	3	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
7	6	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
8	3	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
8	4	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
8	7	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
9	8	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
9	9	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
10	5	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
10	6	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
10	7	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
11	8	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
11	9	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
12	1	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
12	4	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
13	2	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
13	8	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
14	6	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
14	10	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
15	7	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
15	8	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
16	5	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
16	9	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
17	1	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
17	10	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
18	3	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
18	4	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
19	6	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
19	7	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
20	8	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
20	9	2024-07-25 16:09:12.039973	2024-07-25 16:09:12.039973
\.


--
-- Data for Name: movie_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movie_genres (movie_id, genre_id, created_at, updated_at) FROM stdin;
1	1	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
2	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
3	5	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
4	6	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
5	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
6	1	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
6	3	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
7	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
7	6	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
8	3	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
8	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
9	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
9	6	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
10	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
10	3	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
11	5	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
11	1	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
11	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
12	1	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
12	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
12	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
13	3	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
13	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
13	1	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
14	6	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
14	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
15	3	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
15	6	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
16	5	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
16	3	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
17	1	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
17	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
18	6	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
19	4	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
20	5	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
20	2	2024-07-25 16:09:39.617419	2024-07-25 16:09:39.617419
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movies (id, title, description, budget, release_date, duration, director_id, country_id, poster_id, created_at, updated_at) FROM stdin;
1	The Lost Kingdom	A tale of a lost kingdom and the heroes who try to restore it.	95000000	2024-11-20	02:30:00	1	7	21	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
2	Middle Earth Adventure	An epic journey through middle earth.	85000000	2025-02-15	02:45:00	1	7	22	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
3	Cyber City	A futuristic city with cyber enhancements and the fight for freedom.	135000000	2024-09-10	02:15:00	2	5	23	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
4	Space Odyssey	A journey through space exploring unknown galaxies.	145000000	2025-01-20	02:40:00	2	5	24	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
5	Whispering Shadows	A mysterious story of shadows whispering secrets in the night.	45000000	2024-03-27	01:55:00	3	8	25	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
6	Dark Fantasy	A dark fantasy tale with supernatural elements.	70000000	2025-07-01	02:10:00	3	8	26	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
7	Haunted Forest	A chilling story set in an enchanted forest.	60000000	2025-11-05	01:50:00	3	8	27	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
8	Journey to the Depths	An underwater adventure exploring the deepest parts of the ocean.	105000000	2025-06-14	02:25:00	4	3	28	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
9	Alien Worlds	Exploring alien worlds in a thrilling sci-fi adventure.	115000000	2025-09-15	02:50:00	4	3	29	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
10	Deep Sea Quest	A quest for lost treasures in the depths of the sea.	95000000	2025-12-20	02:30:00	4	3	30	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
11	Futuristic Warriors	A battle for survival in a dystopian future.	110000000	2026-03-10	02:20:00	4	3	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
12	Echoes of Time	A time-traveling adventure that spans different eras.	120000000	2024-05-22	02:35:00	5	6	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
13	The Last Crusade	An epic quest for a legendary artifact.	130000000	2025-04-12	02:45:00	5	6	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
14	The Silent Warrior	A story of a lone warrior fighting for justice.	80000000	2024-07-15	02:10:00	6	1	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
15	Mystery of the Temple	A historical mystery unraveling ancient secrets.	72000000	2024-08-20	01:55:00	7	2	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
16	Quantum Leap	A sci-fi adventure exploring the limits of human potential.	90000000	2025-02-10	02:30:00	8	4	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
17	Eternal Night	A thrilling adventure set in a world of darkness.	78000000	2025-05-25	02:20:00	9	5	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
18	The Enigma	A suspenseful tale of a mysterious enigma.	85000000	2025-08-30	02:35:00	10	6	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
19	Chronicles of the Lost	A journey into a forgotten world with hidden treasures.	88000000	2025-11-10	02:15:00	6	1	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
20	Legend of the Phoenix	An epic saga of a legendary bird and its journey.	90000000	2026-01-05	02:45:00	7	2	\N	2024-07-25 16:08:50.991258	2024-07-25 16:08:50.991258
\.


--
-- Data for Name: persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.persons (id, first_name, last_name, biography, date_of_birth, gender, country, created_at, updated_at) FROM stdin;
1	Michael	Fassbender	Michael Fassbender is a German-Irish actor known for his roles in movies like 12 Years a Slave and X-Men.	1977-04-02	Male	1	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
2	Natalie	Portman	Natalie Portman is an American actress and filmmaker known for her roles in Black Swan and the Star Wars series.	1981-06-09	Female	2	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
3	Leonardo	DiCaprio	Leonardo DiCaprio is an American actor and film producer known for his roles in Titanic, Inception, and The Revenant.	1974-11-11	Male	2	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
4	Penélope	Cruz	Penélope Cruz is a Spanish actress known for her work in films like Vicky Cristina Barcelona and Volver.	1974-04-28	Female	3	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
5	Javier	Bardem	Javier Bardem is a Spanish actor recognized for his roles in No Country for Old Men and Skyfall.	1969-03-01	Male	3	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
6	Charlize	Theron	Charlize Theron is a South African-American actress known for her roles in Mad Max: Fury Road and Monster.	1975-08-07	Female	4	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
7	Denzel	Washington	Denzel Washington is an American actor and director known for his roles in Training Day and Malcolm X.	1954-12-28	Male	2	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
8	Alicia	Vikander	Alicia Vikander is a Swedish actress known for her roles in Ex Machina and The Danish Girl.	1988-10-03	Female	5	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
9	Rami	Malek	Rami Malek is an American actor known for his role in Bohemian Rhapsody and the TV series Mr. Robot.	1981-05-12	Male	2	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
10	Saoirse	Ronan	Saoirse Ronan is an Irish actress known for her performances in Lady Bird and Brooklyn.	1994-04-12	Female	6	2024-07-25 16:06:11.440106	2024-07-25 16:06:11.440106
\.


--
-- Data for Name: pictures_of_persons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pictures_of_persons (id, photo_url, is_primary, person_id, created_at, updated_at) FROM stdin;
1	https://example.com/photos/michael_fassbender_1.jpg	t	1	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
2	https://example.com/photos/michael_fassbender_2.jpg	f	1	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
3	https://example.com/photos/michael_fassbender_3.jpg	f	1	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
4	https://example.com/photos/natalie_portman_1.jpg	t	2	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
5	https://example.com/photos/natalie_portman_2.jpg	f	2	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
6	https://example.com/photos/natalie_portman_3.jpg	f	2	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
7	https://example.com/photos/leonardo_dicaprio_1.jpg	t	3	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
8	https://example.com/photos/leonardo_dicaprio_2.jpg	f	3	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
9	https://example.com/photos/leonardo_dicaprio_3.jpg	f	3	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
10	https://example.com/photos/penelope_cruz_1.jpg	t	4	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
11	https://example.com/photos/penelope_cruz_2.jpg	f	4	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
12	https://example.com/photos/penelope_cruz_3.jpg	f	4	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
13	https://example.com/photos/javier_bardem_1.jpg	t	5	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
14	https://example.com/photos/javier_bardem_2.jpg	f	5	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
15	https://example.com/photos/javier_bardem_3.jpg	f	5	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
16	https://example.com/photos/charlize_theron_1.jpg	t	6	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
17	https://example.com/photos/charlize_theron_2.jpg	f	6	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
18	https://example.com/photos/charlize_theron_3.jpg	f	6	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
19	https://example.com/photos/denzel_washington_1.jpg	t	7	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
20	https://example.com/photos/denzel_washington_2.jpg	f	7	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
21	https://example.com/photos/denzel_washington_3.jpg	f	7	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
22	https://example.com/photos/alicia_vikander_1.jpg	t	8	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
23	https://example.com/photos/alicia_vikander_2.jpg	f	8	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
24	https://example.com/photos/alicia_vikander_3.jpg	f	8	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
25	https://example.com/photos/rami_malek_1.jpg	t	9	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
26	https://example.com/photos/rami_malek_2.jpg	f	9	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
27	https://example.com/photos/rami_malek_3.jpg	f	9	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
28	https://example.com/photos/saoirse_ronan_1.jpg	t	10	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
29	https://example.com/photos/saoirse_ronan_2.jpg	f	10	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
30	https://example.com/photos/saoirse_ronan_3.jpg	f	10	2024-07-25 16:06:57.219554	2024-07-25 16:06:57.219554
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, first_name, last_name, email, password, avatar, created_at, updated_at) FROM stdin;
1	john_doe	John	Doe	john.doe@example.com	password123	3	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
2	jane_smith	Jane	Smith	jane.smith@example.com	securepass456	2	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
3	alex_jones	Alex	Jones	alex.jones@example.com	mypassword789	1	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
4	emily_davis	Emily	Davis	emily.davis@example.com	password101112	5	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
5	michael_brown	Michael	Brown	michael.brown@example.com	password131415	4	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
6	susan_clark	Susan	Clark	susan.clark@example.com	pass1234	6	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
7	david_martin	David	Martin	david.martin@example.com	password5678	7	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
8	lisa_white	Lisa	White	lisa.white@example.com	mypassword91011	8	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
9	robert_wilson	Robert	Wilson	robert.wilson@example.com	securepass1213	9	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
10	mary_johnson	Mary	Johnson	mary.johnson@example.com	password1415	10	2024-07-25 16:05:26.566258	2024-07-25 16:05:26.566258
\.


--
-- Name: characters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.characters_id_seq', 10, true);


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.countries_id_seq', 10, true);


--
-- Name: directors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.directors_id_seq', 10, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.files_id_seq', 30, true);


--
-- Name: genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.genres_id_seq', 6, true);


--
-- Name: movies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movies_id_seq', 20, true);


--
-- Name: persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.persons_id_seq', 10, true);


--
-- Name: pictures_of_persons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pictures_of_persons_id_seq', 30, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 10, true);


--
-- Name: characters characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_pkey PRIMARY KEY (id);


--
-- Name: countries countries_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_name_key UNIQUE (name);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: directors directors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_pkey PRIMARY KEY (id);


--
-- Name: favorite_movies favorite_movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_movies
    ADD CONSTRAINT favorite_movies_pkey PRIMARY KEY (user_id, movie_id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: genres genres_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_name_key UNIQUE (name);


--
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (id);


--
-- Name: movie_characters movie_characters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_characters
    ADD CONSTRAINT movie_characters_pkey PRIMARY KEY (movie_id, character_id);


--
-- Name: movie_genres movie_genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_pkey PRIMARY KEY (movie_id, genre_id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (id);


--
-- Name: persons persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_pkey PRIMARY KEY (id);


--
-- Name: pictures_of_persons pictures_of_persons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures_of_persons
    ADD CONSTRAINT pictures_of_persons_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: characters characters_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.characters
    ADD CONSTRAINT characters_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.persons(id);


--
-- Name: directors directors_avatar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.directors
    ADD CONSTRAINT directors_avatar_fkey FOREIGN KEY (avatar) REFERENCES public.files(id);


--
-- Name: favorite_movies favorite_movies_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_movies
    ADD CONSTRAINT favorite_movies_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;


--
-- Name: favorite_movies favorite_movies_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.favorite_movies
    ADD CONSTRAINT favorite_movies_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: movie_characters movie_characters_character_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_characters
    ADD CONSTRAINT movie_characters_character_id_fkey FOREIGN KEY (character_id) REFERENCES public.characters(id) ON DELETE CASCADE;


--
-- Name: movie_characters movie_characters_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_characters
    ADD CONSTRAINT movie_characters_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;


--
-- Name: movie_genres movie_genres_genre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_genre_id_fkey FOREIGN KEY (genre_id) REFERENCES public.genres(id) ON DELETE CASCADE;


--
-- Name: movie_genres movie_genres_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(id) ON DELETE CASCADE;


--
-- Name: movies movies_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- Name: movies movies_director_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_director_id_fkey FOREIGN KEY (director_id) REFERENCES public.directors(id);


--
-- Name: movies movies_poster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_poster_id_fkey FOREIGN KEY (poster_id) REFERENCES public.files(id);


--
-- Name: persons persons_country_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.persons
    ADD CONSTRAINT persons_country_fkey FOREIGN KEY (country) REFERENCES public.countries(id);


--
-- Name: pictures_of_persons pictures_of_persons_person_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pictures_of_persons
    ADD CONSTRAINT pictures_of_persons_person_id_fkey FOREIGN KEY (person_id) REFERENCES public.persons(id);


--
-- Name: users users_avatar_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_avatar_fkey FOREIGN KEY (avatar) REFERENCES public.files(id);


--
-- PostgreSQL database dump complete
--


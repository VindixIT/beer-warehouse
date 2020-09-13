--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-09-12 22:25:47

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 199 (class 1259 OID 700657)
-- Name: actions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_id_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 216 (class 1259 OID 700788)
-- Name: actions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actions (
    id integer DEFAULT nextval('public.actions_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    origin_status_id integer,
    destination_status_id integer,
    other_than boolean
);


ALTER TABLE public.actions OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 700828)
-- Name: actions_status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.actions_status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actions_status_id_seq OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 700830)
-- Name: actions_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actions_status (
    id integer DEFAULT nextval('public.actions_status_id_seq'::regclass) NOT NULL,
    action_id integer,
    origin_status_id integer,
    destination_status_id integer
);


ALTER TABLE public.actions_status OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 700774)
-- Name: activities_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activities_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activities_roles_id_seq OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 700804)
-- Name: activities_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activities_roles (
    id integer DEFAULT nextval('public.activities_roles_id_seq'::regclass),
    activity_id integer,
    role_id integer
);


ALTER TABLE public.activities_roles OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 700663)
-- Name: beers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.beers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.beers_id_seq OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 700675)
-- Name: beers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.beers (
    id integer DEFAULT nextval('public.beers_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    qtd integer,
    price double precision
);


ALTER TABLE public.beers OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 700661)
-- Name: features_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.features_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 700694)
-- Name: features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.features (
    id integer DEFAULT nextval('public.features_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);


ALTER TABLE public.features OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 700651)
-- Name: features_roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.features_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.features_roles_id_seq OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 700671)
-- Name: features_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.features_roles (
    id integer DEFAULT nextval('public.features_roles_id_seq'::regclass),
    feature_id integer,
    role_id integer
);


ALTER TABLE public.features_roles OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 700667)
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.items_id_seq OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 700708)
-- Name: items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.items (
    id integer DEFAULT nextval('public.items_id_seq'::regclass) NOT NULL,
    quantity double precision,
    beer_id integer,
    price double precision,
    item_value double precision,
    order_id integer
);


ALTER TABLE public.items OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 700669)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 700712)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer DEFAULT nextval('public.orders_id_seq'::regclass) NOT NULL,
    user_id integer,
    ordered_at timestamp without time zone,
    take_out_at timestamp without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 700659)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_id_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 700690)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    id integer DEFAULT nextval('public.roles_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 700655)
-- Name: status_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.status_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.status_id_seq OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 700683)
-- Name: status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.status (
    id integer DEFAULT nextval('public.status_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    stereotype character varying(255)
);


ALTER TABLE public.status OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 700665)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 700701)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer DEFAULT nextval('public.users_id_seq'::regclass) NOT NULL,
    username character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    mobile character varying(255) NOT NULL,
    name character varying(255),
    role_id integer
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 700653)
-- Name: workflows_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.workflows_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflows_id_seq OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 700679)
-- Name: workflows; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.workflows (
    id integer DEFAULT nextval('public.workflows_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    entity_type character varying(30),
    start_at timestamp without time zone,
    end_at timestamp without time zone
);


ALTER TABLE public.workflows OWNER TO postgres;

--
-- TOC entry 2948 (class 0 OID 700788)
-- Dependencies: 216
-- Data for Name: actions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actions (id, name, origin_status_id, destination_status_id, other_than) VALUES (5, 'Disponibilizar', 7, 8, false);
INSERT INTO public.actions (id, name, origin_status_id, destination_status_id, other_than) VALUES (6, 'Cancelar', 9, 10, true);
INSERT INTO public.actions (id, name, origin_status_id, destination_status_id, other_than) VALUES (7, 'Entregar', 8, 9, false);


--
-- TOC entry 2951 (class 0 OID 700830)
-- Dependencies: 219
-- Data for Name: actions_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actions_status (id, action_id, origin_status_id, destination_status_id) VALUES (1, 5, 7, 8);
INSERT INTO public.actions_status (id, action_id, origin_status_id, destination_status_id) VALUES (2, 6, 9, 10);
INSERT INTO public.actions_status (id, action_id, origin_status_id, destination_status_id) VALUES (3, 7, 8, 9);


--
-- TOC entry 2949 (class 0 OID 700804)
-- Dependencies: 217
-- Data for Name: activities_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2939 (class 0 OID 700675)
-- Dependencies: 207
-- Data for Name: beers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.beers (id, name, qtd, price) VALUES (1, 'Molson', 100, 100);


--
-- TOC entry 2943 (class 0 OID 700694)
-- Dependencies: 211
-- Data for Name: features; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.features (id, name, code) VALUES (1, 'Listar Cervejas', 'listBeers');
INSERT INTO public.features (id, name, code) VALUES (2, 'Criar Cerveja', 'createBeer');
INSERT INTO public.features (id, name, code) VALUES (3, 'Listar Workflows', 'listWorkflows');
INSERT INTO public.features (id, name, code) VALUES (4, 'Criar Workflow', 'createWorkflow');
INSERT INTO public.features (id, name, code) VALUES (5, 'Listar Pedidos', 'listOrders');
INSERT INTO public.features (id, name, code) VALUES (6, 'Criar Pedido', 'createOrder');
INSERT INTO public.features (id, name, code) VALUES (7, 'Listar Usuários', 'listUsers');
INSERT INTO public.features (id, name, code) VALUES (8, 'Criar Usuário', 'createUser');
INSERT INTO public.features (id, name, code) VALUES (9, 'Listar Papéis', 'listRoles');
INSERT INTO public.features (id, name, code) VALUES (11, 'Listar Status', 'listStatus');
INSERT INTO public.features (id, name, code) VALUES (12, 'Criar Status', 'createStatus');
INSERT INTO public.features (id, name, code) VALUES (13, 'Listar Funcionalidades', 'listFeatures');
INSERT INTO public.features (id, name, code) VALUES (14, 'Criar Funcionalidade', 'createFeature');
INSERT INTO public.features (id, name, code) VALUES (15, 'Listar Ações', 'listActions');
INSERT INTO public.features (id, name, code) VALUES (16, 'Criar Ação', 'createAction');
INSERT INTO public.features (id, name, code) VALUES (10, 'Criar Papel', 'createRole');


--
-- TOC entry 2938 (class 0 OID 700671)
-- Dependencies: 206
-- Data for Name: features_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (1, 1, 12);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (10, 2, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (11, 4, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (12, 1, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (14, 16, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (15, 14, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (16, 10, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (18, 12, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (19, 8, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (23, 5, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (30, 5, 12);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (33, 3, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (34, 6, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (35, 7, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (36, 9, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (37, 11, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (38, 13, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (39, 15, 1);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (40, 6, 12);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (41, 2, 14);
INSERT INTO public.features_roles (id, feature_id, role_id) VALUES (42, 5, 14);


--
-- TOC entry 2945 (class 0 OID 700708)
-- Dependencies: 213
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2946 (class 0 OID 700712)
-- Dependencies: 214
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2942 (class 0 OID 700690)
-- Dependencies: 210
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (id, name) VALUES (1, 'Admin');
INSERT INTO public.roles (id, name) VALUES (12, 'Cliente');
INSERT INTO public.roles (id, name) VALUES (14, 'Vendedor');


--
-- TOC entry 2941 (class 0 OID 700683)
-- Dependencies: 209
-- Data for Name: status; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.status (id, name, stereotype) VALUES (7, 'Aberto', 'Start');
INSERT INTO public.status (id, name, stereotype) VALUES (8, 'Pronto para Entrega', '');
INSERT INTO public.status (id, name, stereotype) VALUES (9, 'Entregue', 'End');
INSERT INTO public.status (id, name, stereotype) VALUES (10, 'Cancelado', 'End');


--
-- TOC entry 2944 (class 0 OID 700701)
-- Dependencies: 212
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, username, password, email, mobile, name, role_id) VALUES (1, 'aria', '$2a$14$C1DIYDsmE0QHjje4wR5uwOAC7m8/YAUe8DYw/yuKIAQgRDibeCDMy', 'aria@vindixit.com', '61 984385415', 'Ária Ohashi', 1);
INSERT INTO public.users (id, username, password, email, mobile, name, role_id) VALUES (3, 'masaru', '$2a$10$GyDuBNP/nnToLQZzN88Is.O0iJxGfBpOOeWkbRyKYM1iU58pCpU8e', 'masaru@vindixit.com', '61 984385415', 'Masaru Ohashi Júnior', 12);


--
-- TOC entry 2940 (class 0 OID 700679)
-- Dependencies: 208
-- Data for Name: workflows; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 199
-- Name: actions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actions_id_seq', 7, true);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 218
-- Name: actions_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.actions_status_id_seq', 3, true);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 215
-- Name: activities_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activities_roles_id_seq', 21, true);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 202
-- Name: beers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.beers_id_seq', 1, false);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 201
-- Name: features_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.features_id_seq', 16, true);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 196
-- Name: features_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.features_roles_id_seq', 42, true);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 204
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.items_id_seq', 1, true);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 205
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, true);


--
-- TOC entry 2965 (class 0 OID 0)
-- Dependencies: 200
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_id_seq', 14, true);


--
-- TOC entry 2966 (class 0 OID 0)
-- Dependencies: 198
-- Name: status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.status_id_seq', 10, true);


--
-- TOC entry 2967 (class 0 OID 0)
-- Dependencies: 203
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 2968 (class 0 OID 0)
-- Dependencies: 197
-- Name: workflows_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.workflows_id_seq', 1, false);


--
-- TOC entry 2789 (class 2606 OID 700809)
-- Name: activities_roles action_role_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT action_role_unique_key UNIQUE (activity_id, role_id);


--
-- TOC entry 2791 (class 2606 OID 700835)
-- Name: actions_status action_status_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT action_status_unique_key UNIQUE (action_id, origin_status_id, destination_status_id);


--
-- TOC entry 2787 (class 2606 OID 700793)
-- Name: actions actions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT actions_pkey PRIMARY KEY (id);


--
-- TOC entry 2793 (class 2606 OID 700852)
-- Name: actions_status actions_status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT actions_status_pkey PRIMARY KEY (id);


--
-- TOC entry 2769 (class 2606 OID 700717)
-- Name: beers beers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.beers
    ADD CONSTRAINT beers_pkey PRIMARY KEY (id);


--
-- TOC entry 2767 (class 2606 OID 700763)
-- Name: features_roles feature_role_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT feature_role_unique_key UNIQUE (feature_id, role_id);


--
-- TOC entry 2777 (class 2606 OID 700721)
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


--
-- TOC entry 2783 (class 2606 OID 700723)
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- TOC entry 2785 (class 2606 OID 700725)
-- Name: orders order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT order_pkey PRIMARY KEY (id);


--
-- TOC entry 2775 (class 2606 OID 700719)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 2773 (class 2606 OID 700731)
-- Name: status status_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.status
    ADD CONSTRAINT status_pkey PRIMARY KEY (id);


--
-- TOC entry 2779 (class 2606 OID 700765)
-- Name: users username_unique_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT username_unique_key UNIQUE (username);


--
-- TOC entry 2781 (class 2606 OID 700727)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2771 (class 2606 OID 700729)
-- Name: workflows workflows_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.workflows
    ADD CONSTRAINT workflows_pkey PRIMARY KEY (id);


--
-- TOC entry 2804 (class 2606 OID 700836)
-- Name: actions_status actions_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT actions_fkey FOREIGN KEY (action_id) REFERENCES public.actions(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2803 (class 2606 OID 700810)
-- Name: activities_roles activities_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT activities_fkey FOREIGN KEY (activity_id) REFERENCES public.actions(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2797 (class 2606 OID 700732)
-- Name: items beers_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT beers_fkey FOREIGN KEY (beer_id) REFERENCES public.beers(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2800 (class 2606 OID 700794)
-- Name: actions destination_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT destination_status_fkey FOREIGN KEY (destination_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2806 (class 2606 OID 700846)
-- Name: actions_status destination_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT destination_status_fkey FOREIGN KEY (destination_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2794 (class 2606 OID 700747)
-- Name: features_roles features_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT features_fkey FOREIGN KEY (feature_id) REFERENCES public.features(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2798 (class 2606 OID 700737)
-- Name: items orders_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.items
    ADD CONSTRAINT orders_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2801 (class 2606 OID 700799)
-- Name: actions origin_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions
    ADD CONSTRAINT origin_status_fkey FOREIGN KEY (origin_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2805 (class 2606 OID 700841)
-- Name: actions_status origin_status_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actions_status
    ADD CONSTRAINT origin_status_fkey FOREIGN KEY (origin_status_id) REFERENCES public.status(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2796 (class 2606 OID 700766)
-- Name: users role_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT role_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2795 (class 2606 OID 700752)
-- Name: features_roles roles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features_roles
    ADD CONSTRAINT roles_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2802 (class 2606 OID 700815)
-- Name: activities_roles roles_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activities_roles
    ADD CONSTRAINT roles_fkey FOREIGN KEY (role_id) REFERENCES public.roles(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2799 (class 2606 OID 700742)
-- Name: orders users_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT users_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE RESTRICT ON DELETE RESTRICT NOT VALID;


-- Completed on 2020-09-12 22:25:47

--
-- PostgreSQL database dump complete
--


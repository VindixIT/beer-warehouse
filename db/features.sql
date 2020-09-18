--
-- PostgreSQL database dump
--

-- Dumped from database version 11.1
-- Dumped by pg_dump version 11.1

-- Started on 2020-09-13 20:46:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 209 (class 1259 OID 700694)
-- Name: features; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.features (
    id integer DEFAULT nextval('public.features_id_seq'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL
);


ALTER TABLE public.features OWNER TO postgres;

--
-- TOC entry 2871 (class 0 OID 700694)
-- Dependencies: 209
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
-- TOC entry 2749 (class 2606 OID 700721)
-- Name: features features_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.features
    ADD CONSTRAINT features_pkey PRIMARY KEY (id);


-- Completed on 2020-09-13 20:46:36

--
-- PostgreSQL database dump complete
--


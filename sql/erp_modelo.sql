--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.0

-- Started on 2020-03-02 21:24:19

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

--
-- TOC entry 2889 (class 1262 OID 16393)
-- Name: amj; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE amj WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE amj OWNER TO postgres;

\connect amj

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

--
-- TOC entry 7 (class 2615 OID 16469)
-- Name: erp_modelo; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA erp_modelo;


ALTER SCHEMA erp_modelo OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16470)
-- Name: pessoa; Type: TABLE; Schema: erp_modelo; Owner: postgres
--

CREATE TABLE erp_modelo.pessoa (
    cpf character(11) NOT NULL,
    nome character varying(30) NOT NULL,
    sobrenome character varying(80) NOT NULL,
    email character varying(100) NOT NULL
);


ALTER TABLE erp_modelo.pessoa OWNER TO postgres;

-- Completed on 2020-03-02 21:24:19

--
-- PostgreSQL database dump complete
--


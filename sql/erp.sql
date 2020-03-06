--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.0

-- Started on 2020-03-05 23:59:11

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
-- TOC entry 2892 (class 1262 OID 16393)
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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16492)
-- Name: responsavel_fornecedor; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.responsavel_fornecedor (
    id_responsavel_fornecedor integer NOT NULL,
    id_fornecedor integer NOT NULL,
    data_atribuicao timestamp without time zone NOT NULL
)
INHERITS (erp_modelo.pessoa);


ALTER TABLE erp.responsavel_fornecedor OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16490)
-- Name: responsavel_fornecedor_id_responsavel_fornecedor_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.responsavel_fornecedor_id_responsavel_fornecedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.responsavel_fornecedor_id_responsavel_fornecedor_seq OWNER TO postgres;

--
-- TOC entry 2893 (class 0 OID 0)
-- Dependencies: 217
-- Name: responsavel_fornecedor_id_responsavel_fornecedor_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.responsavel_fornecedor_id_responsavel_fornecedor_seq OWNED BY erp.responsavel_fornecedor.id_responsavel_fornecedor;


--
-- TOC entry 2757 (class 2604 OID 16495)
-- Name: responsavel_fornecedor id_responsavel_fornecedor; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.responsavel_fornecedor ALTER COLUMN id_responsavel_fornecedor SET DEFAULT nextval('erp.responsavel_fornecedor_id_responsavel_fornecedor_seq'::regclass);


--
-- TOC entry 2759 (class 2606 OID 16497)
-- Name: responsavel_fornecedor pk__responsavel_fornecedor; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.responsavel_fornecedor
    ADD CONSTRAINT pk__responsavel_fornecedor PRIMARY KEY (id_responsavel_fornecedor);


--
-- TOC entry 2760 (class 2606 OID 16498)
-- Name: responsavel_fornecedor fk__responsavel_fornecedor__fornecedor; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.responsavel_fornecedor
    ADD CONSTRAINT fk__responsavel_fornecedor__fornecedor FOREIGN KEY (id_fornecedor) REFERENCES erp.fornecedor(id_fornecedor) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2020-03-05 23:59:11

--
-- PostgreSQL database dump complete
--


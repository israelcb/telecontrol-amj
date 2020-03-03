--
-- PostgreSQL database dump
--

-- Dumped from database version 12.2
-- Dumped by pg_dump version 12.0

-- Started on 2020-03-02 21:25:21

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
-- TOC entry 2951 (class 1262 OID 16393)
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
-- TOC entry 6 (class 2615 OID 16394)
-- Name: erp; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA erp;


ALTER SCHEMA erp OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 16475)
-- Name: cliente; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.cliente (
    id_cliente integer NOT NULL
)
INHERITS (erp_modelo.pessoa);


ALTER TABLE erp.cliente OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16473)
-- Name: cliente_id_cliente_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.cliente_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.cliente_id_cliente_seq OWNER TO postgres;

--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 213
-- Name: cliente_id_cliente_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.cliente_id_cliente_seq OWNED BY erp.cliente.id_cliente;


--
-- TOC entry 222 (class 1259 OID 16513)
-- Name: contrato; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.contrato (
    id_contrato integer NOT NULL,
    id_responsavel_fornecedor integer NOT NULL,
    data_vigencia time without time zone NOT NULL,
    data_encerramento time without time zone
);


ALTER TABLE erp.contrato OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16511)
-- Name: contrato_id_contrato_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.contrato_id_contrato_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.contrato_id_contrato_seq OWNER TO postgres;

--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 221
-- Name: contrato_id_contrato_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.contrato_id_contrato_seq OWNED BY erp.contrato.id_contrato;


--
-- TOC entry 224 (class 1259 OID 16526)
-- Name: contrato_peca; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.contrato_peca (
    id_contrato_peca integer NOT NULL,
    id_contrato integer NOT NULL,
    id_peca integer NOT NULL
);


ALTER TABLE erp.contrato_peca OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16524)
-- Name: contrato_peca_id_contrato_peca_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.contrato_peca_id_contrato_peca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.contrato_peca_id_contrato_peca_seq OWNER TO postgres;

--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 223
-- Name: contrato_peca_id_contrato_peca_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.contrato_peca_id_contrato_peca_seq OWNED BY erp.contrato_peca.id_contrato_peca;


--
-- TOC entry 211 (class 1259 OID 16433)
-- Name: fornecedor; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.fornecedor (
    id_fornecedor integer NOT NULL,
    cnpj character(14) NOT NULL,
    razao_social character varying(255) NOT NULL,
    nome_fantasia character varying(255) NOT NULL,
    token_acesso character varying(255)
);


ALTER TABLE erp.fornecedor OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16431)
-- Name: fornecedor_id_fornecedor_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.fornecedor_id_fornecedor_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.fornecedor_id_fornecedor_seq OWNER TO postgres;

--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 210
-- Name: fornecedor_id_fornecedor_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.fornecedor_id_fornecedor_seq OWNED BY erp.fornecedor.id_fornecedor;


--
-- TOC entry 226 (class 1259 OID 16544)
-- Name: ordem_servico; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.ordem_servico (
    id_ordem_servico bigint NOT NULL,
    id_cliente integer NOT NULL,
    id_produto integer NOT NULL,
    id_valor_mao_de_obra integer,
    problema text,
    numero_nota_fiscal numeric(6,0) NOT NULL,
    serie_nota_fiscal integer NOT NULL,
    data_compra timestamp without time zone NOT NULL,
    data_finalizacao timestamp without time zone NOT NULL
);


ALTER TABLE erp.ordem_servico OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16542)
-- Name: ordem_servico_id_ordem_servico_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.ordem_servico_id_ordem_servico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.ordem_servico_id_ordem_servico_seq OWNER TO postgres;

--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 225
-- Name: ordem_servico_id_ordem_servico_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.ordem_servico_id_ordem_servico_seq OWNED BY erp.ordem_servico.id_ordem_servico;


--
-- TOC entry 230 (class 1259 OID 16591)
-- Name: ordem_servico_peca; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.ordem_servico_peca (
    id_ordem_servico_peca bigint NOT NULL,
    id_ordem_servico bigint NOT NULL,
    id_peca integer NOT NULL,
    quantidade smallint NOT NULL
);


ALTER TABLE erp.ordem_servico_peca OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16589)
-- Name: ordem_servico_peca_id_ordem_servico_peca_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.ordem_servico_peca_id_ordem_servico_peca_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.ordem_servico_peca_id_ordem_servico_peca_seq OWNER TO postgres;

--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 229
-- Name: ordem_servico_peca_id_ordem_servico_peca_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.ordem_servico_peca_id_ordem_servico_peca_seq OWNED BY erp.ordem_servico_peca.id_ordem_servico_peca;


--
-- TOC entry 220 (class 1259 OID 16505)
-- Name: peca; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.peca (
    id_peca integer NOT NULL,
    peca character varying(100) NOT NULL
);


ALTER TABLE erp.peca OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16503)
-- Name: peca_id_peca_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.peca_id_peca_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.peca_id_peca_seq OWNER TO postgres;

--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 219
-- Name: peca_id_peca_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.peca_id_peca_seq OWNED BY erp.peca.id_peca;


--
-- TOC entry 207 (class 1259 OID 16411)
-- Name: produto; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.produto (
    id_produto integer NOT NULL,
    referencia character varying(12) NOT NULL,
    descricao text NOT NULL,
    tensao smallint
);


ALTER TABLE erp.produto OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16409)
-- Name: produto_id_produto_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.produto_id_produto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.produto_id_produto_seq OWNER TO postgres;

--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 206
-- Name: produto_id_produto_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.produto_id_produto_seq OWNED BY erp.produto.id_produto;


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
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 217
-- Name: responsavel_fornecedor_id_responsavel_fornecedor_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.responsavel_fornecedor_id_responsavel_fornecedor_seq OWNED BY erp.responsavel_fornecedor.id_responsavel_fornecedor;


--
-- TOC entry 228 (class 1259 OID 16570)
-- Name: servico_adicional_ordem_servico; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.servico_adicional_ordem_servico (
    id_servico_adicional_ordem_servico bigint NOT NULL,
    id_ordem_servico bigint NOT NULL,
    id_tipo_servico_adicional integer NOT NULL,
    valor real NOT NULL,
    descricao text
);


ALTER TABLE erp.servico_adicional_ordem_servico OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16568)
-- Name: servico_adicional_ordem_servi_id_servico_adicional_ordem_se_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.servico_adicional_ordem_servi_id_servico_adicional_ordem_se_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.servico_adicional_ordem_servi_id_servico_adicional_ordem_se_seq OWNER TO postgres;

--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 227
-- Name: servico_adicional_ordem_servi_id_servico_adicional_ordem_se_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.servico_adicional_ordem_servi_id_servico_adicional_ordem_se_seq OWNED BY erp.servico_adicional_ordem_servico.id_servico_adicional_ordem_servico;


--
-- TOC entry 209 (class 1259 OID 16422)
-- Name: tipo_servico_adicional; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.tipo_servico_adicional (
    id_tipo_servico_adicional integer NOT NULL,
    tipo_servico_adicional character varying NOT NULL
);


ALTER TABLE erp.tipo_servico_adicional OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16420)
-- Name: tipo_servico_adicional_id_tipo_servico_adicional_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.tipo_servico_adicional_id_tipo_servico_adicional_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.tipo_servico_adicional_id_tipo_servico_adicional_seq OWNER TO postgres;

--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 208
-- Name: tipo_servico_adicional_id_tipo_servico_adicional_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.tipo_servico_adicional_id_tipo_servico_adicional_seq OWNED BY erp.tipo_servico_adicional.id_tipo_servico_adicional;


--
-- TOC entry 216 (class 1259 OID 16483)
-- Name: usuario; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.usuario (
    id_usuario integer NOT NULL,
    senha character(64) NOT NULL
)
INHERITS (erp_modelo.pessoa);


ALTER TABLE erp.usuario OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16481)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.usuario_id_usuario_seq OWNED BY erp.usuario.id_usuario;


--
-- TOC entry 204 (class 1259 OID 16395)
-- Name: valor_mao_de_obra; Type: TABLE; Schema: erp; Owner: postgres
--

CREATE TABLE erp.valor_mao_de_obra (
    id_valor_mao_de_obra integer NOT NULL,
    valor real NOT NULL,
    descricao text NOT NULL
);


ALTER TABLE erp.valor_mao_de_obra OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16398)
-- Name: valor_mao_de_obra_id_valor_mao_de_obra_seq; Type: SEQUENCE; Schema: erp; Owner: postgres
--

CREATE SEQUENCE erp.valor_mao_de_obra_id_valor_mao_de_obra_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE erp.valor_mao_de_obra_id_valor_mao_de_obra_seq OWNER TO postgres;

--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 205
-- Name: valor_mao_de_obra_id_valor_mao_de_obra_seq; Type: SEQUENCE OWNED BY; Schema: erp; Owner: postgres
--

ALTER SEQUENCE erp.valor_mao_de_obra_id_valor_mao_de_obra_seq OWNED BY erp.valor_mao_de_obra.id_valor_mao_de_obra;


--
-- TOC entry 2774 (class 2604 OID 16478)
-- Name: cliente id_cliente; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cliente ALTER COLUMN id_cliente SET DEFAULT nextval('erp.cliente_id_cliente_seq'::regclass);


--
-- TOC entry 2778 (class 2604 OID 16516)
-- Name: contrato id_contrato; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato ALTER COLUMN id_contrato SET DEFAULT nextval('erp.contrato_id_contrato_seq'::regclass);


--
-- TOC entry 2779 (class 2604 OID 16529)
-- Name: contrato_peca id_contrato_peca; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato_peca ALTER COLUMN id_contrato_peca SET DEFAULT nextval('erp.contrato_peca_id_contrato_peca_seq'::regclass);


--
-- TOC entry 2773 (class 2604 OID 16436)
-- Name: fornecedor id_fornecedor; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fornecedor ALTER COLUMN id_fornecedor SET DEFAULT nextval('erp.fornecedor_id_fornecedor_seq'::regclass);


--
-- TOC entry 2780 (class 2604 OID 16547)
-- Name: ordem_servico id_ordem_servico; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico ALTER COLUMN id_ordem_servico SET DEFAULT nextval('erp.ordem_servico_id_ordem_servico_seq'::regclass);


--
-- TOC entry 2782 (class 2604 OID 16594)
-- Name: ordem_servico_peca id_ordem_servico_peca; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico_peca ALTER COLUMN id_ordem_servico_peca SET DEFAULT nextval('erp.ordem_servico_peca_id_ordem_servico_peca_seq'::regclass);


--
-- TOC entry 2777 (class 2604 OID 16508)
-- Name: peca id_peca; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.peca ALTER COLUMN id_peca SET DEFAULT nextval('erp.peca_id_peca_seq'::regclass);


--
-- TOC entry 2771 (class 2604 OID 16414)
-- Name: produto id_produto; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.produto ALTER COLUMN id_produto SET DEFAULT nextval('erp.produto_id_produto_seq'::regclass);


--
-- TOC entry 2776 (class 2604 OID 16495)
-- Name: responsavel_fornecedor id_responsavel_fornecedor; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.responsavel_fornecedor ALTER COLUMN id_responsavel_fornecedor SET DEFAULT nextval('erp.responsavel_fornecedor_id_responsavel_fornecedor_seq'::regclass);


--
-- TOC entry 2781 (class 2604 OID 16573)
-- Name: servico_adicional_ordem_servico id_servico_adicional_ordem_servico; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.servico_adicional_ordem_servico ALTER COLUMN id_servico_adicional_ordem_servico SET DEFAULT nextval('erp.servico_adicional_ordem_servi_id_servico_adicional_ordem_se_seq'::regclass);


--
-- TOC entry 2772 (class 2604 OID 16425)
-- Name: tipo_servico_adicional id_tipo_servico_adicional; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.tipo_servico_adicional ALTER COLUMN id_tipo_servico_adicional SET DEFAULT nextval('erp.tipo_servico_adicional_id_tipo_servico_adicional_seq'::regclass);


--
-- TOC entry 2775 (class 2604 OID 16486)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('erp.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 2770 (class 2604 OID 16400)
-- Name: valor_mao_de_obra id_valor_mao_de_obra; Type: DEFAULT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.valor_mao_de_obra ALTER COLUMN id_valor_mao_de_obra SET DEFAULT nextval('erp.valor_mao_de_obra_id_valor_mao_de_obra_seq'::regclass);


--
-- TOC entry 2792 (class 2606 OID 16480)
-- Name: cliente pk__cliente; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.cliente
    ADD CONSTRAINT pk__cliente PRIMARY KEY (id_cliente);


--
-- TOC entry 2800 (class 2606 OID 16518)
-- Name: contrato pk__contrato; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato
    ADD CONSTRAINT pk__contrato PRIMARY KEY (id_contrato);


--
-- TOC entry 2802 (class 2606 OID 16531)
-- Name: contrato_peca pk__contrato_peca; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato_peca
    ADD CONSTRAINT pk__contrato_peca PRIMARY KEY (id_contrato_peca);


--
-- TOC entry 2790 (class 2606 OID 16441)
-- Name: fornecedor pk__fornecedor; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.fornecedor
    ADD CONSTRAINT pk__fornecedor PRIMARY KEY (id_fornecedor);


--
-- TOC entry 2804 (class 2606 OID 16552)
-- Name: ordem_servico pk__ordem_servico; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico
    ADD CONSTRAINT pk__ordem_servico PRIMARY KEY (id_ordem_servico);


--
-- TOC entry 2808 (class 2606 OID 16596)
-- Name: ordem_servico_peca pk__ordem_servico_peca; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico_peca
    ADD CONSTRAINT pk__ordem_servico_peca PRIMARY KEY (id_ordem_servico_peca);


--
-- TOC entry 2798 (class 2606 OID 16510)
-- Name: peca pk__peca; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.peca
    ADD CONSTRAINT pk__peca PRIMARY KEY (id_peca);


--
-- TOC entry 2786 (class 2606 OID 16419)
-- Name: produto pk__produto; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.produto
    ADD CONSTRAINT pk__produto PRIMARY KEY (id_produto);


--
-- TOC entry 2796 (class 2606 OID 16497)
-- Name: responsavel_fornecedor pk__responsavel_fornecedor; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.responsavel_fornecedor
    ADD CONSTRAINT pk__responsavel_fornecedor PRIMARY KEY (id_responsavel_fornecedor);


--
-- TOC entry 2806 (class 2606 OID 16578)
-- Name: servico_adicional_ordem_servico pk__servico_adicional_ordem_servico; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.servico_adicional_ordem_servico
    ADD CONSTRAINT pk__servico_adicional_ordem_servico PRIMARY KEY (id_servico_adicional_ordem_servico);


--
-- TOC entry 2788 (class 2606 OID 16430)
-- Name: tipo_servico_adicional pk__tipo_servico_adicional; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.tipo_servico_adicional
    ADD CONSTRAINT pk__tipo_servico_adicional PRIMARY KEY (id_tipo_servico_adicional);


--
-- TOC entry 2794 (class 2606 OID 16488)
-- Name: usuario pk__usuario; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.usuario
    ADD CONSTRAINT pk__usuario PRIMARY KEY (id_usuario);


--
-- TOC entry 2784 (class 2606 OID 16408)
-- Name: valor_mao_de_obra pk__valor_mao_de_obra; Type: CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.valor_mao_de_obra
    ADD CONSTRAINT pk__valor_mao_de_obra PRIMARY KEY (id_valor_mao_de_obra);


--
-- TOC entry 2810 (class 2606 OID 16519)
-- Name: contrato fk__contrato__responsavel_fornecedor; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato
    ADD CONSTRAINT fk__contrato__responsavel_fornecedor FOREIGN KEY (id_responsavel_fornecedor) REFERENCES erp.responsavel_fornecedor(id_responsavel_fornecedor) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2811 (class 2606 OID 16532)
-- Name: contrato_peca fk__contrato_peca__contrato; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato_peca
    ADD CONSTRAINT fk__contrato_peca__contrato FOREIGN KEY (id_contrato) REFERENCES erp.contrato(id_contrato) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2812 (class 2606 OID 16537)
-- Name: contrato_peca fk__contrato_peca__peca; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.contrato_peca
    ADD CONSTRAINT fk__contrato_peca__peca FOREIGN KEY (id_peca) REFERENCES erp.peca(id_peca) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2813 (class 2606 OID 16553)
-- Name: ordem_servico fk__ordem_servico__cliente; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico
    ADD CONSTRAINT fk__ordem_servico__cliente FOREIGN KEY (id_cliente) REFERENCES erp.cliente(id_cliente) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2814 (class 2606 OID 16558)
-- Name: ordem_servico fk__ordem_servico__produto; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico
    ADD CONSTRAINT fk__ordem_servico__produto FOREIGN KEY (id_produto) REFERENCES erp.produto(id_produto) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2815 (class 2606 OID 16563)
-- Name: ordem_servico fk__ordem_servico__valor_mao_de_obra; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico
    ADD CONSTRAINT fk__ordem_servico__valor_mao_de_obra FOREIGN KEY (id_valor_mao_de_obra) REFERENCES erp.valor_mao_de_obra(id_valor_mao_de_obra) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2818 (class 2606 OID 16597)
-- Name: ordem_servico_peca fk__ordem_servico_peca__ordem_servico; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico_peca
    ADD CONSTRAINT fk__ordem_servico_peca__ordem_servico FOREIGN KEY (id_ordem_servico) REFERENCES erp.ordem_servico(id_ordem_servico) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2819 (class 2606 OID 16602)
-- Name: ordem_servico_peca fk__ordem_servico_peca__peca; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.ordem_servico_peca
    ADD CONSTRAINT fk__ordem_servico_peca__peca FOREIGN KEY (id_peca) REFERENCES erp.peca(id_peca) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2809 (class 2606 OID 16498)
-- Name: responsavel_fornecedor fk__responsavel_fornecedor__fornecedor; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.responsavel_fornecedor
    ADD CONSTRAINT fk__responsavel_fornecedor__fornecedor FOREIGN KEY (id_fornecedor) REFERENCES erp.fornecedor(id_fornecedor) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2816 (class 2606 OID 16579)
-- Name: servico_adicional_ordem_servico fk__servico_adicional_ordem_servico__ordem_servico; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.servico_adicional_ordem_servico
    ADD CONSTRAINT fk__servico_adicional_ordem_servico__ordem_servico FOREIGN KEY (id_ordem_servico) REFERENCES erp.ordem_servico(id_ordem_servico) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 2817 (class 2606 OID 16584)
-- Name: servico_adicional_ordem_servico fk__servico_adicional_ordem_servico__servico_adicional; Type: FK CONSTRAINT; Schema: erp; Owner: postgres
--

ALTER TABLE ONLY erp.servico_adicional_ordem_servico
    ADD CONSTRAINT fk__servico_adicional_ordem_servico__servico_adicional FOREIGN KEY (id_tipo_servico_adicional) REFERENCES erp.tipo_servico_adicional(id_tipo_servico_adicional) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2020-03-02 21:25:22

--
-- PostgreSQL database dump complete
--


--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: paypal_transactions; Type: TABLE; Schema: public; Owner: patrick; Tablespace: 
--

CREATE TABLE paypal_transactions (
    id character(17) NOT NULL,
    type character(100) NOT NULL,
    gross integer NOT NULL,
    fee integer NOT NULL,
    net integer NOT NULL,
    from_email character(100) NOT NULL,
    to_email character(100) NOT NULL,
    title character(140),
    created_at timestamp without time zone NOT NULL
);


ALTER TABLE public.paypal_transactions OWNER TO patrick;

--
-- Name: paypal_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: patrick; Tablespace: 
--

ALTER TABLE ONLY paypal_transactions
    ADD CONSTRAINT paypal_transactions_pkey PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--


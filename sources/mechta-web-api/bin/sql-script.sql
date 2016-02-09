--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2016-02-07 17:50:19

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1945 (class 0 OID 59173)
-- Dependencies: 171
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (1, NULL, NULL, 'kr', 'Караганда', 'karaganda', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (2, NULL, NULL, 'al', 'Алматы', 'almaty', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (3, NULL, NULL, NULL, 'Астана', NULL, false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (4, NULL, NULL, 'au', 'Актау', 'aktau', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (5, NULL, NULL, 'kk', 'Кокшетау', 'kokshetau', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (6, NULL, NULL, 'ks', 'Костанай', 'kostanay', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (7, NULL, NULL, 'pv', 'Павлодар', 'pavlodar', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (8, NULL, NULL, 'pt', 'Петропавловск', 'petropavlovsk', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (9, NULL, NULL, 'sm', 'Семей', 'semey', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (10, NULL, NULL, 'ur', 'Уральск', 'uralsk', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (11, NULL, NULL, 'uk', 'Усть-Каменогорск', 'ust-kamenogorsk', false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted) VALUES (12, NULL, NULL, 'sh', 'Шымкент', 'shymkent', false);


--
-- TOC entry 1946 (class 0 OID 66497)
-- Dependencies: 174
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (1, NULL, false, NULL, 'name', 'asc', 'Название');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (2, NULL, false, NULL, 'name', 'desc', 'Название');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (3, NULL, false, NULL, 'created_date', 'asc', 'Новизна');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (4, NULL, false, NULL, 'created_date', 'desc', 'Новизна');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (5, NULL, false, NULL, 'catalog_PRICE_2', 'asc', 'Цена');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (6, NULL, false, NULL, 'catalog_PRICE_2', 'desc', 'Цена');


-- Completed on 2016-02-07 17:50:19

--
-- PostgreSQL database dump complete
--


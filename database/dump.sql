--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.0
-- Dumped by pg_dump version 9.4.0
-- Started on 2016-02-16 17:43:05 ALMT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 178 (class 3079 OID 12123)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2305 (class 0 OID 0)
-- Dependencies: 178
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 86634)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE categories (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_date timestamp without time zone,
    count_products integer,
    imageurl character varying(150),
    name character varying(100),
    number_on_site bigint,
    category_id bigint
);


ALTER TABLE categories OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 86640)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cities (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_date timestamp without time zone,
    code character varying(100),
    name character varying(100),
    name_on_site character varying(100),
    published boolean DEFAULT true NOT NULL,
    latitude real,
    longitude real
);


ALTER TABLE cities OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 86671)
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hibernate_sequence OWNER TO postgres;

--
-- TOC entry 174 (class 1259 OID 86646)
-- Name: order_product; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE order_product (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_date timestamp without time zone,
    name character varying(50),
    title character varying(50),
    type character varying(50)
);


ALTER TABLE order_product OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 86652)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE products (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_date timestamp without time zone,
    availability_in_shop character varying(255),
    cost integer,
    image_url character varying(255),
    name character varying(255),
    number_on_site bigint,
    category_id bigint
);


ALTER TABLE products OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 86693)
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE stores (
    id bigint NOT NULL,
    created_date timestamp without time zone,
    deleted boolean DEFAULT false NOT NULL,
    modified_date timestamp without time zone,
    latitude real,
    longitude real,
    name character varying(255),
    schedule character varying(100),
    telephones character varying(100),
    city_id bigint
);


ALTER TABLE stores OWNER TO postgres;

--
-- TOC entry 2292 (class 0 OID 86634)
-- Dependencies: 172
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (790, '2016-02-09 00:08:08.654', true, '2016-02-09 00:08:08.654', NULL, 'http://www.mechta.kz/templates/img/icon/kyhonaya-tehnika.gif', 'Бытовая техника', 82, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (792, '2016-02-09 00:08:08.69', true, '2016-02-09 00:08:08.69', NULL, NULL, 'Холодильники, морозильники и оборудование', 233, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (793, '2016-02-09 00:08:08.693', true, '2016-02-09 00:08:08.693', NULL, NULL, 'Газоэлектрические плиты', 236, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (853, '2016-02-09 00:08:09.917', true, '2016-02-09 00:08:09.918', NULL, NULL, 'Cплит системы', 860, 852);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (854, '2016-02-09 00:08:09.921', true, '2016-02-09 00:08:09.921', NULL, NULL, 'Мобильные кондиционеры', 3930, 852);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (855, '2016-02-09 00:08:09.925', true, '2016-02-09 00:08:09.925', NULL, NULL, 'Оконные кондиционеры', 4332, 852);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (856, '2016-02-09 00:08:09.929', true, '2016-02-09 00:08:09.929', NULL, NULL, 'Кондиционеры колонного типа', 5276, 852);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (857, '2016-02-09 00:08:09.932', true, '2016-02-09 00:08:09.932', NULL, NULL, 'Кассетные кондиционеры', 13495, 852);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (859, '2016-02-09 00:08:09.939', true, '2016-02-09 00:08:09.939', NULL, NULL, 'Инсталляция', 6519, 858);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (860, '2016-02-09 00:08:09.943', true, '2016-02-09 00:08:09.943', NULL, NULL, 'Очистители', 15857, 858);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (862, '2016-02-09 00:08:09.95', true, '2016-02-09 00:08:09.95', NULL, NULL, 'Маслянные обогреватели', 863, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (863, '2016-02-09 00:08:09.953', true, '2016-02-09 00:08:09.953', NULL, NULL, 'Конвекторы', 862, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (864, '2016-02-09 00:08:09.956', true, '2016-02-09 00:08:09.956', NULL, NULL, 'Тепловентиляторы', 864, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (865, '2016-02-09 00:08:09.96', true, '2016-02-09 00:08:09.96', NULL, NULL, 'Без маслянные обогреватели', 861, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (867, '2016-02-09 00:08:09.966', true, '2016-02-09 00:08:09.966', NULL, NULL, 'ИК-обогреватель', 866, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (903, '2016-02-09 00:08:10.539', true, '2016-02-09 00:08:10.539', NULL, NULL, 'Аксессуары для ноутбуков и планшетов', 244, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (904, '2016-02-09 00:08:10.544', true, '2016-02-09 00:08:10.544', NULL, NULL, 'Медианосители', 246, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (905, '2016-02-09 00:08:10.547', true, '2016-02-09 00:08:10.547', NULL, NULL, 'Флэш накопители', 247, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (906, '2016-02-09 00:08:10.551', true, '2016-02-09 00:08:10.551', NULL, NULL, 'Внешние жесткие диски', 248, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (907, '2016-02-09 00:08:10.554', true, '2016-02-09 00:08:10.554', NULL, NULL, 'Карты памяти и ридеры', 249, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (908, '2016-02-09 00:08:10.558', true, '2016-02-09 00:08:10.558', NULL, NULL, 'Клавиатуры', 250, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (909, '2016-02-09 00:08:10.562', true, '2016-02-09 00:08:10.562', NULL, NULL, 'Акустические системы', 251, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (910, '2016-02-09 00:08:10.565', true, '2016-02-09 00:08:10.565', NULL, NULL, 'Мыши', 252, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (911, '2016-02-09 00:08:10.568', true, '2016-02-09 00:08:10.568', NULL, NULL, 'Сумки компьютерные', 254, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (927, '2016-02-09 00:08:11.049', true, '2016-02-09 00:08:11.049', NULL, NULL, 'LG', 5479, 926);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (953, '2016-02-09 00:08:11.573', true, '2016-02-09 00:08:11.573', NULL, NULL, 'Чехлы для мобильных телефонов', 338, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (954, '2016-02-09 00:08:11.576', true, '2016-02-09 00:08:11.576', NULL, NULL, 'Беспроводные гарнитуры Bluetooth', 3900, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (955, '2016-02-09 00:08:11.578', true, '2016-02-09 00:08:11.578', NULL, NULL, 'Держатели для сотовых телефонов', 4272, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (956, '2016-02-09 00:08:11.581', true, '2016-02-09 00:08:11.581', NULL, NULL, 'Проводные гарнитуры для мобильных телефонов', 4364, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (957, '2016-02-09 00:08:11.584', true, '2016-02-09 00:08:11.584', NULL, NULL, 'Адаптеры', 5542, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (958, '2016-02-09 00:08:11.587', true, '2016-02-09 00:08:11.587', NULL, NULL, 'Смарт часы', 5893, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (959, '2016-02-09 00:08:11.589', true, '2016-02-09 00:08:11.589', NULL, NULL, 'Моноподы', 10836, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (960, '2016-02-09 00:08:11.592', true, '2016-02-09 00:08:11.592', NULL, NULL, 'Очки виртуальной реальности', 20095, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (962, '2016-02-09 00:08:11.597', true, '2016-02-09 00:08:11.597', NULL, NULL, 'Радионяни', 4275, 961);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (963, '2016-02-09 00:08:11.599', true, '2016-02-09 00:08:11.599', NULL, NULL, 'Радиостанции', 5684, 961);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (964, '2016-02-09 00:08:11.602', true, '2016-02-09 00:08:11.602', NULL, NULL, 'Аксессуары для радиостанций', 16674, 961);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (998, '2016-02-09 00:08:13.685', true, '2016-02-09 00:08:13.685', NULL, NULL, 'Выпрямители волос', 411, 994);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (999, '2016-02-09 00:08:13.688', true, '2016-02-09 00:08:13.688', NULL, NULL, 'Волюмайзеры', 5878, 994);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1000, '2016-02-09 00:08:13.69', true, '2016-02-09 00:08:13.69', NULL, NULL, 'Электробигуди', 415, 994);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1002, '2016-02-09 00:08:13.696', true, '2016-02-09 00:08:13.696', NULL, NULL, 'Машинки для стрижки волос', 409, 1001);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1003, '2016-02-09 00:08:13.698', true, '2016-02-09 00:08:13.698', NULL, NULL, 'Триммер для стрижки бороды и ухо/нос', 410, 1001);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1004, '2016-02-09 00:08:13.701', true, '2016-02-09 00:08:13.701', NULL, NULL, 'Триммеры для тела', 5910, 1001);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1006, '2016-02-09 00:08:13.706', true, '2016-02-09 00:08:13.706', NULL, NULL, 'Маникюрные наборы', 4347, 1005);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1007, '2016-02-09 00:08:13.709', true, '2016-02-09 00:08:13.709', NULL, NULL, 'Электропилки', 13644, 1005);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1009, '2016-02-09 00:08:13.714', true, '2016-02-09 00:08:13.714', NULL, NULL, 'Электрические зубные щётки', 408, 1008);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1010, '2016-02-09 00:08:13.716', true, '2016-02-09 00:08:13.716', NULL, NULL, 'Насадки для эл.зубных щёток', 407, 1008);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1012, '2016-02-09 00:08:13.722', true, '2016-02-09 00:08:13.722', NULL, NULL, 'Электробритвы', 418, 1011);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1013, '2016-02-09 00:08:13.725', true, '2016-02-09 00:08:13.725', NULL, NULL, 'Сетки электробритв', 5384, 1011);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1014, '2016-02-09 00:08:13.727', true, '2016-02-09 00:08:13.727', NULL, NULL, 'Чистящие средства для электробритв', 417, 1011);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1015, '2016-02-09 00:08:13.73', true, '2016-02-09 00:08:13.73', NULL, NULL, 'Лосьоны для бритья', 13658, 1011);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1017, '2016-02-09 00:08:13.735', true, '2016-02-09 00:08:13.735', NULL, NULL, 'Эпиляторы', 419, 1016);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1018, '2016-02-09 00:08:13.737', true, '2016-02-09 00:08:13.737', NULL, NULL, 'Сетки и режущие блоки для эпиляторов', 5269, 1016);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1019, '2016-02-09 00:08:13.74', true, '2016-02-09 00:08:13.74', NULL, NULL, 'Массажёры', 5687, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1020, '2016-02-09 00:08:13.743', true, '2016-02-09 00:08:13.743', NULL, NULL, 'BODYKRAFT', 5745, 1019);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1021, '2016-02-09 00:08:13.746', true, '2016-02-09 00:08:13.746', NULL, NULL, 'POLARIS', 6417, 1019);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (794, '2016-02-09 00:08:08.696', true, '2016-02-09 00:08:08.696', NULL, NULL, 'Посудомоечные машины', 230, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (795, '2016-02-09 00:08:08.699', true, '2016-02-09 00:08:08.699', NULL, NULL, 'Микроволновые печи', 239, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (796, '2016-02-09 00:08:08.702', true, '2016-02-09 00:08:08.702', NULL, NULL, 'Стиральные машины', 241, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (797, '2016-02-09 00:08:08.705', true, '2016-02-09 00:08:08.705', NULL, NULL, 'Сушильные машины', 231, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (798, '2016-02-09 00:08:08.708', true, '2016-02-09 00:08:08.708', NULL, NULL, 'Утюги', 242, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (799, '2016-02-09 00:08:08.711', true, '2016-02-09 00:08:08.711', NULL, NULL, 'Пылесосы', 240, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (800, '2016-02-09 00:08:08.713', true, '2016-02-09 00:08:08.713', NULL, NULL, 'Часы', 234, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (801, '2016-02-09 00:08:08.716', true, '2016-02-09 00:08:08.716', NULL, NULL, 'Фонари', 232, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (802, '2016-02-09 00:08:08.719', true, '2016-02-09 00:08:08.719', NULL, NULL, 'Лампы', 238, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (803, '2016-02-09 00:08:08.722', true, '2016-02-09 00:08:08.722', NULL, NULL, 'Швейные машины', 3465, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (804, '2016-02-09 00:08:08.726', true, '2016-02-09 00:08:08.726', NULL, NULL, 'Лампы настольные', 507, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (805, '2016-02-09 00:08:08.728', true, '2016-02-09 00:08:08.728', NULL, NULL, 'Уход за вещами', 4548, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (806, '2016-02-09 00:08:08.732', true, '2016-02-09 00:08:08.732', NULL, NULL, 'Светильники', 5750, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (807, '2016-02-09 00:08:08.735', true, '2016-02-09 00:08:08.735', NULL, NULL, 'Звонки', 5957, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (808, '2016-02-09 00:08:08.738', true, '2016-02-09 00:08:08.738', NULL, NULL, 'Швабры', 13586, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (809, '2016-02-09 00:08:08.741', true, '2016-02-09 00:08:08.741', NULL, NULL, 'Сейфы', 13677, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (810, '2016-02-09 00:08:08.744', true, '2016-02-09 00:08:08.744', NULL, NULL, 'Аксессуары для бытовой техники', 235, 791);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (812, '2016-02-09 00:08:08.75', true, '2016-02-09 00:08:08.75', NULL, NULL, 'Чайники', 227, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (813, '2016-02-09 00:08:08.753', true, '2016-02-09 00:08:08.753', NULL, NULL, 'Термопоты', 467, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (814, '2016-02-09 00:08:08.757', true, '2016-02-09 00:08:08.757', NULL, NULL, 'Мультиварки', 222, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (815, '2016-02-09 00:08:08.76', true, '2016-02-09 00:08:08.76', NULL, NULL, 'Аксессуары для мультиварок', 5676, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (816, '2016-02-09 00:08:08.764', true, '2016-02-09 00:08:08.764', NULL, NULL, 'Пароварки', 430, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (817, '2016-02-09 00:08:08.767', true, '2016-02-09 00:08:08.767', NULL, NULL, 'Хлебопечки', 226, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (818, '2016-02-09 00:08:08.77', true, '2016-02-09 00:08:08.77', NULL, NULL, 'Йогуртницы', 5858, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (819, '2016-02-09 00:08:08.774', true, '2016-02-09 00:08:08.774', NULL, NULL, 'Весы кухонные', 216, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (820, '2016-02-09 00:08:08.777', true, '2016-02-09 00:08:08.777', NULL, NULL, 'Водоочистители', 217, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (821, '2016-02-09 00:08:08.78', true, '2016-02-09 00:08:08.781', NULL, NULL, 'Кофемашины', 218, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (822, '2016-02-09 00:08:08.784', true, '2016-02-09 00:08:08.784', NULL, NULL, 'Аксессуары для кофемашин', 6709, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (823, '2016-02-09 00:08:08.787', true, '2016-02-09 00:08:08.787', NULL, NULL, 'Мясорубки', 221, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (824, '2016-02-09 00:08:08.79', true, '2016-02-09 00:08:08.79', NULL, NULL, 'Соковыжималки', 224, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (825, '2016-02-09 00:08:08.794', true, '2016-02-09 00:08:08.794', NULL, NULL, 'Блендеры', 10952, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (826, '2016-02-09 00:08:08.797', true, '2016-02-09 00:08:08.797', NULL, NULL, 'Аксессуары к блендеру', 6679, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (827, '2016-02-09 00:08:08.801', true, '2016-02-09 00:08:08.801', NULL, NULL, 'Кухонные комбайны', 219, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (828, '2016-02-09 00:08:08.804', true, '2016-02-09 00:08:08.804', NULL, NULL, 'Тостеры', 225, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (829, '2016-02-09 00:08:08.807', true, '2016-02-09 00:08:08.807', NULL, NULL, 'Электрогрили', 228, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (830, '2016-02-09 00:08:08.811', true, '2016-02-09 00:08:08.811', NULL, NULL, 'Мороженницы', 10748, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (831, '2016-02-09 00:08:08.814', true, '2016-02-09 00:08:08.814', NULL, NULL, 'Вакуумный упаковщик', 12888, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (832, '2016-02-09 00:08:08.817', true, '2016-02-09 00:08:08.817', NULL, NULL, 'Наборы для домашней газировки', 12920, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (833, '2016-02-09 00:08:08.82', true, '2016-02-09 00:08:08.82', NULL, NULL, 'Мультипечи', 13045, 811);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (835, '2016-02-09 00:08:08.826', true, '2016-02-09 00:08:08.826', NULL, NULL, 'Встраиваемые варочные поверхности', 203, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (836, '2016-02-09 00:08:08.83', true, '2016-02-09 00:08:08.83', NULL, NULL, 'Встраиваемые декоративные панели', 204, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (837, '2016-02-09 00:08:08.835', true, '2016-02-09 00:08:08.835', NULL, NULL, 'Встраиваемые духовые шкафы', 205, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (838, '2016-02-09 00:08:08.846', true, '2016-02-09 00:08:08.846', NULL, NULL, 'Встраиваемые микроволновые печи', 206, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (839, '2016-02-09 00:08:08.852', true, '2016-02-09 00:08:08.852', NULL, NULL, 'Встраиваемые посудомоечные машины', 207, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (840, '2016-02-09 00:08:08.857', true, '2016-02-09 00:08:08.857', NULL, NULL, 'Встраиваемые стиральные машины', 208, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (841, '2016-02-09 00:08:08.862', true, '2016-02-09 00:08:08.862', NULL, NULL, 'Встраиваемые холодильники', 3903, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (842, '2016-02-09 00:08:08.867', true, '2016-02-09 00:08:08.867', NULL, NULL, 'Вытяжки', 209, 834);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (843, '2016-02-09 00:08:08.872', true, '2016-02-09 00:08:08.872', NULL, NULL, 'Посуда', 223, 790);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (844, '2016-02-09 00:08:08.88', true, '2016-02-09 00:08:08.88', NULL, NULL, 'Кухонная посуда', 16360, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (845, '2016-02-09 00:08:08.886', true, '2016-02-09 00:08:08.886', NULL, NULL, 'Столовая посуда и приборы', 16361, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (846, '2016-02-09 00:08:08.89', true, '2016-02-09 00:08:08.89', NULL, NULL, 'Кухонная утварь', 16345, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (847, '2016-02-09 00:08:08.893', true, '2016-02-09 00:08:08.893', NULL, NULL, 'Чай и кофе', 16377, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (848, '2016-02-09 00:08:08.897', true, '2016-02-09 00:08:08.897', NULL, NULL, 'Выпечка', 16385, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (849, '2016-02-09 00:08:08.9', true, '2016-02-09 00:08:08.901', NULL, NULL, 'Ножи и доски', 16380, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (850, '2016-02-09 00:08:08.904', true, '2016-02-09 00:08:08.904', NULL, NULL, 'Хранение', 16389, 843);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (851, '2016-02-09 00:08:09.91', true, '2016-02-09 00:08:09.91', NULL, 'http://www.mechta.kz/templates/img/icon/condition_access.gif', 'Климат техника', 237, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (866, '2016-02-09 00:08:09.963', true, '2016-02-09 00:08:09.963', NULL, NULL, 'Обогреватели керамические', 6691, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (868, '2016-02-09 00:08:09.97', true, '2016-02-09 00:08:09.97', NULL, NULL, 'Электрические камины', 5859, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (869, '2016-02-09 00:08:09.974', true, '2016-02-09 00:08:09.974', NULL, NULL, 'Тепловые пушки', 3853, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (870, '2016-02-09 00:08:09.977', true, '2016-02-09 00:08:09.977', NULL, NULL, 'Тепловоздушные завесы', 865, 861);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (872, '2016-02-09 00:08:09.985', true, '2016-02-09 00:08:09.985', NULL, NULL, 'Увлажнители, осушители', 857, 871);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (873, '2016-02-09 00:08:09.989', true, '2016-02-09 00:08:09.989', NULL, NULL, 'Воздухоочистители и мойка воздуха', 856, 871);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (874, '2016-02-09 00:08:09.993', true, '2016-02-09 00:08:09.993', NULL, NULL, 'Арома дифузоры', 5847, 871);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (875, '2016-02-09 00:08:09.996', true, '2016-02-09 00:08:09.996', NULL, NULL, 'Картриджи и аксессуары', 5395, 871);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (877, '2016-02-09 00:08:10.004', true, '2016-02-09 00:08:10.004', NULL, NULL, 'Термометры', 855, 876);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (878, '2016-02-09 00:08:10.008', true, '2016-02-09 00:08:10.008', NULL, NULL, 'Метеостанции', 5651, 876);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (880, '2016-02-09 00:08:10.018', true, '2016-02-09 00:08:10.018', NULL, NULL, 'Водонагреватели накопительные', 858, 879);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (881, '2016-02-09 00:08:10.023', true, '2016-02-09 00:08:10.023', NULL, NULL, 'Водонагреватели проточные', 859, 879);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (882, '2016-02-09 00:08:10.027', true, '2016-02-09 00:08:10.027', NULL, NULL, 'Водонагреватели аккумуляционные электрические', 13558, 879);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (883, '2016-02-09 00:08:10.031', true, '2016-02-09 00:08:10.031', NULL, NULL, 'Аксессуары для водонагревателей', 15841, 879);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (888, '2016-02-09 00:08:10.483', true, '2016-02-09 00:08:10.483', NULL, 'http://www.mechta.kz/templates/img/icon/padcomp.jpg', 'Планшеты, Ноутбуки, Компьютеры', 83, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (890, '2016-02-09 00:08:10.491', true, '2016-02-09 00:08:10.491', NULL, NULL, 'Ноутбуки', 259, 889);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (891, '2016-02-09 00:08:10.495', true, '2016-02-09 00:08:10.495', NULL, NULL, 'Ультрабуки', 5505, 889);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (893, '2016-02-09 00:08:10.502', true, '2016-02-09 00:08:10.502', NULL, NULL, 'Принтеры', 265, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (894, '2016-02-09 00:08:10.505', true, '2016-02-09 00:08:10.505', NULL, NULL, 'Многофункциональные устройства', 264, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (895, '2016-02-09 00:08:10.508', true, '2016-02-09 00:08:10.508', NULL, NULL, 'Расходные материалы', 253, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (896, '2016-02-09 00:08:10.512', true, '2016-02-09 00:08:10.512', NULL, NULL, 'Программное обеспечение', 261, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (897, '2016-02-09 00:08:10.515', true, '2016-02-09 00:08:10.515', NULL, NULL, 'Внешние оптические приводы DVD', 570, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (898, '2016-02-09 00:08:10.519', true, '2016-02-09 00:08:10.519', NULL, NULL, 'Модемы', 571, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (899, '2016-02-09 00:08:10.523', true, '2016-02-09 00:08:10.523', NULL, NULL, 'Бумага', 4891, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (900, '2016-02-09 00:08:10.526', true, '2016-02-09 00:08:10.526', NULL, NULL, 'Калькуляторы', 4892, 892);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (902, '2016-02-09 00:08:10.534', true, '2016-02-09 00:08:10.534', NULL, NULL, 'WEB камеры', 243, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (912, '2016-02-09 00:08:10.572', true, '2016-02-09 00:08:10.572', NULL, NULL, 'Фильтры и UPS', 255, 901);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (914, '2016-02-09 00:08:10.579', true, '2016-02-09 00:08:10.579', NULL, NULL, 'Мультимедийные моноблоки', 3962, 913);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (918, '2016-02-09 00:08:11.016', true, '2016-02-09 00:08:11.016', NULL, 'http://www.mechta.kz/templates/img/icon/tymbi.gif', 'Телевизоры, Aудио, Видео', 10773, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (920, '2016-02-09 00:08:11.025', true, '2016-02-09 00:08:11.025', NULL, NULL, 'LED (Лед телевизоры)', 96, 919);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (921, '2016-02-09 00:08:11.029', true, '2016-02-09 00:08:11.029', NULL, NULL, 'LED 4K (Телевизоры 4К)', 13142, 919);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (922, '2016-02-09 00:08:11.032', true, '2016-02-09 00:08:11.032', NULL, NULL, 'OLED (Олед телевизоры)', 5942, 919);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (924, '2016-02-09 00:08:11.039', true, '2016-02-09 00:08:11.039', NULL, NULL, 'Кронштейны для ТВ', 177, 923);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (925, '2016-02-09 00:08:11.042', true, '2016-02-09 00:08:11.042', NULL, NULL, 'Тумбы', 178, 923);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (928, '2016-02-09 00:08:11.053', true, '2016-02-09 00:08:11.053', NULL, NULL, 'SAMSUNG', 5481, 926);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (930, '2016-02-09 00:08:11.062', true, '2016-02-09 00:08:11.062', NULL, NULL, 'Магнитолы', 118, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (931, '2016-02-09 00:08:11.067', true, '2016-02-09 00:08:11.067', NULL, NULL, 'Музыкальные центры', 119, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (932, '2016-02-09 00:08:11.071', true, '2016-02-09 00:08:11.071', NULL, NULL, 'Аудиоплееры', 122, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (933, '2016-02-09 00:08:11.074', true, '2016-02-09 00:08:11.074', NULL, NULL, 'Наушники', 123, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (934, '2016-02-09 00:08:11.077', true, '2016-02-09 00:08:11.077', NULL, NULL, 'Музыкальные инструменты', 10774, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (935, '2016-02-09 00:08:11.081', true, '2016-02-09 00:08:11.081', NULL, NULL, 'Автомобильное аудио', 120, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (936, '2016-02-09 00:08:11.084', true, '2016-02-09 00:08:11.084', NULL, NULL, 'Видеопроигрыватели', 115, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (937, '2016-02-09 00:08:11.089', true, '2016-02-09 00:08:11.089', NULL, NULL, 'Домашние кинотеатры', 116, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (938, '2016-02-09 00:08:11.092', true, '2016-02-09 00:08:11.092', NULL, NULL, 'Диктофоны', 94, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (939, '2016-02-09 00:08:11.097', true, '2016-02-09 00:08:11.097', NULL, NULL, 'Аксессуары для аудио-видео', 153, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (940, '2016-02-09 00:08:11.102', true, '2016-02-09 00:08:11.102', NULL, NULL, 'Кабели/переходники', 154, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (941, '2016-02-09 00:08:11.106', true, '2016-02-09 00:08:11.106', NULL, NULL, 'Портативные колонки', 5379, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (942, '2016-02-09 00:08:11.11', true, '2016-02-09 00:08:11.11', NULL, NULL, 'Проекторы', 6672, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (943, '2016-02-09 00:08:11.114', true, '2016-02-09 00:08:11.114', NULL, NULL, 'Акустика', 13543, 929);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (944, '2016-02-09 00:08:11.548', true, '2016-02-09 00:08:11.548', NULL, 'http://www.mechta.kz/templates/img/icon/accessmob.jpg', 'Телефоны', 80, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (946, '2016-02-09 00:08:11.555', true, '2016-02-09 00:08:11.555', NULL, NULL, 'Смартфоны', 5100, 945);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (947, '2016-02-09 00:08:11.558', true, '2016-02-09 00:08:11.558', NULL, NULL, 'Телефоны', 5106, 945);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (949, '2016-02-09 00:08:11.563', true, '2016-02-09 00:08:11.563', NULL, NULL, 'Зарядные устройства для мобильных телефонов', 334, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (950, '2016-02-09 00:08:11.565', true, '2016-02-09 00:08:11.565', NULL, NULL, 'Зарядные устройства в автомобиль', 335, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (951, '2016-02-09 00:08:11.568', true, '2016-02-09 00:08:11.568', NULL, NULL, 'Защитные плёнки для мобильных телефонов', 336, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (952, '2016-02-09 00:08:11.57', true, '2016-02-09 00:08:11.57', NULL, NULL, 'Кабели для мобильных телефонов', 337, 948);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (997, '2016-02-09 00:08:13.682', true, '2016-02-09 00:08:13.682', NULL, NULL, 'Плойки', 412, 994);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (966, '2016-02-09 00:08:11.607', true, '2016-02-09 00:08:11.607', NULL, NULL, 'Радиотелефоны DECT', 183, 965);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (967, '2016-02-09 00:08:11.609', true, '2016-02-09 00:08:11.609', NULL, NULL, 'Дополнительные радиотрубки DECT', 182, 965);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (968, '2016-02-09 00:08:11.611', true, '2016-02-09 00:08:11.612', NULL, NULL, 'Телефоны проводные', 184, 965);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (969, '2016-02-09 00:08:12.151', true, '2016-02-09 00:08:12.151', NULL, 'http://www.mechta.kz/templates/img/icon/fotoframe.gif', 'Фото, Видеокамеры, Оптика', 81, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (971, '2016-02-09 00:08:12.158', true, '2016-02-09 00:08:12.158', NULL, NULL, 'Зеркальные фотоаппараты', 201, 970);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (972, '2016-02-09 00:08:12.161', true, '2016-02-09 00:08:12.161', NULL, NULL, 'Гибридные фотоаппараты', 200, 970);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (973, '2016-02-09 00:08:12.163', true, '2016-02-09 00:08:12.163', NULL, NULL, 'Компактные фотоаппараты', 202, 970);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (975, '2016-02-09 00:08:12.169', true, '2016-02-09 00:08:12.169', NULL, NULL, 'Фоторамки', 188, 974);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (977, '2016-02-09 00:08:12.174', true, '2016-02-09 00:08:12.174', NULL, NULL, 'Видеокамеры на Flash носителях', 198, 976);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (979, '2016-02-09 00:08:12.18', true, '2016-02-09 00:08:12.18', NULL, NULL, 'Аксессуары для видеокамер', 194, 978);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (980, '2016-02-09 00:08:12.183', true, '2016-02-09 00:08:12.183', NULL, NULL, 'Аксессуары для гибридных фотоаппаратов', 195, 978);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (981, '2016-02-09 00:08:12.186', true, '2016-02-09 00:08:12.186', NULL, NULL, 'Аксессуары для зеркальных фотоаппаратов', 196, 978);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (982, '2016-02-09 00:08:12.189', true, '2016-02-09 00:08:12.189', NULL, NULL, 'Аксессуары для компактных фотоаппаратов', 197, 978);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (983, '2016-02-09 00:08:13.145', true, '2016-02-09 00:08:13.145', NULL, 'http://www.mechta.kz/templates/img/icon/g.jpg', 'Игры, Приставки, Игрушки', 76, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (985, '2016-02-09 00:08:13.151', true, '2016-02-09 00:08:13.151', NULL, NULL, 'Автомобили', 13566, 984);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (986, '2016-02-09 00:08:13.154', true, '2016-02-09 00:08:13.154', NULL, NULL, 'Дроны', 13571, 984);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (987, '2016-02-09 00:08:13.156', true, '2016-02-09 00:08:13.156', NULL, NULL, 'Вертолеты', 13574, 984);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (988, '2016-02-09 00:08:13.159', true, '2016-02-09 00:08:13.159', NULL, NULL, 'Танки', 16115, 984);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (993, '2016-02-09 00:08:13.67', true, '2016-02-09 00:08:13.67', NULL, 'http://www.mechta.kz/templates/img/icon/strizhka.gif', 'Красота и здоровье', 125, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (995, '2016-02-09 00:08:13.677', true, '2016-02-09 00:08:13.677', NULL, NULL, 'Фены', 413, 994);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (996, '2016-02-09 00:08:13.679', true, '2016-02-09 00:08:13.679', NULL, NULL, 'Фены-плойки', 414, 994);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1022, '2016-02-09 00:08:13.748', true, '2016-02-09 00:08:13.748', NULL, NULL, 'ROWENTA', 13130, 1019);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1023, '2016-02-09 00:08:13.751', true, '2016-02-09 00:08:13.751', NULL, NULL, 'Электронные биде', 16073, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1024, '2016-02-09 00:08:13.754', true, '2016-02-09 00:08:13.754', NULL, NULL, 'PANASONIC', 16074, 1023);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1026, '2016-02-09 00:08:14.777', true, '2016-02-09 00:08:14.777', NULL, 'http://www.mechta.kz/templates/img/icon/kompress.gif', 'Авто- аксессуары', 12944, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1027, '2016-02-09 00:08:14.78', true, '2016-02-09 00:08:14.78', NULL, NULL, 'Номерные рамки', 16657, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1028, '2016-02-09 00:08:14.783', true, '2016-02-09 00:08:14.783', NULL, NULL, 'AEP', 16658, 1027);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1029, '2016-02-09 00:08:14.786', true, '2016-02-09 00:08:14.786', NULL, NULL, 'Провода-прикуриватели', 16659, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1030, '2016-02-09 00:08:14.789', true, '2016-02-09 00:08:14.789', NULL, NULL, 'PIECE OF MIND', 16660, 1029);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1044, '2016-02-09 00:08:14.825', true, '2016-02-09 00:08:14.825', NULL, NULL, 'Щетки и скребки для стекол', 16102, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1046, '2016-02-09 00:08:15.701', true, '2016-02-09 00:08:15.701', NULL, 'http://www.mechta.kz/templates/img/icon/actioncam.gif', 'Активный отдых', 10763, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1048, '2016-02-09 00:08:15.707', true, '2016-02-09 00:08:15.707', NULL, NULL, 'SONY', 10766, 1047);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1049, '2016-02-09 00:08:15.709', true, '2016-02-09 00:08:15.709', NULL, NULL, 'GO PRO', 10809, 1047);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1050, '2016-02-09 00:08:15.711', true, '2016-02-09 00:08:15.711', NULL, NULL, 'Дроны для видеосъемки', 16059, 1046);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1051, '2016-02-09 00:08:15.714', true, '2016-02-09 00:08:15.714', NULL, NULL, 'PARROT', 16060, 1050);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1052, '2016-02-09 00:08:15.716', true, '2016-02-09 00:08:15.716', NULL, NULL, 'Аксессуары к экшн камерам', 16124, 1046);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1053, '2016-02-09 00:08:16.635', false, '2016-02-09 00:08:16.635', NULL, 'http://www.mechta.kz/templates/img/icon/kyhonaya-tehnika.gif', 'Бытовая техника', 82, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1055, '2016-02-09 00:08:16.64', false, '2016-02-09 00:08:16.64', NULL, NULL, 'Холодильники, морозильники и оборудование', 233, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1056, '2016-02-09 00:08:16.642', false, '2016-02-09 00:08:16.642', NULL, NULL, 'Газоэлектрические плиты', 236, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1057, '2016-02-09 00:08:16.644', false, '2016-02-09 00:08:16.644', NULL, NULL, 'Посудомоечные машины', 230, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1058, '2016-02-09 00:08:16.645', false, '2016-02-09 00:08:16.646', NULL, NULL, 'Микроволновые печи', 239, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1059, '2016-02-09 00:08:16.647', false, '2016-02-09 00:08:16.647', NULL, NULL, 'Стиральные машины', 241, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1060, '2016-02-09 00:08:16.649', false, '2016-02-09 00:08:16.649', NULL, NULL, 'Сушильные машины', 231, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1061, '2016-02-09 00:08:16.651', false, '2016-02-09 00:08:16.651', NULL, NULL, 'Утюги', 242, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1062, '2016-02-09 00:08:16.653', false, '2016-02-09 00:08:16.653', NULL, NULL, 'Пылесосы', 240, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1063, '2016-02-09 00:08:16.655', false, '2016-02-09 00:08:16.655', NULL, NULL, 'Часы', 234, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1064, '2016-02-09 00:08:16.656', false, '2016-02-09 00:08:16.657', NULL, NULL, 'Фонари', 232, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1065, '2016-02-09 00:08:16.658', false, '2016-02-09 00:08:16.658', NULL, NULL, 'Лампы', 238, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1066, '2016-02-09 00:08:16.66', false, '2016-02-09 00:08:16.66', NULL, NULL, 'Швейные машины', 3465, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1067, '2016-02-09 00:08:16.662', false, '2016-02-09 00:08:16.662', NULL, NULL, 'Лампы настольные', 507, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1068, '2016-02-09 00:08:16.664', false, '2016-02-09 00:08:16.664', NULL, NULL, 'Уход за вещами', 4548, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1069, '2016-02-09 00:08:16.666', false, '2016-02-09 00:08:16.666', NULL, NULL, 'Светильники', 5750, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1070, '2016-02-09 00:08:16.668', false, '2016-02-09 00:08:16.668', NULL, NULL, 'Звонки', 5957, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1071, '2016-02-09 00:08:16.67', false, '2016-02-09 00:08:16.67', NULL, NULL, 'Швабры', 13586, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1072, '2016-02-09 00:08:16.671', false, '2016-02-09 00:08:16.671', NULL, NULL, 'Сейфы', 13677, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1073, '2016-02-09 00:08:16.674', false, '2016-02-09 00:08:16.674', NULL, NULL, 'Аксессуары для бытовой техники', 235, 1054);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1075, '2016-02-09 00:08:16.679', false, '2016-02-09 00:08:16.679', NULL, NULL, 'Чайники', 227, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1076, '2016-02-09 00:08:16.682', false, '2016-02-09 00:08:16.682', NULL, NULL, 'Термопоты', 467, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1077, '2016-02-09 00:08:16.684', false, '2016-02-09 00:08:16.684', NULL, NULL, 'Мультиварки', 222, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1078, '2016-02-09 00:08:16.686', false, '2016-02-09 00:08:16.686', NULL, NULL, 'Аксессуары для мультиварок', 5676, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1079, '2016-02-09 00:08:16.688', false, '2016-02-09 00:08:16.688', NULL, NULL, 'Пароварки', 430, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1080, '2016-02-09 00:08:16.69', false, '2016-02-09 00:08:16.69', NULL, NULL, 'Хлебопечки', 226, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1081, '2016-02-09 00:08:16.692', false, '2016-02-09 00:08:16.692', NULL, NULL, 'Йогуртницы', 5858, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1082, '2016-02-09 00:08:16.693', false, '2016-02-09 00:08:16.693', NULL, NULL, 'Весы кухонные', 216, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1083, '2016-02-09 00:08:16.695', false, '2016-02-09 00:08:16.695', NULL, NULL, 'Водоочистители', 217, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1084, '2016-02-09 00:08:16.697', false, '2016-02-09 00:08:16.697', NULL, NULL, 'Кофемашины', 218, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1085, '2016-02-09 00:08:16.699', false, '2016-02-09 00:08:16.699', NULL, NULL, 'Аксессуары для кофемашин', 6709, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1086, '2016-02-09 00:08:16.706', false, '2016-02-09 00:08:16.706', NULL, NULL, 'Мясорубки', 221, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1087, '2016-02-09 00:08:16.709', false, '2016-02-09 00:08:16.709', NULL, NULL, 'Соковыжималки', 224, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1088, '2016-02-09 00:08:16.711', false, '2016-02-09 00:08:16.711', NULL, NULL, 'Блендеры', 10952, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1089, '2016-02-09 00:08:16.712', false, '2016-02-09 00:08:16.713', NULL, NULL, 'Аксессуары к блендеру', 6679, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1090, '2016-02-09 00:08:16.714', false, '2016-02-09 00:08:16.714', NULL, NULL, 'Кухонные комбайны', 219, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1091, '2016-02-09 00:08:16.716', false, '2016-02-09 00:08:16.716', NULL, NULL, 'Тостеры', 225, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1092, '2016-02-09 00:08:16.718', false, '2016-02-09 00:08:16.718', NULL, NULL, 'Электрогрили', 228, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1093, '2016-02-09 00:08:16.72', false, '2016-02-09 00:08:16.72', NULL, NULL, 'Мороженницы', 10748, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1094, '2016-02-09 00:08:16.722', false, '2016-02-09 00:08:16.722', NULL, NULL, 'Вакуумный упаковщик', 12888, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1095, '2016-02-09 00:08:16.724', false, '2016-02-09 00:08:16.724', NULL, NULL, 'Наборы для домашней газировки', 12920, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1096, '2016-02-09 00:08:16.726', false, '2016-02-09 00:08:16.726', NULL, NULL, 'Мультипечи', 13045, 1074);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1098, '2016-02-09 00:08:16.73', false, '2016-02-09 00:08:16.73', NULL, NULL, 'Встраиваемые варочные поверхности', 203, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1099, '2016-02-09 00:08:16.732', false, '2016-02-09 00:08:16.732', NULL, NULL, 'Встраиваемые декоративные панели', 204, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1100, '2016-02-09 00:08:16.734', false, '2016-02-09 00:08:16.734', NULL, NULL, 'Встраиваемые духовые шкафы', 205, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1101, '2016-02-09 00:08:16.736', false, '2016-02-09 00:08:16.736', NULL, NULL, 'Встраиваемые микроволновые печи', 206, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1102, '2016-02-09 00:08:16.738', false, '2016-02-09 00:08:16.738', NULL, NULL, 'Встраиваемые посудомоечные машины', 207, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1103, '2016-02-09 00:08:16.74', false, '2016-02-09 00:08:16.741', NULL, NULL, 'Встраиваемые стиральные машины', 208, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1104, '2016-02-09 00:08:16.743', false, '2016-02-09 00:08:16.743', NULL, NULL, 'Встраиваемые холодильники', 3903, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1105, '2016-02-09 00:08:16.745', false, '2016-02-09 00:08:16.745', NULL, NULL, 'Вытяжки', 209, 1097);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1106, '2016-02-09 00:08:16.747', false, '2016-02-09 00:08:16.747', NULL, NULL, 'Посуда', 223, 1053);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1107, '2016-02-09 00:08:16.749', false, '2016-02-09 00:08:16.749', NULL, NULL, 'Кухонная посуда', 16360, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1108, '2016-02-09 00:08:16.751', false, '2016-02-09 00:08:16.751', NULL, NULL, 'Столовая посуда и приборы', 16361, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1109, '2016-02-09 00:08:16.753', false, '2016-02-09 00:08:16.753', NULL, NULL, 'Кухонная утварь', 16345, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1110, '2016-02-09 00:08:16.755', false, '2016-02-09 00:08:16.755', NULL, NULL, 'Чай и кофе', 16377, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1111, '2016-02-09 00:08:16.757', false, '2016-02-09 00:08:16.758', NULL, NULL, 'Выпечка', 16385, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1112, '2016-02-09 00:08:16.76', false, '2016-02-09 00:08:16.76', NULL, NULL, 'Ножи и доски', 16380, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1113, '2016-02-09 00:08:16.762', false, '2016-02-09 00:08:16.762', NULL, NULL, 'Хранение', 16389, 1106);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (791, '2016-02-09 00:08:08.687', true, '2016-02-09 00:08:08.687', NULL, 'http://www.mechta.kz/templates/img/icon/pilesosi.gif', 'Техника для дома', 127, 790);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1054, '2016-02-09 00:08:16.638', false, '2016-02-09 00:08:16.638', NULL, 'http://www.mechta.kz/templates/img/icon/pilesosi.gif', 'Техника для дома', 127, 1053);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (811, '2016-02-09 00:08:08.747', true, '2016-02-09 00:08:08.747', NULL, 'http://www.mechta.kz/templates/img/icon/kyhonaya-tehnika.gif', 'Кухонная техника', 126, 790);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1074, '2016-02-09 00:08:16.677', false, '2016-02-09 00:08:16.677', NULL, 'http://www.mechta.kz/templates/img/icon/kyhonaya-tehnika.gif', 'Кухонная техника', 126, 1053);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (834, '2016-02-09 00:08:08.823', true, '2016-02-09 00:08:08.823', NULL, 'http://www.mechta.kz/templates/img/icon/vstraimaya-tehnika.gif', 'Встраиваемая техника', 124, 790);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1097, '2016-02-09 00:08:16.728', false, '2016-02-09 00:08:16.728', NULL, 'http://www.mechta.kz/templates/img/icon/vstraimaya-tehnika.gif', 'Встраиваемая техника', 124, 1053);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1114, '2016-02-09 00:08:17.26', false, '2016-02-09 00:08:17.26', NULL, 'http://www.mechta.kz/templates/img/icon/condition_access.gif', 'Климат техника', 237, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1116, '2016-02-09 00:08:17.264', false, '2016-02-09 00:08:17.264', NULL, NULL, 'Cплит системы', 860, 1115);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1117, '2016-02-09 00:08:17.266', false, '2016-02-09 00:08:17.267', NULL, NULL, 'Мобильные кондиционеры', 3930, 1115);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1118, '2016-02-09 00:08:17.269', false, '2016-02-09 00:08:17.269', NULL, NULL, 'Оконные кондиционеры', 4332, 1115);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1119, '2016-02-09 00:08:17.271', false, '2016-02-09 00:08:17.271', NULL, NULL, 'Кондиционеры колонного типа', 5276, 1115);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1120, '2016-02-09 00:08:17.273', false, '2016-02-09 00:08:17.273', NULL, NULL, 'Кассетные кондиционеры', 13495, 1115);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1122, '2016-02-09 00:08:17.277', false, '2016-02-09 00:08:17.277', NULL, NULL, 'Инсталляция', 6519, 1121);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1123, '2016-02-09 00:08:17.279', false, '2016-02-09 00:08:17.279', NULL, NULL, 'Очистители', 15857, 1121);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1125, '2016-02-09 00:08:17.284', false, '2016-02-09 00:08:17.284', NULL, NULL, 'Маслянные обогреватели', 863, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1126, '2016-02-09 00:08:17.286', false, '2016-02-09 00:08:17.286', NULL, NULL, 'Конвекторы', 862, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1127, '2016-02-09 00:08:17.288', false, '2016-02-09 00:08:17.288', NULL, NULL, 'Тепловентиляторы', 864, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1128, '2016-02-09 00:08:17.289', false, '2016-02-09 00:08:17.289', NULL, NULL, 'Без маслянные обогреватели', 861, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1129, '2016-02-09 00:08:17.292', false, '2016-02-09 00:08:17.292', NULL, NULL, 'Обогреватели керамические', 6691, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1130, '2016-02-09 00:08:17.294', false, '2016-02-09 00:08:17.294', NULL, NULL, 'ИК-обогреватель', 866, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1131, '2016-02-09 00:08:17.296', false, '2016-02-09 00:08:17.296', NULL, NULL, 'Электрические камины', 5859, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1132, '2016-02-09 00:08:17.298', false, '2016-02-09 00:08:17.298', NULL, NULL, 'Тепловые пушки', 3853, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1133, '2016-02-09 00:08:17.3', false, '2016-02-09 00:08:17.3', NULL, NULL, 'Тепловоздушные завесы', 865, 1124);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1135, '2016-02-09 00:08:17.303', false, '2016-02-09 00:08:17.303', NULL, NULL, 'Увлажнители, осушители', 857, 1134);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1136, '2016-02-09 00:08:17.306', false, '2016-02-09 00:08:17.306', NULL, NULL, 'Воздухоочистители и мойка воздуха', 856, 1134);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1137, '2016-02-09 00:08:17.308', false, '2016-02-09 00:08:17.308', NULL, NULL, 'Арома дифузоры', 5847, 1134);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1138, '2016-02-09 00:08:17.31', false, '2016-02-09 00:08:17.31', NULL, NULL, 'Картриджи и аксессуары', 5395, 1134);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1140, '2016-02-09 00:08:17.314', false, '2016-02-09 00:08:17.314', NULL, NULL, 'Термометры', 855, 1139);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1141, '2016-02-09 00:08:17.316', false, '2016-02-09 00:08:17.316', NULL, NULL, 'Метеостанции', 5651, 1139);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1143, '2016-02-09 00:08:17.321', false, '2016-02-09 00:08:17.321', NULL, NULL, 'Водонагреватели накопительные', 858, 1142);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1144, '2016-02-09 00:08:17.323', false, '2016-02-09 00:08:17.323', NULL, NULL, 'Водонагреватели проточные', 859, 1142);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1145, '2016-02-09 00:08:17.325', false, '2016-02-09 00:08:17.325', NULL, NULL, 'Водонагреватели аккумуляционные электрические', 13558, 1142);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1146, '2016-02-09 00:08:17.327', false, '2016-02-09 00:08:17.327', NULL, NULL, 'Аксессуары для водонагревателей', 15841, 1142);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (852, '2016-02-09 00:08:09.914', true, '2016-02-09 00:08:09.914', NULL, 'http://www.mechta.kz/templates/img/icon/condition.gif', 'Кондиционеры', 503, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1115, '2016-02-09 00:08:17.262', false, '2016-02-09 00:08:17.262', NULL, 'http://www.mechta.kz/templates/img/icon/condition.gif', 'Кондиционеры', 503, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (858, '2016-02-09 00:08:09.936', true, '2016-02-09 00:08:09.936', NULL, 'http://www.mechta.kz/templates/img/icon/condition_access.gif', 'Аксессуары для кондиционеров', 6482, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1121, '2016-02-09 00:08:17.275', false, '2016-02-09 00:08:17.275', NULL, 'http://www.mechta.kz/templates/img/icon/condition_access.gif', 'Аксессуары для кондиционеров', 6482, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (884, '2016-02-09 00:08:10.035', true, '2016-02-09 00:08:10.035', NULL, 'http://www.mechta.kz/templates/img/icon/ventilyator.gif', 'Вентиляторы', 499, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1147, '2016-02-09 00:08:17.329', false, '2016-02-09 00:08:17.329', NULL, 'http://www.mechta.kz/templates/img/icon/ventilyator.gif', 'Вентиляторы', 499, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (861, '2016-02-09 00:08:09.946', true, '2016-02-09 00:08:09.946', NULL, 'http://www.mechta.kz/templates/img/icon/obogrevat.gif', 'Обогреватели', 504, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1124, '2016-02-09 00:08:17.281', false, '2016-02-09 00:08:17.281', NULL, 'http://www.mechta.kz/templates/img/icon/obogrevat.gif', 'Обогреватели', 504, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (871, '2016-02-09 00:08:09.981', true, '2016-02-09 00:08:09.981', NULL, 'http://www.mechta.kz/templates/img/icon/uvlazhnitel.gif', 'Увлажнители, осушители, воздухоочистители', 501, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1134, '2016-02-09 00:08:17.301', false, '2016-02-09 00:08:17.301', NULL, 'http://www.mechta.kz/templates/img/icon/uvlazhnitel.gif', 'Увлажнители, осушители, воздухоочистители', 501, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (876, '2016-02-09 00:08:10', true, '2016-02-09 00:08:10', NULL, 'http://www.mechta.kz/templates/img/icon/pogodnyi.gif', 'Погодные измерительные приборы', 500, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1139, '2016-02-09 00:08:17.312', false, '2016-02-09 00:08:17.312', NULL, 'http://www.mechta.kz/templates/img/icon/pogodnyi.gif', 'Погодные измерительные приборы', 500, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (885, '2016-02-09 00:08:10.039', true, '2016-02-09 00:08:10.039', NULL, 'http://www.mechta.kz/templates/img/icon/cooler.gif', 'Кулеры', 4370, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1148, '2016-02-09 00:08:17.331', false, '2016-02-09 00:08:17.331', NULL, 'http://www.mechta.kz/templates/img/icon/cooler.gif', 'Кулеры', 4370, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (886, '2016-02-09 00:08:10.043', true, '2016-02-09 00:08:10.043', NULL, 'http://www.mechta.kz/templates/img/icon/sushilka.gif', 'Сушилка для рук/обуви', 229, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1149, '2016-02-09 00:08:17.333', false, '2016-02-09 00:08:17.333', NULL, 'http://www.mechta.kz/templates/img/icon/sushilka.gif', 'Сушилка для рук/обуви', 229, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (879, '2016-02-09 00:08:10.014', true, '2016-02-09 00:08:10.014', NULL, 'http://www.mechta.kz/templates/img/icon/vodonagrev.gif', 'Водонагреватели', 502, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1142, '2016-02-09 00:08:17.319', false, '2016-02-09 00:08:17.319', NULL, 'http://www.mechta.kz/templates/img/icon/vodonagrev.gif', 'Водонагреватели', 502, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (887, '2016-02-09 00:08:10.047', true, '2016-02-09 00:08:10.047', NULL, 'http://www.mechta.kz/templates/img/icon/electronagrev.gif', 'Электронагреватели', 4774, 851);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1150, '2016-02-09 00:08:17.335', false, '2016-02-09 00:08:17.335', NULL, 'http://www.mechta.kz/templates/img/icon/electronagrev.gif', 'Электронагреватели', 4774, 1114);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1151, '2016-02-09 00:08:17.879', false, '2016-02-09 00:08:17.879', NULL, 'http://www.mechta.kz/templates/img/icon/padcomp.jpg', 'Планшеты, Ноутбуки, Компьютеры', 83, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1153, '2016-02-09 00:08:17.884', false, '2016-02-09 00:08:17.884', NULL, NULL, 'Ноутбуки', 259, 1152);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1154, '2016-02-09 00:08:17.886', false, '2016-02-09 00:08:17.886', NULL, NULL, 'Ультрабуки', 5505, 1152);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1156, '2016-02-09 00:08:17.891', false, '2016-02-09 00:08:17.891', NULL, NULL, 'Принтеры', 265, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1157, '2016-02-09 00:08:17.893', false, '2016-02-09 00:08:17.893', NULL, NULL, 'Многофункциональные устройства', 264, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1158, '2016-02-09 00:08:17.895', false, '2016-02-09 00:08:17.895', NULL, NULL, 'Расходные материалы', 253, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1159, '2016-02-09 00:08:17.897', false, '2016-02-09 00:08:17.897', NULL, NULL, 'Программное обеспечение', 261, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1160, '2016-02-09 00:08:17.899', false, '2016-02-09 00:08:17.899', NULL, NULL, 'Внешние оптические приводы DVD', 570, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1161, '2016-02-09 00:08:17.901', false, '2016-02-09 00:08:17.901', NULL, NULL, 'Модемы', 571, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1162, '2016-02-09 00:08:17.903', false, '2016-02-09 00:08:17.903', NULL, NULL, 'Бумага', 4891, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1163, '2016-02-09 00:08:17.905', false, '2016-02-09 00:08:17.905', NULL, NULL, 'Калькуляторы', 4892, 1155);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1165, '2016-02-09 00:08:17.909', false, '2016-02-09 00:08:17.909', NULL, NULL, 'WEB камеры', 243, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1166, '2016-02-09 00:08:17.912', false, '2016-02-09 00:08:17.912', NULL, NULL, 'Аксессуары для ноутбуков и планшетов', 244, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1167, '2016-02-09 00:08:17.914', false, '2016-02-09 00:08:17.914', NULL, NULL, 'Медианосители', 246, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1168, '2016-02-09 00:08:17.917', false, '2016-02-09 00:08:17.917', NULL, NULL, 'Флэш накопители', 247, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1169, '2016-02-09 00:08:17.919', false, '2016-02-09 00:08:17.919', NULL, NULL, 'Внешние жесткие диски', 248, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1170, '2016-02-09 00:08:17.921', false, '2016-02-09 00:08:17.921', NULL, NULL, 'Карты памяти и ридеры', 249, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1171, '2016-02-09 00:08:17.923', false, '2016-02-09 00:08:17.923', NULL, NULL, 'Клавиатуры', 250, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1172, '2016-02-09 00:08:17.925', false, '2016-02-09 00:08:17.925', NULL, NULL, 'Акустические системы', 251, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1173, '2016-02-09 00:08:17.928', false, '2016-02-09 00:08:17.928', NULL, NULL, 'Мыши', 252, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1174, '2016-02-09 00:08:17.93', false, '2016-02-09 00:08:17.93', NULL, NULL, 'Сумки компьютерные', 254, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1175, '2016-02-09 00:08:17.932', false, '2016-02-09 00:08:17.932', NULL, NULL, 'Фильтры и UPS', 255, 1164);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1177, '2016-02-09 00:08:17.936', false, '2016-02-09 00:08:17.936', NULL, NULL, 'Мультимедийные моноблоки', 3962, 1176);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (915, '2016-02-09 00:08:10.583', true, '2016-02-09 00:08:10.583', NULL, 'http://www.mechta.kz/templates/img/icon/pads.jpg', 'Планшеты', 260, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1178, '2016-02-09 00:08:17.938', false, '2016-02-09 00:08:17.938', NULL, 'http://www.mechta.kz/templates/img/icon/pads.jpg', 'Планшеты', 260, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (916, '2016-02-09 00:08:10.586', true, '2016-02-09 00:08:10.586', NULL, 'http://www.mechta.kz/templates/img/icon/padcomp.jpg', 'Планшетные компьютеры', 5659, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1179, '2016-02-09 00:08:17.94', false, '2016-02-09 00:08:17.94', NULL, 'http://www.mechta.kz/templates/img/icon/padcomp.jpg', 'Планшетные компьютеры', 5659, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (917, '2016-02-09 00:08:10.59', true, '2016-02-09 00:08:10.59', NULL, 'http://www.mechta.kz/templates/img/icon/electro_book.gif', 'Электронные книги', 3897, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1180, '2016-02-09 00:08:17.942', false, '2016-02-09 00:08:17.942', NULL, 'http://www.mechta.kz/templates/img/icon/electro_book.gif', 'Электронные книги', 3897, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (889, '2016-02-09 00:08:10.487', true, '2016-02-09 00:08:10.488', NULL, 'http://www.mechta.kz/templates/img/icon/noytbyki.gif', 'Ноутбуки', 109, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1152, '2016-02-09 00:08:17.882', false, '2016-02-09 00:08:17.882', NULL, 'http://www.mechta.kz/templates/img/icon/noytbyki.gif', 'Ноутбуки', 109, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (892, '2016-02-09 00:08:10.498', true, '2016-02-09 00:08:10.498', NULL, 'http://www.mechta.kz/templates/img/icon/klavi-mishki.gif', 'Периферия', 110, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1155, '2016-02-09 00:08:17.888', false, '2016-02-09 00:08:17.888', NULL, 'http://www.mechta.kz/templates/img/icon/klavi-mishki.gif', 'Периферия', 110, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (901, '2016-02-09 00:08:10.529', true, '2016-02-09 00:08:10.529', NULL, 'http://www.mechta.kz/templates/img/icon/kompyternie-aksesyari.gif', 'Компьютерные аксессуары', 107, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1164, '2016-02-09 00:08:17.907', false, '2016-02-09 00:08:17.907', NULL, 'http://www.mechta.kz/templates/img/icon/kompyternie-aksesyari.gif', 'Компьютерные аксессуары', 107, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (913, '2016-02-09 00:08:10.575', true, '2016-02-09 00:08:10.575', NULL, 'http://www.mechta.kz/templates/img/icon/kompyteri.gif', 'Персональные компьютеры', 111, 888);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1176, '2016-02-09 00:08:17.934', false, '2016-02-09 00:08:17.934', NULL, 'http://www.mechta.kz/templates/img/icon/kompyteri.gif', 'Персональные компьютеры', 111, 1151);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1181, '2016-02-09 00:08:18.463', false, '2016-02-09 00:08:18.463', NULL, 'http://www.mechta.kz/templates/img/icon/tymbi.gif', 'Телевизоры, Aудио, Видео', 10773, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1183, '2016-02-09 00:08:18.468', false, '2016-02-09 00:08:18.468', NULL, NULL, 'LED (Лед телевизоры)', 96, 1182);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1184, '2016-02-09 00:08:18.471', false, '2016-02-09 00:08:18.471', NULL, NULL, 'LED 4K (Телевизоры 4К)', 13142, 1182);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1185, '2016-02-09 00:08:18.473', false, '2016-02-09 00:08:18.473', NULL, NULL, 'OLED (Олед телевизоры)', 5942, 1182);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1187, '2016-02-09 00:08:18.477', false, '2016-02-09 00:08:18.477', NULL, NULL, 'Кронштейны для ТВ', 177, 1186);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1188, '2016-02-09 00:08:18.479', false, '2016-02-09 00:08:18.479', NULL, NULL, 'Тумбы', 178, 1186);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1190, '2016-02-09 00:08:18.483', false, '2016-02-09 00:08:18.483', NULL, NULL, 'LG', 5479, 1189);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1191, '2016-02-09 00:08:18.485', false, '2016-02-09 00:08:18.485', NULL, NULL, 'SAMSUNG', 5481, 1189);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1193, '2016-02-09 00:08:18.49', false, '2016-02-09 00:08:18.49', NULL, NULL, 'Магнитолы', 118, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1194, '2016-02-09 00:08:18.492', false, '2016-02-09 00:08:18.492', NULL, NULL, 'Музыкальные центры', 119, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1195, '2016-02-09 00:08:18.494', false, '2016-02-09 00:08:18.494', NULL, NULL, 'Аудиоплееры', 122, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1196, '2016-02-09 00:08:18.499', false, '2016-02-09 00:08:18.499', NULL, NULL, 'Наушники', 123, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1197, '2016-02-09 00:08:18.501', false, '2016-02-09 00:08:18.501', NULL, NULL, 'Музыкальные инструменты', 10774, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1198, '2016-02-09 00:08:18.503', false, '2016-02-09 00:08:18.503', NULL, NULL, 'Автомобильное аудио', 120, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1199, '2016-02-09 00:08:18.505', false, '2016-02-09 00:08:18.505', NULL, NULL, 'Видеопроигрыватели', 115, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1200, '2016-02-09 00:08:18.507', false, '2016-02-09 00:08:18.507', NULL, NULL, 'Домашние кинотеатры', 116, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1201, '2016-02-09 00:08:18.509', false, '2016-02-09 00:08:18.509', NULL, NULL, 'Диктофоны', 94, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1202, '2016-02-09 00:08:18.511', false, '2016-02-09 00:08:18.511', NULL, NULL, 'Аксессуары для аудио-видео', 153, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1203, '2016-02-09 00:08:18.513', false, '2016-02-09 00:08:18.513', NULL, NULL, 'Кабели/переходники', 154, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1204, '2016-02-09 00:08:18.515', false, '2016-02-09 00:08:18.515', NULL, NULL, 'Портативные колонки', 5379, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1205, '2016-02-09 00:08:18.517', false, '2016-02-09 00:08:18.517', NULL, NULL, 'Проекторы', 6672, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1283, '2016-02-09 00:08:20.783', false, '2016-02-09 00:08:20.783', NULL, NULL, 'BODYKRAFT', 5745, 1282);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1206, '2016-02-09 00:08:18.519', false, '2016-02-09 00:08:18.519', NULL, NULL, 'Акустика', 13543, 1192);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (919, '2016-02-09 00:08:11.021', true, '2016-02-09 00:08:11.021', NULL, 'http://www.mechta.kz/templates/img/tele.gif', 'Телевизоры', 13467, 918);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1182, '2016-02-09 00:08:18.466', false, '2016-02-09 00:08:18.466', NULL, 'http://www.mechta.kz/templates/img/tele.gif', 'Телевизоры', 13467, 1181);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (923, '2016-02-09 00:08:11.036', true, '2016-02-09 00:08:11.036', NULL, 'http://www.mechta.kz/templates/img/icon/tymbi.gif', 'Тумбы и кронштейны', 99, 918);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1186, '2016-02-09 00:08:18.475', false, '2016-02-09 00:08:18.475', NULL, 'http://www.mechta.kz/templates/img/icon/tymbi.gif', 'Тумбы и кронштейны', 99, 1181);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (926, '2016-02-09 00:08:11.046', true, '2016-02-09 00:08:11.046', NULL, 'http://www.mechta.kz/templates/img/icon/acsesyari_tv.gif', 'Аксессуары к ТВ', 4760, 918);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1189, '2016-02-09 00:08:18.481', false, '2016-02-09 00:08:18.481', NULL, 'http://www.mechta.kz/templates/img/icon/acsesyari_tv.gif', 'Аксессуары к ТВ', 4760, 1181);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (929, '2016-02-09 00:08:11.057', true, '2016-02-09 00:08:11.057', NULL, 'http://www.mechta.kz/templates/img/aydio_video.jpg', 'Аудио, Видео', 77, 918);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1192, '2016-02-09 00:08:18.488', false, '2016-02-09 00:08:18.488', NULL, 'http://www.mechta.kz/templates/img/aydio_video.jpg', 'Аудио, Видео', 77, 1181);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1207, '2016-02-09 00:08:19.033', false, '2016-02-09 00:08:19.033', NULL, 'http://www.mechta.kz/templates/img/icon/accessmob.jpg', 'Телефоны', 80, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1209, '2016-02-09 00:08:19.042', false, '2016-02-09 00:08:19.042', NULL, NULL, 'Смартфоны', 5100, 1208);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1210, '2016-02-09 00:08:19.044', false, '2016-02-09 00:08:19.044', NULL, NULL, 'Телефоны', 5106, 1208);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1212, '2016-02-09 00:08:19.049', false, '2016-02-09 00:08:19.049', NULL, NULL, 'Зарядные устройства для мобильных телефонов', 334, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1213, '2016-02-09 00:08:19.051', false, '2016-02-09 00:08:19.051', NULL, NULL, 'Зарядные устройства в автомобиль', 335, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1214, '2016-02-09 00:08:19.053', false, '2016-02-09 00:08:19.053', NULL, NULL, 'Защитные плёнки для мобильных телефонов', 336, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1215, '2016-02-09 00:08:19.056', false, '2016-02-09 00:08:19.056', NULL, NULL, 'Кабели для мобильных телефонов', 337, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1216, '2016-02-09 00:08:19.059', false, '2016-02-09 00:08:19.059', NULL, NULL, 'Чехлы для мобильных телефонов', 338, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1217, '2016-02-09 00:08:19.061', false, '2016-02-09 00:08:19.061', NULL, NULL, 'Беспроводные гарнитуры Bluetooth', 3900, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1218, '2016-02-09 00:08:19.063', false, '2016-02-09 00:08:19.063', NULL, NULL, 'Держатели для сотовых телефонов', 4272, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1219, '2016-02-09 00:08:19.065', false, '2016-02-09 00:08:19.065', NULL, NULL, 'Проводные гарнитуры для мобильных телефонов', 4364, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1220, '2016-02-09 00:08:19.067', false, '2016-02-09 00:08:19.067', NULL, NULL, 'Адаптеры', 5542, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1221, '2016-02-09 00:08:19.07', false, '2016-02-09 00:08:19.07', NULL, NULL, 'Смарт часы', 5893, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1222, '2016-02-09 00:08:19.073', false, '2016-02-09 00:08:19.073', NULL, NULL, 'Моноподы', 10836, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1223, '2016-02-09 00:08:19.075', false, '2016-02-09 00:08:19.075', NULL, NULL, 'Очки виртуальной реальности', 20095, 1211);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1225, '2016-02-09 00:08:19.079', false, '2016-02-09 00:08:19.079', NULL, NULL, 'Радионяни', 4275, 1224);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1226, '2016-02-09 00:08:19.081', false, '2016-02-09 00:08:19.081', NULL, NULL, 'Радиостанции', 5684, 1224);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1227, '2016-02-09 00:08:19.084', false, '2016-02-09 00:08:19.084', NULL, NULL, 'Аксессуары для радиостанций', 16674, 1224);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1229, '2016-02-09 00:08:19.088', false, '2016-02-09 00:08:19.088', NULL, NULL, 'Радиотелефоны DECT', 183, 1228);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1230, '2016-02-09 00:08:19.091', false, '2016-02-09 00:08:19.091', NULL, NULL, 'Дополнительные радиотрубки DECT', 182, 1228);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1231, '2016-02-09 00:08:19.093', false, '2016-02-09 00:08:19.093', NULL, NULL, 'Телефоны проводные', 184, 1228);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (945, '2016-02-09 00:08:11.552', true, '2016-02-09 00:08:11.552', NULL, 'http://www.mechta.kz/templates/img/icon/mobile_telefon.gif', 'Мобильные телефоны', 102, 944);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1208, '2016-02-09 00:08:19.036', false, '2016-02-09 00:08:19.037', NULL, 'http://www.mechta.kz/templates/img/icon/mobile_telefon.gif', 'Мобильные телефоны', 102, 1207);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (948, '2016-02-09 00:08:11.56', true, '2016-02-09 00:08:11.56', NULL, 'http://www.mechta.kz/templates/img/icon/accessmob.jpg', 'Аксессуары к мобильным телефонам', 187, 944);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1211, '2016-02-09 00:08:19.047', false, '2016-02-09 00:08:19.047', NULL, 'http://www.mechta.kz/templates/img/icon/accessmob.jpg', 'Аксессуары к мобильным телефонам', 187, 1207);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (961, '2016-02-09 00:08:11.594', true, '2016-02-09 00:08:11.594', NULL, 'http://www.mechta.kz/templates/img/icon/radiostation.gif', 'Радиостанции', 4274, 944);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1224, '2016-02-09 00:08:19.077', false, '2016-02-09 00:08:19.077', NULL, 'http://www.mechta.kz/templates/img/icon/radiostation.gif', 'Радиостанции', 4274, 1207);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (965, '2016-02-09 00:08:11.604', true, '2016-02-09 00:08:11.604', NULL, 'http://www.mechta.kz/templates/img/icon/domashnie_telefon.gif', 'Домашние телефоны', 101, 944);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1228, '2016-02-09 00:08:19.085', false, '2016-02-09 00:08:19.085', NULL, 'http://www.mechta.kz/templates/img/icon/domashnie_telefon.gif', 'Домашние телефоны', 101, 1207);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1232, '2016-02-09 00:08:19.595', false, '2016-02-09 00:08:19.595', NULL, 'http://www.mechta.kz/templates/img/icon/fotoframe.gif', 'Фото, Видеокамеры, Оптика', 81, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1234, '2016-02-09 00:08:19.599', false, '2016-02-09 00:08:19.599', NULL, NULL, 'Зеркальные фотоаппараты', 201, 1233);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1235, '2016-02-09 00:08:19.601', false, '2016-02-09 00:08:19.601', NULL, NULL, 'Гибридные фотоаппараты', 200, 1233);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1236, '2016-02-09 00:08:19.604', false, '2016-02-09 00:08:19.604', NULL, NULL, 'Компактные фотоаппараты', 202, 1233);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1238, '2016-02-09 00:08:19.608', false, '2016-02-09 00:08:19.608', NULL, NULL, 'Фоторамки', 188, 1237);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1240, '2016-02-09 00:08:19.613', false, '2016-02-09 00:08:19.613', NULL, NULL, 'Видеокамеры на Flash носителях', 198, 1239);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1242, '2016-02-09 00:08:19.617', false, '2016-02-09 00:08:19.617', NULL, NULL, 'Аксессуары для видеокамер', 194, 1241);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1243, '2016-02-09 00:08:19.619', false, '2016-02-09 00:08:19.619', NULL, NULL, 'Аксессуары для гибридных фотоаппаратов', 195, 1241);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1244, '2016-02-09 00:08:19.621', false, '2016-02-09 00:08:19.621', NULL, NULL, 'Аксессуары для зеркальных фотоаппаратов', 196, 1241);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1284, '2016-02-09 00:08:20.786', false, '2016-02-09 00:08:20.786', NULL, NULL, 'POLARIS', 6417, 1282);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1245, '2016-02-09 00:08:19.623', false, '2016-02-09 00:08:19.623', NULL, NULL, 'Аксессуары для компактных фотоаппаратов', 197, 1241);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (970, '2016-02-09 00:08:12.155', true, '2016-02-09 00:08:12.155', NULL, 'http://www.mechta.kz/templates/img/icon/foto.gif', 'Цифровые фотоаппараты', 106, 969);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1233, '2016-02-09 00:08:19.597', false, '2016-02-09 00:08:19.597', NULL, 'http://www.mechta.kz/templates/img/icon/foto.gif', 'Цифровые фотоаппараты', 106, 1232);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (974, '2016-02-09 00:08:12.166', true, '2016-02-09 00:08:12.166', NULL, 'http://www.mechta.kz/templates/img/icon/fotoframe.gif', 'Фоторамки', 103, 969);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1237, '2016-02-09 00:08:19.606', false, '2016-02-09 00:08:19.606', NULL, 'http://www.mechta.kz/templates/img/icon/fotoframe.gif', 'Фоторамки', 103, 1232);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (976, '2016-02-09 00:08:12.171', true, '2016-02-09 00:08:12.171', NULL, 'http://www.mechta.kz/templates/img/icon/video.gif', 'Видеокамеры', 105, 969);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1239, '2016-02-09 00:08:19.611', false, '2016-02-09 00:08:19.611', NULL, 'http://www.mechta.kz/templates/img/icon/video.gif', 'Видеокамеры', 105, 1232);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (978, '2016-02-09 00:08:12.177', true, '2016-02-09 00:08:12.177', NULL, 'http://www.mechta.kz/templates/img/icon/acsesyari_video.gif', 'Аксессуары для фото и видео', 104, 969);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1241, '2016-02-09 00:08:19.615', false, '2016-02-09 00:08:19.615', NULL, 'http://www.mechta.kz/templates/img/icon/acsesyari_video.gif', 'Аксессуары для фото и видео', 104, 1232);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1246, '2016-02-09 00:08:20.17', false, '2016-02-09 00:08:20.17', NULL, 'http://www.mechta.kz/templates/img/icon/g.jpg', 'Игры, Приставки, Игрушки', 76, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1248, '2016-02-09 00:08:20.175', false, '2016-02-09 00:08:20.175', NULL, NULL, 'Автомобили', 13566, 1247);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1249, '2016-02-09 00:08:20.177', false, '2016-02-09 00:08:20.177', NULL, NULL, 'Дроны', 13571, 1247);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1250, '2016-02-09 00:08:20.18', false, '2016-02-09 00:08:20.18', NULL, NULL, 'Вертолеты', 13574, 1247);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1251, '2016-02-09 00:08:20.182', false, '2016-02-09 00:08:20.182', NULL, NULL, 'Танки', 16115, 1247);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (989, '2016-02-09 00:08:13.162', true, '2016-02-09 00:08:13.162', NULL, 'http://www.mechta.kz/templates/img/icon/g_station.gif', 'Игровые приставки', 3882, 983);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1252, '2016-02-09 00:08:20.184', false, '2016-02-09 00:08:20.184', NULL, 'http://www.mechta.kz/templates/img/icon/g_station.gif', 'Игровые приставки', 3882, 1246);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (990, '2016-02-09 00:08:13.164', true, '2016-02-09 00:08:13.164', NULL, 'http://www.mechta.kz/templates/img/icon/g.jpg', 'Игры для игровых приставок', 93, 983);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1253, '2016-02-09 00:08:20.186', false, '2016-02-09 00:08:20.186', NULL, 'http://www.mechta.kz/templates/img/icon/g.jpg', 'Игры для игровых приставок', 93, 1246);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (991, '2016-02-09 00:08:13.167', true, '2016-02-09 00:08:13.167', NULL, 'http://www.mechta.kz/templates/img/icon/acsesyari_pristavki_pc.gif', 'Аксессуары для игровых приставок и PC', 92, 983);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1254, '2016-02-09 00:08:20.188', false, '2016-02-09 00:08:20.188', NULL, 'http://www.mechta.kz/templates/img/icon/acsesyari_pristavki_pc.gif', 'Аксессуары для игровых приставок и PC', 92, 1246);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (992, '2016-02-09 00:08:13.17', true, '2016-02-09 00:08:13.17', NULL, 'http://www.mechta.kz/templates/img/igrushki.gif', 'Детские игрушки', 6520, 983);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1255, '2016-02-09 00:08:20.19', false, '2016-02-09 00:08:20.19', NULL, 'http://www.mechta.kz/templates/img/igrushki.gif', 'Детские игрушки', 6520, 1246);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (984, '2016-02-09 00:08:13.148', true, '2016-02-09 00:08:13.148', NULL, 'http://www.mechta.kz/templates/img/icon/igrovye_manipulatory.gif', 'Радиоуправляемые игрушки', 13565, 983);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1247, '2016-02-09 00:08:20.173', false, '2016-02-09 00:08:20.173', NULL, 'http://www.mechta.kz/templates/img/icon/igrovye_manipulatory.gif', 'Радиоуправляемые игрушки', 13565, 1246);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1256, '2016-02-09 00:08:20.719', false, '2016-02-09 00:08:20.719', NULL, 'http://www.mechta.kz/templates/img/icon/strizhka.gif', 'Красота и здоровье', 125, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1258, '2016-02-09 00:08:20.724', false, '2016-02-09 00:08:20.724', NULL, NULL, 'Фены', 413, 1257);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1259, '2016-02-09 00:08:20.727', false, '2016-02-09 00:08:20.727', NULL, NULL, 'Фены-плойки', 414, 1257);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1260, '2016-02-09 00:08:20.729', false, '2016-02-09 00:08:20.729', NULL, NULL, 'Плойки', 412, 1257);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1261, '2016-02-09 00:08:20.731', false, '2016-02-09 00:08:20.731', NULL, NULL, 'Выпрямители волос', 411, 1257);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1262, '2016-02-09 00:08:20.733', false, '2016-02-09 00:08:20.733', NULL, NULL, 'Волюмайзеры', 5878, 1257);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1263, '2016-02-09 00:08:20.735', false, '2016-02-09 00:08:20.735', NULL, NULL, 'Электробигуди', 415, 1257);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1265, '2016-02-09 00:08:20.74', false, '2016-02-09 00:08:20.74', NULL, NULL, 'Машинки для стрижки волос', 409, 1264);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1266, '2016-02-09 00:08:20.742', false, '2016-02-09 00:08:20.742', NULL, NULL, 'Триммер для стрижки бороды и ухо/нос', 410, 1264);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1267, '2016-02-09 00:08:20.745', false, '2016-02-09 00:08:20.745', NULL, NULL, 'Триммеры для тела', 5910, 1264);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1269, '2016-02-09 00:08:20.751', false, '2016-02-09 00:08:20.751', NULL, NULL, 'Маникюрные наборы', 4347, 1268);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1270, '2016-02-09 00:08:20.754', false, '2016-02-09 00:08:20.754', NULL, NULL, 'Электропилки', 13644, 1268);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1272, '2016-02-09 00:08:20.759', false, '2016-02-09 00:08:20.759', NULL, NULL, 'Электрические зубные щётки', 408, 1271);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1273, '2016-02-09 00:08:20.761', false, '2016-02-09 00:08:20.761', NULL, NULL, 'Насадки для эл.зубных щёток', 407, 1271);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1275, '2016-02-09 00:08:20.766', false, '2016-02-09 00:08:20.766', NULL, NULL, 'Электробритвы', 418, 1274);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1276, '2016-02-09 00:08:20.768', false, '2016-02-09 00:08:20.768', NULL, NULL, 'Сетки электробритв', 5384, 1274);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1277, '2016-02-09 00:08:20.77', false, '2016-02-09 00:08:20.77', NULL, NULL, 'Чистящие средства для электробритв', 417, 1274);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1278, '2016-02-09 00:08:20.773', false, '2016-02-09 00:08:20.773', NULL, NULL, 'Лосьоны для бритья', 13658, 1274);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1280, '2016-02-09 00:08:20.777', false, '2016-02-09 00:08:20.777', NULL, NULL, 'Эпиляторы', 419, 1279);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1281, '2016-02-09 00:08:20.779', false, '2016-02-09 00:08:20.779', NULL, NULL, 'Сетки и режущие блоки для эпиляторов', 5269, 1279);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1282, '2016-02-09 00:08:20.781', false, '2016-02-09 00:08:20.781', NULL, NULL, 'Массажёры', 5687, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1285, '2016-02-09 00:08:20.788', false, '2016-02-09 00:08:20.788', NULL, NULL, 'ROWENTA', 13130, 1282);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1286, '2016-02-09 00:08:20.791', false, '2016-02-09 00:08:20.791', NULL, NULL, 'Электронные биде', 16073, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1287, '2016-02-09 00:08:20.793', false, '2016-02-09 00:08:20.793', NULL, NULL, 'PANASONIC', 16074, 1286);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (994, '2016-02-09 00:08:13.674', true, '2016-02-09 00:08:13.674', NULL, 'http://www.mechta.kz/templates/img/icon/pribor_ukladki.gif', 'Приборы для укладки волос', 213, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1257, '2016-02-09 00:08:20.722', false, '2016-02-09 00:08:20.722', NULL, 'http://www.mechta.kz/templates/img/icon/pribor_ukladki.gif', 'Приборы для укладки волос', 213, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1001, '2016-02-09 00:08:13.693', true, '2016-02-09 00:08:13.693', NULL, 'http://www.mechta.kz/templates/img/icon/strizhka.gif', 'Для стрижки волос', 212, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1264, '2016-02-09 00:08:20.737', false, '2016-02-09 00:08:20.737', NULL, 'http://www.mechta.kz/templates/img/icon/strizhka.gif', 'Для стрижки волос', 212, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1005, '2016-02-09 00:08:13.703', true, '2016-02-09 00:08:13.703', NULL, 'http://www.mechta.kz/templates/img/icon/cosmetics.gif', 'Косметические приборы', 4346, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1268, '2016-02-09 00:08:20.748', false, '2016-02-09 00:08:20.748', NULL, 'http://www.mechta.kz/templates/img/icon/cosmetics.gif', 'Косметические приборы', 4346, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1008, '2016-02-09 00:08:13.711', true, '2016-02-09 00:08:13.711', NULL, 'http://www.mechta.kz/templates/img/icon/zubmye_shetki.gif', 'Электрические зубные щётки', 211, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1271, '2016-02-09 00:08:20.757', false, '2016-02-09 00:08:20.757', NULL, 'http://www.mechta.kz/templates/img/icon/zubmye_shetki.gif', 'Электрические зубные щётки', 211, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1011, '2016-02-09 00:08:13.72', true, '2016-02-09 00:08:13.72', NULL, 'http://www.mechta.kz/templates/img/icon/britvy.gif', 'Электробритвы', 214, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1274, '2016-02-09 00:08:20.764', false, '2016-02-09 00:08:20.764', NULL, 'http://www.mechta.kz/templates/img/icon/britvy.gif', 'Электробритвы', 214, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1016, '2016-02-09 00:08:13.732', true, '2016-02-09 00:08:13.732', NULL, 'http://www.mechta.kz/templates/img/icon/epilator.gif', 'Эпиляторы', 215, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1279, '2016-02-09 00:08:20.775', false, '2016-02-09 00:08:20.775', NULL, 'http://www.mechta.kz/templates/img/icon/epilator.gif', 'Эпиляторы', 215, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1025, '2016-02-09 00:08:13.757', true, '2016-02-09 00:08:13.757', NULL, 'http://www.mechta.kz/templates/img/icon/vesy.gif', 'Весы напольные', 210, 993);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1288, '2016-02-09 00:08:20.796', false, '2016-02-09 00:08:20.796', NULL, 'http://www.mechta.kz/templates/img/icon/vesy.gif', 'Весы напольные', 210, 1256);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1289, '2016-02-09 00:08:21.429', false, '2016-02-09 00:08:21.429', NULL, 'http://www.mechta.kz/templates/img/icon/kompress.gif', 'Авто- аксессуары', 12944, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1290, '2016-02-09 00:08:21.431', false, '2016-02-09 00:08:21.431', NULL, NULL, 'Номерные рамки', 16657, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1291, '2016-02-09 00:08:21.434', false, '2016-02-09 00:08:21.434', NULL, NULL, 'AEP', 16658, 1290);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1292, '2016-02-09 00:08:21.436', false, '2016-02-09 00:08:21.436', NULL, NULL, 'Провода-прикуриватели', 16659, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1293, '2016-02-09 00:08:21.44', false, '2016-02-09 00:08:21.44', NULL, NULL, 'PIECE OF MIND', 16660, 1292);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1307, '2016-02-09 00:08:21.469', false, '2016-02-09 00:08:21.469', NULL, NULL, 'Щетки и скребки для стекол', 16102, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1034, '2016-02-09 00:08:14.799', true, '2016-02-09 00:08:14.799', NULL, 'http://www.mechta.kz/templates/img/icon/kresla.gif', 'Автокресла', 12945, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1297, '2016-02-09 00:08:21.449', false, '2016-02-09 00:08:21.449', NULL, 'http://www.mechta.kz/templates/img/icon/kresla.gif', 'Автокресла', 12945, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1036, '2016-02-09 00:08:14.803', true, '2016-02-09 00:08:14.803', NULL, 'http://www.mechta.kz/templates/img/icon/kompress.gif', 'Автомобильные компрессоры', 13016, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1299, '2016-02-09 00:08:21.453', false, '2016-02-09 00:08:21.453', NULL, 'http://www.mechta.kz/templates/img/icon/kompress.gif', 'Автомобильные компрессоры', 13016, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1037, '2016-02-09 00:08:14.806', true, '2016-02-09 00:08:14.806', NULL, 'http://www.mechta.kz/templates/img/icon/polirol.gif', 'Автополироли', 13017, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1300, '2016-02-09 00:08:21.455', false, '2016-02-09 00:08:21.455', NULL, 'http://www.mechta.kz/templates/img/icon/polirol.gif', 'Автополироли', 13017, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1038, '2016-02-09 00:08:14.809', true, '2016-02-09 00:08:14.809', NULL, 'http://www.mechta.kz/templates/img/icon/aroma.gif', 'Ароматизаторы воздуха', 13019, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1301, '2016-02-09 00:08:21.457', false, '2016-02-09 00:08:21.457', NULL, 'http://www.mechta.kz/templates/img/icon/aroma.gif', 'Ароматизаторы воздуха', 13019, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1039, '2016-02-09 00:08:14.812', true, '2016-02-09 00:08:14.812', NULL, 'http://www.mechta.kz/templates/img/icon/buksir.gif', 'Буксировочные тросы', 13020, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1302, '2016-02-09 00:08:21.459', false, '2016-02-09 00:08:21.46', NULL, 'http://www.mechta.kz/templates/img/icon/buksir.gif', 'Буксировочные тросы', 13020, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1035, '2016-02-09 00:08:14.801', true, '2016-02-09 00:08:14.801', NULL, 'http://www.mechta.kz/templates/img/icon/busters.gif', 'Бустеры', 12946, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1298, '2016-02-09 00:08:21.451', false, '2016-02-09 00:08:21.451', NULL, 'http://www.mechta.kz/templates/img/icon/busters.gif', 'Бустеры', 12946, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1032, '2016-02-09 00:08:14.794', true, '2016-02-09 00:08:14.794', NULL, 'http://www.mechta.kz/templates/img/icon/video_registrator.gif', 'Видеорегистраторы', 4938, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1295, '2016-02-09 00:08:21.445', false, '2016-02-09 00:08:21.445', NULL, 'http://www.mechta.kz/templates/img/icon/video_registrator.gif', 'Видеорегистраторы', 4938, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1040, '2016-02-09 00:08:14.815', true, '2016-02-09 00:08:14.815', NULL, 'http://www.mechta.kz/templates/img/icon/gubki.gif', 'Губки', 13021, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1303, '2016-02-09 00:08:21.462', false, '2016-02-09 00:08:21.462', NULL, 'http://www.mechta.kz/templates/img/icon/gubki.gif', 'Губки', 13021, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1296, '2016-02-09 00:08:21.447', false, '2016-02-09 00:08:21.447', NULL, 'http://www.mechta.kz/templates/img/icon/radar.jpg', 'Радар-детекторы', 6387, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1043, '2016-02-09 00:08:14.823', true, '2016-02-09 00:08:14.823', NULL, 'http://www.mechta.kz/templates/img/derzhat.gif', 'Держатели гаджетов', 13170, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1306, '2016-02-09 00:08:21.467', false, '2016-02-09 00:08:21.467', NULL, 'http://www.mechta.kz/templates/img/derzhat.gif', 'Держатели гаджетов', 13170, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1031, '2016-02-09 00:08:14.791', true, '2016-02-09 00:08:14.791', NULL, 'http://www.mechta.kz/templates/img/icon/navigator.gif', 'Навигационные системы', 3895, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1294, '2016-02-09 00:08:21.443', false, '2016-02-09 00:08:21.443', NULL, 'http://www.mechta.kz/templates/img/icon/navigator.gif', 'Навигационные системы', 3895, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1033, '2016-02-09 00:08:14.796', true, '2016-02-09 00:08:14.796', NULL, 'http://www.mechta.kz/templates/img/icon/radar.jpg', 'Радар-детекторы', 6387, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1041, '2016-02-09 00:08:14.817', true, '2016-02-09 00:08:14.817', NULL, 'http://www.mechta.kz/templates/img/icon/salfetki.gif', 'Салфетки', 13023, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1304, '2016-02-09 00:08:21.464', false, '2016-02-09 00:08:21.464', NULL, 'http://www.mechta.kz/templates/img/icon/salfetki.gif', 'Салфетки', 13023, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1042, '2016-02-09 00:08:14.82', true, '2016-02-09 00:08:14.82', NULL, 'http://www.mechta.kz/templates/img/icon/schetki.gif', 'Щетки стеклоочистителя', 13051, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1305, '2016-02-09 00:08:21.465', false, '2016-02-09 00:08:21.466', NULL, 'http://www.mechta.kz/templates/img/icon/schetki.gif', 'Щетки стеклоочистителя', 13051, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1045, '2016-02-09 00:08:14.828', true, '2016-02-09 00:08:14.828', NULL, 'http://www.mechta.kz/templates/img/icon/others.gif', 'Разное', 13022, 1026);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1308, '2016-02-09 00:08:21.471', false, '2016-02-09 00:08:21.471', NULL, 'http://www.mechta.kz/templates/img/icon/others.gif', 'Разное', 13022, 1289);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1309, '2016-02-09 00:08:21.958', false, '2016-02-09 00:08:21.958', NULL, 'http://www.mechta.kz/templates/img/icon/actioncam.gif', 'Активный отдых', 10763, NULL);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1311, '2016-02-09 00:08:21.965', false, '2016-02-09 00:08:21.965', NULL, NULL, 'SONY', 10766, 1310);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1312, '2016-02-09 00:08:21.968', false, '2016-02-09 00:08:21.968', NULL, NULL, 'GO PRO', 10809, 1310);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1313, '2016-02-09 00:08:21.97', false, '2016-02-09 00:08:21.97', NULL, NULL, 'Дроны для видеосъемки', 16059, 1309);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1314, '2016-02-09 00:08:21.977', false, '2016-02-09 00:08:21.977', NULL, NULL, 'PARROT', 16060, 1313);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1315, '2016-02-09 00:08:21.988', false, '2016-02-09 00:08:21.988', NULL, NULL, 'Аксессуары к экшн камерам', 16124, 1309);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1047, '2016-02-09 00:08:15.704', true, '2016-02-09 00:08:15.704', NULL, 'http://www.mechta.kz/templates/img/icon/actioncam.gif', 'Экшн камеры', 6570, 1046);
INSERT INTO categories (id, created_date, deleted, modified_date, count_products, imageurl, name, number_on_site, category_id) VALUES (1310, '2016-02-09 00:08:21.961', false, '2016-02-09 00:08:21.961', NULL, 'http://www.mechta.kz/templates/img/icon/actioncam.gif', 'Экшн камеры', 6570, 1309);


--
-- TOC entry 2293 (class 0 OID 86640)
-- Dependencies: 173
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (3, NULL, false, NULL, NULL, 'Астана', NULL, true, 51.1284218, 71.4305649);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (1, NULL, false, NULL, 'kr', 'Караганда', 'karaganda', true, 49.8064041, 73.0854874);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (2, NULL, false, NULL, 'al', 'Алматы', 'almaty', true, 43.2382545, 76.9454651);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (4, NULL, false, NULL, 'au', 'Актау', 'aktau', true, 43.6353798, 51.169136);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (5, NULL, false, NULL, 'kk', 'Кокшетау', 'kokshetau', true, 53.2846336, 69.3775558);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (6, NULL, false, NULL, 'ks', 'Костанай', 'kostanay', true, 53.2149162, 63.631031);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (7, NULL, false, NULL, 'pv', 'Павлодар', 'pavlodar', true, 52.2855759, 76.9409485);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (8, NULL, false, NULL, 'pt', 'Петропавловск', 'petropavlovsk', true, 54.8654709, 69.1356049);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (9, NULL, false, NULL, 'sm', 'Семей', 'semey', true, 50.4165268, 80.2561722);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (10, NULL, false, NULL, 'ur', 'Уральск', 'uralsk', true, 51.2121735, 51.3670692);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (11, NULL, false, NULL, 'uk', 'Усть-Каменогорск', 'ust-kamenogorsk', true, 49.9487572, 82.6284561);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (12, NULL, false, NULL, 'sh', 'Шымкент', 'shymkent', true, 42.3173027, 69.5897064);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (13, NULL, false, NULL, NULL, 'Жанаозен', NULL, false, 43.3432655, 52.8657913);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (14, NULL, false, NULL, NULL, 'Рудный', NULL, false, 52.9644432, 63.1333847);
INSERT INTO cities (id, created_date, deleted, modified_date, code, name, name_on_site, published, latitude, longitude) VALUES (15, NULL, false, NULL, NULL, 'Экибастуз', NULL, false, 51.7296906, 75.3265533);


--
-- TOC entry 2306 (class 0 OID 0)
-- Dependencies: 176
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('hibernate_sequence', 1315, true);


--
-- TOC entry 2294 (class 0 OID 86646)
-- Dependencies: 174
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO order_product (id, created_date, deleted, modified_date, name, title, type) VALUES (1, NULL, false, NULL, 'name', 'Название', 'asc');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, title, type) VALUES (2, NULL, false, NULL, 'name', 'Название', 'desc');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, title, type) VALUES (3, NULL, false, NULL, 'created_date', 'Новизна', 'asc');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, title, type) VALUES (4, NULL, false, NULL, 'created_date', 'Новизна', 'desc');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, title, type) VALUES (5, NULL, false, NULL, 'catalog_PRICE_2', 'Цена', 'asc');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, title, type) VALUES (6, NULL, false, NULL, 'catalog_PRICE_2', 'Цена', 'desc');


--
-- TOC entry 2295 (class 0 OID 86652)
-- Dependencies: 175
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2297 (class 0 OID 86693)
-- Dependencies: 177
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (21, NULL, false, NULL, 51.4351006, 51.2345047, 'ул. Сырым-Датулы, д.10/1 ( ТЦ «Премиум», 2 этаж)', 'с 10 до 20 часов', '+7 (7112) 28-91-79', 10);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (2, NULL, false, NULL, 49.797451, 73.0929565, 'пр. Бухар-Жырау, 76', 'с 10 до 20 часов', '+7 (7212) 911-100', 1);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (3, NULL, false, NULL, 43.1984329, 76.8938217, 'ул. Розыбакиева, 275 А', 'с 10 до 21 часов', '+7 (727) 302-25-75', 2);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (22, NULL, false, NULL, 49.9503899, 82.6176529, 'ул. Горького, 71 (ЦУМ, 0 этаж)', 'с 10 до 20 часов', '+7 (7232) 25-10-57', 11);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (4, NULL, false, NULL, 53.29702, 69.3886642, 'ул. Аблай хана, д.1', 'с 10 до 20 часов', '+7 (7162) 31-21-31', 5);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (23, NULL, false, NULL, 51.7152367, 75.3213196, 'ТД «Самал», ул. М. Жусупова, 101', 'с 10 до 20 часов', '+7 (7187) 75 89 29, 75 89 33', 15);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (5, NULL, false, NULL, 53.1913719, 63.6132355, 'пр. Абая, 34а', 'с 10 до 20 часов', '+7 (7142) 53-78-90', 6);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (6, NULL, false, NULL, 54.8783913, 69.1248016, 'ул. Интернациональная, 5', 'с 10 до 20 часов', '+7 (7152) 46-33-13', 8);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (7, NULL, false, NULL, 50.3941574, 80.2302704, 'Первомайская, 37 (бывш. магазин «1000 мелочей»)', 'с 10 до 20 часов', '+7 (7222) 34-67-52, 34-67-10', 9);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (8, NULL, false, NULL, 42.3228149, 69.6399307, 'ул. Уалиханова, 198, бывший ТРЦ «Алатау»', 'с 10 до 22 часов', '+7 (7252) 51-90-81', 12);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (9, NULL, false, NULL, 51.1489983, 71.4457092, 'ул. Амман, 14', 'с 10 до 22 часов', '+7 (7172) 27-88-14', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (10, NULL, false, NULL, 51.1765213, 71.4141998, 'пр. Богенбая, 39', 'с 10 до 20 часов', '+7 (7172) 31-83-41', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (11, NULL, false, NULL, 51.1706734, 71.4548264, 'ул. Мирзояна, 13', 'с 10 до 20 часов', '+7 (7172) 36-90-04', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (12, NULL, false, NULL, 51.1751099, 71.4236984, 'пр. Республики, 45', 'с 10 до 21 часов', '+7 (7172) 20-54-58', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (13, NULL, false, NULL, 51.1525726, 71.485611, 'ул. Куйши Дина, д. 31', 'с 10 до 20 часов', '+7 (7172) 40-66-89', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (14, NULL, false, NULL, 43.6596451, 51.1546898, '12а микрорайон, здание №1', 'Пн-Вс 10-20 ч.', '+7 (7292) 20-38-66', 4);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (15, NULL, false, NULL, 43.6496849, 51.1489754, '14 микрорайон, в районе дома №12', 'Пн-Вс 10-20 ч.', '+7 (7292) 33-55-69, 33-55-79', 4);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (16, NULL, false, NULL, 43.3420525, 52.8619461, 'микрорайон Шанырак', 'Пн-Вс 10-20 ч.', '+7 (72934) 30-404, 32-400', 13);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (1, NULL, false, NULL, 49.7901649, 73.1559753, 'мкрн. Гульдер-1, д. 2А', 'с 10 до 20 часов', '+7 (7212) 909-100', 1);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (17, NULL, false, NULL, 43.3498116, 52.8641663, 'микрорайон Шугыла, дом 2а', 'Пн-Вс 10-20 ч.', '+7 (72934) 30-201, 30-194', 13);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (18, NULL, false, NULL, 52.2983246, 76.9307404, 'ул. Торайгырова, 14', 'с 10 до 20 часов', '+7 (7182) 53-89-06', 7);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (19, NULL, false, NULL, 52.2951355, 76.9673157, 'ул. Кутузова, 3/2', 'с 10 до 20 часов', '+7 (7182) 50-85-88', 7);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (20, NULL, false, NULL, 52.9695969, 63.1470718, 'ул. Марите, 2 (пересечение улиц Марите и Топоркова)', 'с 10 до 20 часов', '+7 (71431) 7-56-57', 14);


--
-- TOC entry 2171 (class 2606 OID 86639)
-- Name: categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 2173 (class 2606 OID 86645)
-- Name: cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- TOC entry 2175 (class 2606 OID 86651)
-- Name: order_product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY order_product
    ADD CONSTRAINT order_product_pkey PRIMARY KEY (id);


--
-- TOC entry 2177 (class 2606 OID 86660)
-- Name: products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 2179 (class 2606 OID 86698)
-- Name: stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- TOC entry 2180 (class 2606 OID 86661)
-- Name: fk4d47461c1b055fd6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT fk4d47461c1b055fd6 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- TOC entry 2181 (class 2606 OID 86666)
-- Name: fkc42bd1641b055fd6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY products
    ADD CONSTRAINT fkc42bd1641b055fd6 FOREIGN KEY (category_id) REFERENCES categories(id);


--
-- TOC entry 2182 (class 2606 OID 86699)
-- Name: fkcad423b290efe069; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY stores
    ADD CONSTRAINT fkcad423b290efe069 FOREIGN KEY (city_id) REFERENCES cities(id);


--
-- TOC entry 2304 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-02-16 17:43:05 ALMT

--
-- PostgreSQL database dump complete
--


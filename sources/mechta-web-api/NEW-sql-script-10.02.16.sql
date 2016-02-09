--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.9
-- Dumped by pg_dump version 9.3.9
-- Started on 2016-02-09 06:49:04

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- TOC entry 1953 (class 0 OID 59173)
-- Dependencies: 171
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (1, NULL, NULL, 'kr', 'Караганда', 'karaganda', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (2, NULL, NULL, 'al', 'Алматы', 'almaty', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (3, NULL, NULL, NULL, 'Астана', NULL, false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (4, NULL, NULL, 'au', 'Актау', 'aktau', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (5, NULL, NULL, 'kk', 'Кокшетау', 'kokshetau', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (6, NULL, NULL, 'ks', 'Костанай', 'kostanay', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (7, NULL, NULL, 'pv', 'Павлодар', 'pavlodar', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (8, NULL, NULL, 'pt', 'Петропавловск', 'petropavlovsk', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (9, NULL, NULL, 'sm', 'Семей', 'semey', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (10, NULL, NULL, 'ur', 'Уральск', 'uralsk', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (11, NULL, NULL, 'uk', 'Усть-Каменогорск', 'ust-kamenogorsk', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (12, NULL, NULL, 'sh', 'Шымкент', 'shymkent', false, true);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (13, NULL, NULL, NULL, 'Жанаозен', NULL, false, false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (14, NULL, NULL, NULL, 'Рудный', NULL, false, false);
INSERT INTO cities (id, created_date, modified_date, code, name, name_on_site, deleted, published) VALUES (15, NULL, NULL, NULL, 'Экибастуз', NULL, false, false);


--
-- TOC entry 1954 (class 0 OID 66497)
-- Dependencies: 172
-- Data for Name: order_product; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (1, NULL, false, NULL, 'name', 'asc', 'Название');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (2, NULL, false, NULL, 'name', 'desc', 'Название');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (3, NULL, false, NULL, 'created_date', 'asc', 'Новизна');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (4, NULL, false, NULL, 'created_date', 'desc', 'Новизна');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (5, NULL, false, NULL, 'catalog_PRICE_2', 'asc', 'Цена');
INSERT INTO order_product (id, created_date, deleted, modified_date, name, type, title) VALUES (6, NULL, false, NULL, 'catalog_PRICE_2', 'desc', 'Цена');


--
-- TOC entry 1955 (class 0 OID 66538)
-- Dependencies: 175
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (18, NULL, false, NULL, 52.2983246, 76.9307404, 'Магазин «Мечта», ул. Торайгырова, 14', 'с 10 до 20 часов', '+7 (7182) 53-89-06', 7);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (19, NULL, false, NULL, 52.2951355, 76.9673157, 'Магазин «Мечта», ул. Кутузова, 3/2', 'с 10 до 20 часов', '+7 (7182) 50-85-88', 7);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (1, NULL, false, NULL, 49.7901649, 73.1559753, 'ТЦ «Мечта», мкрн. Гульдер-1, д. 2А', 'с 10 до 20 часов', '+7 (7212) 909-100', 1);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (20, NULL, false, NULL, 52.9695969, 63.1470718, 'маг. Мечта, ул. Марите, 2 (пересечение улиц Марите и Топоркова)', 'с 10 до 20 часов', '+7 (71431) 7-56-57', 14);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (2, NULL, false, NULL, 49.797451, 73.0929565, 'ТЦ «Мечта», пр. Бухар-Жырау, 76', 'с 10 до 20 часов', '+7 (7212) 911-100', 1);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (9, NULL, false, NULL, 51.1489983, 71.4457092, 'Магазин «Мечта», ул. Амман, 14', 'с 10 до 22 часов', '+7 (7172) 27-88-14', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (10, NULL, false, NULL, 51.1765213, 71.4141998, 'Магазин «Мечта», пр. Богенбая, 39', 'с 10 до 20 часов', '+7 (7172) 31-83-41', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (11, NULL, false, NULL, 51.1706734, 71.4548264, 'Магазин «Мечта», ул. Мирзояна, 13', 'с 10 до 20 часов', '+7 (7172) 36-90-04', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (21, NULL, false, NULL, 51.4351006, 51.2345047, 'Магазин «Мечта», ул. Сырым-Датулы, д.10/1 ( ТЦ «Премиум», 2 этаж)', 'с 10 до 20 часов', '+7 (7112) 28-91-79', 10);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (12, NULL, false, NULL, 51.1751099, 71.4236984, 'Магазин «Мечта», пр. Республики, 45', 'с 10 до 21 часов', '+7 (7172) 20-54-58', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (13, NULL, false, NULL, 51.1525726, 71.485611, 'Магазин «Мечта», ул. Куйши Дина, д. 31', 'с 10 до 20 часов', '+7 (7172) 40-66-89', 3);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (14, NULL, false, NULL, 43.6596451, 51.1546898, 'Магазин «Мечта», 12а микрорайон, здание №1', 'Пн-Вс 10-20 ч.', '+7 (7292) 20-38-66', 4);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (15, NULL, false, NULL, 43.6496849, 51.1489754, 'Магазин «Мечта», 14 микрорайон, в районе дома №12', 'Пн-Вс 10-20 ч.', '+7 (7292) 33-55-69, 33-55-79', 4);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (16, NULL, false, NULL, 43.3420525, 52.8619461, 'Магазин «Мечта», микрорайон Шанырак', 'Пн-Вс 10-20 ч.', '+7 (72934) 30-404, 32-400', 13);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (22, NULL, false, NULL, 49.9503899, 82.6176529, 'Магазин «Мечта», ул. Горького, 71 (ЦУМ, 0 этаж)', 'с 10 до 20 часов', '+7 (7232) 25-10-57', 11);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (17, NULL, false, NULL, 43.3498116, 52.8641663, 'Магазин «Мечта», микрорайон Шугыла, дом 2а', 'Пн-Вс 10-20 ч.', '+7 (72934) 30-201, 30-194', 13);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (23, NULL, false, NULL, 51.7152367, 75.3213196, 'Магазин «Мечта», ТД «Самал», ул. М. Жусупова, 101', 'с 10 до 20 часов', '+7 (7187) 75 89 29, 75 89 33', 15);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (3, NULL, false, NULL, 43.1984329, 76.8938217, 'Магазин «Мечта», ул. Розыбакиева, 275 А', 'с 10 до 21 часов', '+7 (727) 302-25-75', 2);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (4, NULL, false, NULL, 53.29702, 69.3886642, 'ТЦ «Мечта», ул. Аблай хана, д.1', 'с 10 до 20 часов', '+7 (7162) 31-21-31', 5);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (5, NULL, false, NULL, 53.1913719, 63.6132355, 'Магазин «Мечта», пр. Абая, 34а', 'с 10 до 20 часов', '+7 (7142) 53-78-90', 6);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (6, NULL, false, NULL, 54.8783913, 69.1248016, 'Магазин «Мечта», ул. Интернациональная, 5', 'с 10 до 20 часов', '+7 (7152) 46-33-13', 8);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (7, NULL, false, NULL, 50.3941574, 80.2302704, 'Магазин «Мечта», Первомайская, 37 (бывш. магазин «1000 мелочей»)', 'с 10 до 20 часов', '+7 (7222) 34-67-52, 34-67-10', 9);
INSERT INTO stores (id, created_date, deleted, modified_date, latitude, longitude, name, schedule, telephones, city_id) VALUES (8, NULL, false, NULL, 42.3228149, 69.6399307, 'Магазин «Мечта», ул. Уалиханова, 198, бывший ТРЦ «Алатау»', 'с 10 до 22 часов', '+7 (7252) 51-90-81', 12);


-- Completed on 2016-02-09 06:49:05

--
-- PostgreSQL database dump complete
--


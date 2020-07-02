/*
 Navicat Premium Data Transfer

 Source Server         : pg_localhost
 Source Server Type    : PostgreSQL
 Source Server Version : 120003
 Source Host           : localhost:5432
 Source Catalog        : ekoo
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 120003
 File Encoding         : 65001

 Date: 02/07/2020 11:52:53
*/


-- ----------------------------
-- Sequence structure for informacion_serial_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."informacion_serial_seq";
CREATE SEQUENCE "public"."informacion_serial_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for informacion
-- ----------------------------
DROP TABLE IF EXISTS "public"."informacion";
CREATE TABLE "public"."informacion" (
  "nombre" varchar(255) COLLATE "pg_catalog"."default",
  "celular" varchar(255) COLLATE "pg_catalog"."default",
  "edad" int4,
  "id" int4 NOT NULL DEFAULT nextval('informacion_serial_seq'::regclass),
  "email" varchar(255) COLLATE "pg_catalog"."default",
  "nickname" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of informacion
-- ----------------------------
INSERT INTO "public"."informacion" VALUES ('dfg', '3453', 3434, 1, NULL, NULL);
INSERT INTO "public"."informacion" VALUES ('asdasd', '301312548', 10, 2, 'zayro@gmail.com', NULL);
INSERT INTO "public"."informacion" VALUES ('asdasd', '301312548', 10, 3, 'zayro@gmail.com', 'zayro');
INSERT INTO "public"."informacion" VALUES ('ert', '13212', 23, 7, 'erter@fwerw.com.com', 'erter');
INSERT INTO "public"."informacion" VALUES ('asdasd', '234234', 34, 9, 'asda@sdfsdfc.com', 'asda');
INSERT INTO "public"."informacion" VALUES ('dfsdf', '23423', 34, 10, 'sfweed@sdfwerc.com', 'sfweed');
INSERT INTO "public"."informacion" VALUES ('sfdsdf', '23424', 3, 11, 'sdfsd@fsedfwe.com', 'sdfsd');
INSERT INTO "public"."informacion" VALUES ('sdfsd', '234', 4, 13, 'efwe34@sdf.com', 'efwe34');
INSERT INTO "public"."informacion" VALUES ('sdfsd', '234', 4, 15, 'efwe334@sdf.com', 'efwe334');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS "public"."menu";
CREATE TABLE "public"."menu" (
  "id" int4 NOT NULL,
  "nombre" varchar(255) COLLATE "pg_catalog"."default"
)
;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO "public"."menu" VALUES (1, 'Inicio');
INSERT INTO "public"."menu" VALUES (2, 'Nuevo');
INSERT INTO "public"."menu" VALUES (3, 'Ingreso');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."informacion_serial_seq"
OWNED BY "public"."informacion"."id";
SELECT setval('"public"."informacion_serial_seq"', 17, true);

-- ----------------------------
-- Indexes structure for table informacion
-- ----------------------------
CREATE INDEX "informacion_id_idx" ON "public"."informacion" USING btree (
  "id" "pg_catalog"."int4_ops" ASC NULLS LAST
);

-- ----------------------------
-- Uniques structure for table informacion
-- ----------------------------
ALTER TABLE "public"."informacion" ADD CONSTRAINT "informacion_nickname_key" UNIQUE ("nickname");

-- ----------------------------
-- Primary Key structure for table informacion
-- ----------------------------
ALTER TABLE "public"."informacion" ADD CONSTRAINT "informacion_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table menu
-- ----------------------------
ALTER TABLE "public"."menu" ADD CONSTRAINT "menu_pkey" PRIMARY KEY ("id");

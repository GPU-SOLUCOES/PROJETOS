-- MySQL dump 10.13  Distrib 5.6.41-84.1, for Linux (x86_64)
--
-- Host: localhost    Database: pedidora_multi
-- ------------------------------------------------------
-- Server version	5.6.41-84.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bairros_delivery`
--

DROP TABLE IF EXISTS `bairros_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bairros_delivery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cidade` varchar(150) NOT NULL,
  `bairro` varchar(150) NOT NULL,
  `taxa` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bairros_delivery`
--

LOCK TABLES `bairros_delivery` WRITE;
/*!40000 ALTER TABLE `bairros_delivery` DISABLE KEYS */;
INSERT INTO `bairros_delivery` (`id`, `user_id`, `uf`, `cidade`, `bairro`, `taxa`) VALUES (2,1,'AL','Arapiraca','Santos Dumont ',6.00),(3,4,'SE','Barra dos Coqueiros','Centro ',4.50),(4,5,'RJ','Rio de Janeiro','Santissimo ',3.00),(6,5,'RJ','Rio de Janeiro','Estrada do Mendanha ',6.00),(7,5,'RJ','Rio de Janeiro','Estrada da Posse ',3.00),(8,5,'RJ','Rio de Janeiro','Senador Vasconcelos ',5.00),(11,5,'RJ','Rio de Janeiro','Estrada Das Capoeiras ',5.00),(12,5,'RJ','Rio de Janeiro','Marco 7 ',5.00),(13,5,'RJ','Rio de Janeiro','Estrada do Lameir',3.00),(14,5,'RJ','Rio de Janeiro','Senador Camara ',10.00),(15,1,'SE','Aracaju','Siqueira Campos ',4.50),(16,1,'SE','Aracaju','Centro ',8.00),(17,1,'SE','Aracaju','Cidade Nova ',3.50),(18,1,'SE','Aracaju','Porto Dantas ',7.00),(22,9,'DF','Brasília','Santa Maria ',4.00),(23,9,'DF','Brasília','Gama ',8.00),(24,9,'DF','Brasília','Total Ville ',4.00),(25,9,'DF','Brasília','Santos Dumont ',4.00),(26,9,'GO','Novo Gama','Novo Gama ',5.00),(27,11,'SP','Mogi das Cruzes','Vila 4 ',2.00),(28,1,'SE','Aracaju','13 de Julho ',10.00),(29,1,'SE','Aracaju','Salgado Filho ',8.50),(30,1,'SE','Aracaju','Grajeru ',9.00),(31,12,'DF','Brasília','Águas Claras ',5.00),(32,14,'MG','Timóteo','Cachoeira do Vale ',0.00),(33,14,'MG','Timóteo','Alvorada ',5.00),(35,17,'SP','Eldorado','Bimba ',1.00),(36,17,'SP','Eldorado','Monte Libano ',2.00),(37,17,'SP','São Paulo','Vila Lola ',2.00),(38,17,'SP','São Paulo','Ferradura ',2.00),(39,17,'SP','São Paulo','Conego ',2.00),(40,17,'SP','São Paulo','Guacuri ',3.00);
/*!40000 ALTER TABLE `bairros_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `configuracoes_site`
--

DROP TABLE IF EXISTS `configuracoes_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `configuracoes_site` (
  `id_config` int(11) NOT NULL AUTO_INCREMENT,
  `nome_site` varchar(100) NOT NULL,
  `titulo_site` varchar(250) NOT NULL,
  `descricao_site` varchar(250) NOT NULL,
  `palavas_chaves` varchar(500) NOT NULL,
  `tel_adm` varchar(100) NOT NULL,
  `tel_financeiro` varchar(100) NOT NULL,
  `email_suporte` varchar(250) NOT NULL,
  `h_suporte` varchar(250) NOT NULL,
  `btn_link_youtube` varchar(250) NOT NULL,
  `link_do_face` varchar(500) NOT NULL,
  `link_do_insta` varchar(500) NOT NULL,
  `link_do_youtube` varchar(500) NOT NULL,
  `nome_plano_um` varchar(100) NOT NULL,
  `v_plano_um` int(11) NOT NULL,
  `dias_plano_um` int(11) NOT NULL,
  `nome_plano_dois` varchar(100) NOT NULL,
  `v_plano_dois` int(11) NOT NULL,
  `dias_plano_dois` int(11) NOT NULL,
  `nome_plano_tres` varchar(100) NOT NULL,
  `v_plano_tres` int(11) NOT NULL,
  `dias_plano_tres` int(11) NOT NULL,
  `dias_testes` int(11) NOT NULL,
  `public_key_mp` varchar(500) NOT NULL,
  `access_token_mp` varchar(500) NOT NULL,
  PRIMARY KEY (`id_config`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `configuracoes_site`
--

LOCK TABLES `configuracoes_site` WRITE;
/*!40000 ALTER TABLE `configuracoes_site` DISABLE KEYS */;
INSERT INTO `configuracoes_site` (`id_config`, `nome_site`, `titulo_site`, `descricao_site`, `palavas_chaves`, `tel_adm`, `tel_financeiro`, `email_suporte`, `h_suporte`, `btn_link_youtube`, `link_do_face`, `link_do_insta`, `link_do_youtube`, `nome_plano_um`, `v_plano_um`, `dias_plano_um`, `nome_plano_dois`, `v_plano_dois`, `dias_plano_dois`, `nome_plano_tres`, `v_plano_tres`, `dias_plano_tres`, `dias_testes`, `public_key_mp`, `access_token_mp`) VALUES (1,'Foodlivery','Delivery online via WhatsApp.','Crie um cardápio online atraente que inspire o apetite.','pizza, delivery food, fast food, sushi, take away, chinese, italian food','11982889012','11982889012','contato@foodlivery.com.br','09:00hs ás 18:00hs','https://www.youtube.com/','facebook','instagram','youtube','PLANO MENSAL',50,30,'PLANO TRIMESTRAL',160,90,'PLANO ANUAL',390,365,5,'APP_USR-d6d696f6-2db2-4693-a6c0-08ce23636da1','APP_USR-1625076714913746-053018-f8a18770f28fbcfc221029a2b530711a-281362235');
/*!40000 ALTER TABLE `configuracoes_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cupom_desconto`
--

DROP TABLE IF EXISTS `cupom_desconto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cupom_desconto` (
  `id_cupom` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `ativacao` varchar(50) NOT NULL,
  `porcentagem` int(11) NOT NULL,
  `data_validade` date NOT NULL,
  `total_vezes` int(11) NOT NULL,
  `mostrar_site` int(1) NOT NULL,
  PRIMARY KEY (`id_cupom`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cupom_desconto`
--

LOCK TABLES `cupom_desconto` WRITE;
/*!40000 ALTER TABLE `cupom_desconto` DISABLE KEYS */;
INSERT INTO `cupom_desconto` (`id_cupom`, `user_id`, `ativacao`, `porcentagem`, `data_validade`, `total_vezes`, `mostrar_site`) VALUES (3,1,'cupom5',5,'2025-06-30',917,1),(6,11,'cupom5',5,'2020-06-17',3,0),(7,20,'Cupom 5',5,'2020-08-07',0,0);
/*!40000 ALTER TABLE `cupom_desconto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id_views` int(11) NOT NULL AUTO_INCREMENT,
  `contar` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id_views`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
INSERT INTO `views` (`id_views`, `contar`, `user_id`) VALUES (1,6,4),(5,1158,1),(6,25,5),(7,5,6),(8,20,9),(9,2,10),(10,113,11),(11,42,12),(12,20,14),(13,11,15),(14,31,17),(15,2,16),(16,3,18),(17,34,20);
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_adicionais_itens`
--

DROP TABLE IF EXISTS `ws_adicionais_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_adicionais_itens` (
  `id_adicionais` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `categorias_adicional` varchar(1000) NOT NULL,
  `nome_adicional` varchar(250) NOT NULL,
  `valor_adicional` decimal(10,2) NOT NULL,
  `medida_adicional` varchar(10) NOT NULL,
  `status_adicional` int(1) NOT NULL,
  PRIMARY KEY (`id_adicionais`)
) ENGINE=MyISAM AUTO_INCREMENT=172 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_adicionais_itens`
--

LOCK TABLES `ws_adicionais_itens` WRITE;
/*!40000 ALTER TABLE `ws_adicionais_itens` DISABLE KEYS */;
INSERT INTO `ws_adicionais_itens` (`id_adicionais`, `user_id`, `categorias_adicional`, `nome_adicional`, `valor_adicional`, `medida_adicional`, `status_adicional`) VALUES (126,1,'45','Bacon',2.00,'UN',1),(127,1,'45','ovo',2.00,'UN',1),(124,1,'48, 49','Com Leite',2.00,'UN',1),(121,1,'44','bacon',2.00,'UN',0),(123,1,'44, 45, 47','chaddar',3.00,'UN',1),(147,17,'83, 90','Tomate',2.00,'UN',1),(146,17,'83, 90','Catupiry',2.00,'UN',1),(143,17,'83, 90','Mussarela',5.00,'UN',1),(144,17,'83, 90','Bacon',5.00,'UN',1),(145,17,'83, 90','Calabresa',5.00,'UN',1),(137,17,'85','Chocolate',4.00,'UN',1),(138,17,'85','Goiabada',2.50,'UN',1),(139,17,'85, 90','Doce leite',3.00,'UN',1),(140,17,'83, 91','Borda catupiry',2.00,'UN',1),(141,17,'83, 91','Borda cheddar',3.00,'UN',1),(142,17,'83, 91','Borda catupiry especial',4.00,'UN',1),(148,17,'83, 90','Azeitona',1.00,'UN',1),(149,17,'83, 90','Atum',6.00,'UN',1),(150,17,'83, 89','Cebola',1.50,'UN',1),(151,17,'83, 90','Cheddar',3.00,'UN',1),(152,17,'83, 90','Meia Mussarela (coloque na observação qual a parte desejada)',3.00,'UN',1),(153,17,'83, 90','Meia Bacon  (coloque na observação qual a parte desejada)',3.00,'UN',1),(154,17,'83, 90','Meia Catupiry  (coloque na observação qual a parte desejada)',2.50,'UN',1),(155,17,'83, 90','Meia Calabresa  (coloque na observação qual a parte desejada)',3.50,'UN',1),(156,17,'83, 90','Meia Tomate  (coloque na observação qual a parte desejada)',1.50,'UN',1),(157,17,'83, 90','Meia Atum  (coloque na observação qual a parte desejada)',4.00,'UN',1),(158,17,'83, 90','Meia cebola  (coloque na observação qual a parte desejada)',1.50,'UN',1),(162,18,'92','portuguesa',0.00,'UN',1),(163,18,'92','mussarela',0.00,'UN',1),(164,18,'92','lombo',0.00,'UN',1),(165,18,'92','bacon',0.00,'UN',1),(166,18,'93','leite em po',1.50,'UN',1),(167,18,'93','leite condensado',1.50,'UN',1),(168,18,'93','chocolate',2.00,'UN',1),(169,18,'92','carne seca',0.00,'UN',1),(170,20,'94','Bacon',1.00,'UN',1),(171,20,'94','Catupiry',0.00,'UN',1);
/*!40000 ALTER TABLE `ws_adicionais_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_admin`
--

DROP TABLE IF EXISTS `ws_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_email` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `admin_senha` varchar(300) COLLATE utf8_unicode_ci NOT NULL,
  `admin_ultimoacesso` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `admin_level` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_admin`
--

LOCK TABLES `ws_admin` WRITE;
/*!40000 ALTER TABLE `ws_admin` DISABLE KEYS */;
INSERT INTO `ws_admin` (`admin_id`, `admin_email`, `admin_senha`, `admin_ultimoacesso`, `admin_level`) VALUES (1,'demo@demo.com','53444f91e698c0c7caa2dbc3bdbf93fc','',1);
/*!40000 ALTER TABLE `ws_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_cat`
--

DROP TABLE IF EXISTS `ws_cat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nome_cat` varchar(250) NOT NULL,
  `desc_cat` varchar(500) NOT NULL,
  `icon_cat` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_cat`
--

LOCK TABLES `ws_cat` WRITE;
/*!40000 ALTER TABLE `ws_cat` DISABLE KEYS */;
INSERT INTO `ws_cat` (`id`, `user_id`, `nome_cat`, `desc_cat`, `icon_cat`) VALUES (44,1,'hambúrgueres','Nossos hambúrgueres artesanais, são preparados com o melhor blend de carnes, feito na churrasqueira, com um sabor típico, e acompanhado de produtos de ALTÍSSIMA qualidade. Peça seu hambúrguer artesanal hoje mesmo.','img/burger.png'),(45,1,'PIZZAS','null','img/pizza.png'),(46,1,'REFRIGERANTES','null','img/refrigerantes.png'),(47,1,'SALGADOS','null','img/bitterballen2.png'),(48,1,'SUCOS','null','img/lemonade.png'),(49,1,'AÇAI','null','img/acai.png'),(50,5,'BURGUERS TRADICIONAIS','NOSSOS BURGUERS TRADICIONAIS SÃO PREPARADOS COM CARNE 100% BOVINA DE 90GR.','img/burger.png'),(51,5,'BURGUERS ARTESANAIS','NOSSOS BURGUERS ARTESANAIS SÃO PREPARADOS COM CARNE 100% BOVINA DE 150GR','img/burger.png'),(52,5,'COMBOS TRADICIONAIS','COMBO - BURGUER TRADICIONAL + BATATA M + REFRIGERANTE LATA','img/combohamburgue.png'),(53,5,'COMBOS ARTESANAIS','COMBO - BURGUER ARTESANAL + BATATA M + REFRIGERANTE LATA','img/combohamburgue.png'),(54,5,'PIZZAS 35CM - 8 PEDAÇOS','PIZZA TOTALMENTE ARTESANAL.','img/pizza.png'),(55,5,'ESFIHAS DOCES','ESFIHA PREPARADA ARTESANALMENTE','null'),(56,6,'Refrigerantes','Escolha seu refri','img/can.png'),(57,5,'PORÇÕES','PORÇÕES DE BATATA, PORCÕES DE PASTEIS, PORÇÕES DE ONIONS RINGS.','img/carvao.png'),(58,5,'PASTÉIS','PASTEIS DOCES E SALGADOS','img/sacola.png'),(59,5,'BEBIDAS','REFRIGERANTES LATA, REFRIGERANTES 2L E REFRIGERANTES 1,5L','img/refrigerantes.png'),(60,9,'Blend especial assado na brasa','Hambúrguer artesanal , blend de costela e fraldinha, queijo cheddar ou prato, bacon, molho da casa, salada da casa','img/burger.png'),(61,9,'Hambúrguer de frango assado na brasa ou empanado','Hambúrguer de frango empanado','img/burger.png'),(63,10,'HAMBÚRGUER','null','img/burger.png'),(64,11,'Pizzas Gourmet','Pizza 35cm, 8 pedaços, linha gourmet','img/pizza.png'),(65,11,'Pizzas Gourmet Doce','Pizza 35cm, 8 pedaços, linha gourmet','img/pizza.png'),(67,11,'Bebidas','null','img/can.png'),(68,11,'Lanches','Todos os lanches  acompanha catchup, mostarda, molho barbecue e maionese','img/burger.png'),(69,11,'Sorvetes','Sabores','null'),(70,12,'FEIJOADA COMPLETA','Marmitex','null'),(71,12,'KIT FEIJOADA','null','null'),(72,12,'PORÇÕES EXTRAS','null','null'),(74,14,'Hambúrgueres','Tradicionais','img/burger.png'),(75,14,'Macarrão na chapa','Macarrão','null'),(76,14,'Refrigerante','2L','img/refrigerantes.png'),(77,15,'Teste 1','Teste 1','null'),(78,15,'Teste 2','Teste 2','null'),(79,15,'A','A','null'),(80,11,'Pizza Executiva meio a meio','null','img/pizza.png'),(83,17,'Pizzas salgadas','Pizza 8 pedaços','img/pizza.png'),(85,17,'Pizzas doces','null','img/cupcake.png'),(86,17,'Calzones','Pizza fechada 4 pedaços','img/pizza.png'),(87,17,'Bebidas','Bebidas','img/refrigerantes.png'),(88,17,'Pizzas Brotinhos','Brotinhos 4 pedaços','img/pizza.png'),(89,17,'Combos','null','img/combopizza.png'),(90,17,'Adicionais','Recheios extra','img/bandeja.png'),(91,17,'Borda adicional','Borda adicional','null'),(92,18,'PIZZA','pizzas','img/pizza.png'),(93,18,'AÇAI','melhor do açai','img/acai.png'),(94,20,'01 ESPETINHOS SIMPLES','Espetos comuns','img/espetinho.png');
/*!40000 ALTER TABLE `ws_cat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_datas_close`
--

DROP TABLE IF EXISTS `ws_datas_close`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_datas_close` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `data` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_datas_close`
--

LOCK TABLES `ws_datas_close` WRITE;
/*!40000 ALTER TABLE `ws_datas_close` DISABLE KEYS */;
INSERT INTO `ws_datas_close` (`id`, `user_id`, `data`) VALUES (18,1,'14/01/2019'),(20,1,'12/01/2019'),(22,1,'03/05/2020'),(24,1,'16/05/2020');
/*!40000 ALTER TABLE `ws_datas_close` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_empresa`
--

DROP TABLE IF EXISTS `ws_empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nome_empresa` varchar(250) NOT NULL,
  `descricao_empresa` varchar(200) NOT NULL,
  `nome_empresa_link` varchar(250) NOT NULL,
  `cnpj_empresa` varchar(250) NOT NULL,
  `email_empresa` varchar(250) NOT NULL,
  `telefone_empresa` varchar(250) NOT NULL,
  `end_rua_n_empresa` varchar(250) NOT NULL,
  `end_bairro_empresa` varchar(250) NOT NULL,
  `cidade_empresa` varchar(250) NOT NULL,
  `end_uf_empresa` varchar(250) NOT NULL,
  `cep_empresa` varchar(250) NOT NULL,
  `img_logo` varchar(300) NOT NULL,
  `img_header` varchar(400) NOT NULL,
  `facebook_status` int(11) NOT NULL,
  `twitter_status` int(11) NOT NULL,
  `instagram_status` int(11) NOT NULL,
  `facebook_empresa` varchar(600) NOT NULL,
  `instagram_empresa` varchar(600) NOT NULL,
  `twitter_empresa` varchar(600) NOT NULL,
  `genero_empresa` varchar(255) NOT NULL,
  `config_segunda` varchar(250) NOT NULL,
  `config_terca` varchar(250) NOT NULL,
  `config_quarta` varchar(250) NOT NULL,
  `config_quinta` varchar(250) NOT NULL,
  `config_sexta` varchar(250) NOT NULL,
  `config_sabado` varchar(250) NOT NULL,
  `config_domingo` varchar(250) NOT NULL,
  `config_delivery` decimal(10,2) NOT NULL,
  `config_delivery_free` decimal(10,2) NOT NULL,
  `op_entrar_btn` int(11) NOT NULL,
  `empresa_data_renovacao` date NOT NULL,
  `msg_tempo_delivery` varchar(150) NOT NULL,
  `msg_tempo_buscar` varchar(150) NOT NULL,
  `minimo_delivery` decimal(10,2) NOT NULL,
  `confirm_delivery` varchar(20) NOT NULL,
  `confirm_balcao` varchar(20) NOT NULL,
  `confirm_mesa` varchar(20) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_empresa`
--

LOCK TABLES `ws_empresa` WRITE;
/*!40000 ALTER TABLE `ws_empresa` DISABLE KEYS */;
INSERT INTO `ws_empresa` (`id_empresa`, `user_id`, `nome_empresa`, `descricao_empresa`, `nome_empresa_link`, `cnpj_empresa`, `email_empresa`, `telefone_empresa`, `end_rua_n_empresa`, `end_bairro_empresa`, `cidade_empresa`, `end_uf_empresa`, `cep_empresa`, `img_logo`, `img_header`, `facebook_status`, `twitter_status`, `instagram_status`, `facebook_empresa`, `instagram_empresa`, `twitter_empresa`, `genero_empresa`, `config_segunda`, `config_terca`, `config_quarta`, `config_quinta`, `config_sexta`, `config_sabado`, `config_domingo`, `config_delivery`, `config_delivery_free`, `op_entrar_btn`, `empresa_data_renovacao`, `msg_tempo_delivery`, `msg_tempo_buscar`, `minimo_delivery`, `confirm_delivery`, `confirm_balcao`, `confirm_mesa`) VALUES (21,1,'DEMONSTRAÇÃO','Desde 2020 entregando os lanches mais sinistros da cidade!','Demo','','contato@foodlivery.com.br','11982889012','Rua Silvio Barbini','Itaquera','Itaporanga d´Ajuda','SE','08200-030','images/2020/05/img-teste.png','images/2020/07/unnamed.png',2,2,2,'https://www.facebook.com/','https://www.instagram.com/','https://www.facebook.com/','','on 00:00-23:59','on 00:00-23:59','on 00:00-23:59','on 00:00-23:59','on 23:59-23:59','on 00:00-23:59','on 00:00-23:59',6.00,50.00,1,'2029-05-16','Entre 30 e 60 minutos.','Em 30 minutos.',15.00,'true','true','true');
/*!40000 ALTER TABLE `ws_empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_formas_pagamento`
--

DROP TABLE IF EXISTS `ws_formas_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_formas_pagamento` (
  `id_f_pagamento` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `f_pagamento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_f_pagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_formas_pagamento`
--

LOCK TABLES `ws_formas_pagamento` WRITE;
/*!40000 ALTER TABLE `ws_formas_pagamento` DISABLE KEYS */;
INSERT INTO `ws_formas_pagamento` (`id_f_pagamento`, `user_id`, `f_pagamento`) VALUES (1,1,'Dinheiro'),(3,1,'Cartão Crédito'),(4,18,'dinheiro, credito, debito, vale.'),(5,1,'Cartão Debito'),(6,20,'Dinheiro'),(7,20,'Cartão débito'),(8,20,'Cartão crédito');
/*!40000 ALTER TABLE `ws_formas_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_impressora`
--

DROP TABLE IF EXISTS `ws_impressora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_impressora` (
  `id_impressora` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `nome_impressora` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id_impressora`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_impressora`
--

LOCK TABLES `ws_impressora` WRITE;
/*!40000 ALTER TABLE `ws_impressora` DISABLE KEYS */;
INSERT INTO `ws_impressora` (`id_impressora`, `user_id`, `nome_impressora`) VALUES (1,1,'COM6');
/*!40000 ALTER TABLE `ws_impressora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_itens`
--

DROP TABLE IF EXISTS `ws_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_itens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `id_cat` int(11) NOT NULL,
  `img_item` varchar(500) NOT NULL,
  `nome_item` varchar(250) NOT NULL,
  `descricao_item` varchar(500) NOT NULL,
  `preco_item` decimal(10,2) NOT NULL,
  `config_total_s` int(11) NOT NULL,
  `disponivel` int(11) NOT NULL,
  `dia_semana` varchar(500) NOT NULL,
  `number_adicional` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_itens`
--

LOCK TABLES `ws_itens` WRITE;
/*!40000 ALTER TABLE `ws_itens` DISABLE KEYS */;
INSERT INTO `ws_itens` (`id`, `user_id`, `id_cat`, `img_item`, `nome_item`, `descricao_item`, `preco_item`, `config_total_s`, `disponivel`, `dia_semana`, `number_adicional`) VALUES (96,1,44,'images/2020/06/hamburguer-shutterstock.jpg','Ô CABRUNCO','Pão burger  e quentinho, hambúrguer, cebola, Bacon, cheddar e picles com ketchup e mostarda.',8.00,4,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',1),(97,1,44,'images/2020/06/1-ja74qpri-9hvdmgjsdj-sq.jpg','AMOSTRADO','São 3 saborosas fatias de bacon, alface, cebola, hambúrguer de 120 gramas de carne bovina, queijo derretido, tomate e um trio de delícias.',13.00,4,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(98,1,44,'images/2020/06/shutterstock-hamburgueres-1.jpg','AVEXADO','Dois deliciosos hambúrgueres de carne 100% bovina, queijo cheddar derretido, picles, cebola picada, ketchup e mostarda.',15.00,4,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(99,1,44,'images/2020/06/1-jsegxjp6agqldxwxlhbj6w.jpg','EXIBIDO','Dois hambúrgueres, alface, queijo e molho especial, cebola e picles num pão com gergelim.',18.00,4,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(100,1,44,'false','CAMPEÃO','Pão, burger 100gr, queijo prato, barbecue picante caseiro, bacon, cebola, salada e maionese da casa.',6.00,4,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(101,1,45,'images/2020/05/pizzaqueijos.jpg','Pizza Média','Pizza M com 6 fatias - 2 sabores',30.00,2,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(102,1,45,'images/2020/05/pizza-de-atum-e-mussarela.jpg','Pizza 5 Queijos Especiais','Requeijão Cremoso Danubio, Queijo Parmesão Ralado Vigor, Queijo Gouda Ralado, Queijo Gruyère Ralado, Queijo Gorgonzola Picado e Orégano.',20.00,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',2),(103,1,45,'images/2020/05/pizza-1590176697.jpg','Pizza Presunto','Mussarela, Presunto, rodelas de tomate, azeitona e cebola',27.90,1,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(104,1,46,'images/2020/05/download-1585609494.jpg','Coca Cola','Lata 350ml',4.00,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(105,1,46,'images/2020/05/coca-cola-zero.jpg','Coca Cola Zero','Lata 350ml',5.00,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0),(106,1,46,'images/2020/05/31dcd357a6.jpg','Fanta Laranja','Lata 350ml',3.50,0,1,'null',32),(107,1,46,'images/2020/05/download-1.jpg','Guaraná Antarctica','Lata 350ml',3.50,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',32),(108,1,47,'images/2020/05/img-pao-de-queijo.jpg','Pão de queijo','Pão de queijo de liquidificador',2.00,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',32),(109,1,47,'images/2020/05/img-coxinha-simples.jpg','Coxinha','Coxinha de frango',2.00,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',10),(110,1,47,'images/2020/05/201907021158-cda1.jpeg','Dupla de acarajé puro tradicional','Dois acarajés puros tradicional. O acarajé é feito de massa de feijão fradinho triturado, temperado com cebola e sal.',18.00,0,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',12),(111,1,48,'images/2020/05/bebidas-suco-de-laranjajpg-600x600.jpg','Suco de laranja','Suco de Laranja 350 ml',4.00,1,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',1),(112,1,48,'images/2020/07/suco-acerola-300x300w-1.png','Suco de acerola','Suco de Acerola 350 ml',4.00,1,1,'Domingo,Segunda,Terça,Quarta,Quinta,Sexta,Sabado',0);
/*!40000 ALTER TABLE `ws_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_opcoes_itens`
--

DROP TABLE IF EXISTS `ws_opcoes_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_opcoes_itens` (
  `id_option` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `nome_option` varchar(250) NOT NULL,
  `valor_tamanho` decimal(10,2) NOT NULL,
  `meio_a_meio` varchar(50) NOT NULL,
  `total_qtd_itens` varchar(11) NOT NULL,
  PRIMARY KEY (`id_option`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_opcoes_itens`
--

LOCK TABLES `ws_opcoes_itens` WRITE;
/*!40000 ALTER TABLE `ws_opcoes_itens` DISABLE KEYS */;
INSERT INTO `ws_opcoes_itens` (`id_option`, `user_id`, `id_tipo`, `nome_option`, `valor_tamanho`, `meio_a_meio`, `total_qtd_itens`) VALUES (35,1,28,'Meio a Meio ou Inteira',0.00,'true','2'),(36,1,28,'Médio',30.00,'null','null'),(37,1,29,'Pequeno',10.00,'null','null'),(38,1,29,'Médio',15.00,'null','null'),(39,1,29,'Grande',20.00,'null','null'),(40,11,31,'Meio a Meio ou Inteira',0.00,'true','2'),(43,17,34,'Broto',10.00,'null','null'),(44,17,35,'MEIO A MEIO',0.00,'true','2'),(46,17,35,'Grande',0.00,'true','2'),(48,17,39,'Médio',15.00,'null','null'),(49,1,40,'Mal passada',0.00,'null','null'),(50,1,40,'Bem passada',0.00,'null','null'),(51,1,40,'Ao ponto',0.00,'null','null'),(52,1,41,'Pão com gergelin',10.00,'null','null'),(53,1,41,'Pão sem gergelin',5.00,'null','null'),(54,1,28,'Pequena',20.00,'null','null'),(57,18,45,'AÇAI 300 ML',8.00,'null','null'),(58,18,45,'AÇAI 500 ML',12.00,'null','null'),(59,18,45,'AÇAI 700 ML',15.00,'null','null'),(60,18,46,'pizza grande até 4 sabores',0.00,'true','4'),(61,18,46,'pizza media até 3 sabores',0.00,'true','3'),(62,18,46,'pizza pequena até 2 sabores',0.00,'true','2'),(63,18,46,'meio a meio',0.00,'true','2'),(64,20,47,'Meio a meio',0.00,'true','2'),(65,20,48,'Só teste',5.00,'null','null'),(66,20,48,'Teste dois',4.00,'null','null'),(67,20,47,'Teste dois',2.00,'null','null'),(68,20,49,'meio carne meio frango',0.00,'true','2');
/*!40000 ALTER TABLE `ws_opcoes_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_pedidos`
--

DROP TABLE IF EXISTS `ws_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_pedidos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `codigo_pedido` varchar(150) NOT NULL,
  `data` datetime NOT NULL,
  `data_chart` varchar(100) NOT NULL,
  `data_chart2` date NOT NULL,
  `resumo_pedidos` longtext NOT NULL,
  `forma_pagamento` varchar(150) NOT NULL,
  `valor_troco` decimal(10,2) NOT NULL,
  `opcao_delivery` varchar(50) NOT NULL,
  `valor_taxa` decimal(10,2) NOT NULL,
  `telefone_empresa` varchar(200) NOT NULL,
  `adicionais` varchar(250) NOT NULL,
  `sub_total` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `nome` varchar(150) NOT NULL,
  `telefone` varchar(150) NOT NULL,
  `rua` varchar(250) NOT NULL,
  `unidade` int(11) NOT NULL,
  `bairro` varchar(150) NOT NULL,
  `cidade` varchar(150) NOT NULL,
  `uf` varchar(10) NOT NULL,
  `complemento` varchar(250) NOT NULL,
  `observacao` varchar(250) NOT NULL,
  `name_observacao_mesa` varchar(250) NOT NULL,
  `status` varchar(150) NOT NULL,
  `mes` varchar(5) NOT NULL,
  `ano` varchar(5) NOT NULL,
  `view` int(11) NOT NULL,
  `desconto` int(11) NOT NULL,
  `confirm_whatsapp` varchar(50) NOT NULL,
  `msg_delivery_false` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_pedidos`
--

LOCK TABLES `ws_pedidos` WRITE;
/*!40000 ALTER TABLE `ws_pedidos` DISABLE KEYS */;
INSERT INTO `ws_pedidos` (`id`, `user_id`, `codigo_pedido`, `data`, `data_chart`, `data_chart2`, `resumo_pedidos`, `forma_pagamento`, `valor_troco`, `opcao_delivery`, `valor_taxa`, `telefone_empresa`, `adicionais`, `sub_total`, `total`, `nome`, `telefone`, `rua`, `unidade`, `bairro`, `cidade`, `uf`, `complemento`, `observacao`, `name_observacao_mesa`, `status`, `mes`, `ano`, `view`, `desconto`, `confirm_whatsapp`, `msg_delivery_false`) VALUES (1,1,'PED0920-1','2020-09-15 17:41:14','2020-09','2020-09-15','<b>Qtd:</b> 2x AMOSTRADO<br /><b>Adicionais:</b> Sem Adicionais<br /><b>Valor:</b> R$ 26,00<br /><b>OBS:</b> Não<br /><br />','Dinheiro',40.00,'true',6.00,'79991322619','0',26.00,32.00,'Alex','79991322619','rua joseu',32,'Santos Dumont','Arapiraca','AL','complemento','não','','Aberto','09','20',1,0,'false',''),(2,1,'PED0920-2','2020-09-15 17:41:51','2020-09','2020-09-15','<b>Qtd:</b> 2x Pizza Média<br /><b>Adicionais:</b> Sem Adicionais<br /><b>Valor:</b> R$ 60,00<br /><b>OBS:</b> Não<br /><br /><b>Qtd:</b> 3x Coca Cola<br /><b>Adicionais:</b> Sem Adicionais<br /><b>Valor:</b> R$ 12,00<br /><b>OBS:</b> Não<br /><br />','Cartão Crédito',0.00,'false',0.00,'79991322619','0',72.00,72.00,'Alex','79991322619','',0,'','','','*Não informado*','*Não informado*','','Aberto','09','20',1,0,'false','Retirada no Balcão'),(3,1,'PED0920-3','2020-09-15 17:42:37','2020-09','2020-09-15','<b>Qtd:</b> 15x Coxinha<br /><b>Adicionais:</b> Sem Adicionais<br /><b>Valor:</b> R$ 30,00<br /><b>OBS:</b> Não<br /><br /><b>Qtd:</b> 4x Suco de laranja<br /><b>Adicionais:</b> Sem Adicionais<br /><b>Valor:</b> R$ 16,00<br /><b>OBS:</b> Não<br /><br />','',0.00,'false',0.00,'79991322619','0',46.00,46.00,'Alex','79991322619','',0,'','','','*Não informado*','*Não informado*','Nenhuma','Aberto','09','20',1,0,'false','Mesa: 21<br />Pessoas: 2');
/*!40000 ALTER TABLE `ws_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_relacao_tamanho`
--

DROP TABLE IF EXISTS `ws_relacao_tamanho`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_relacao_tamanho` (
  `id_relacao` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `id_tipo` int(11) NOT NULL,
  `id_tamanho` varchar(500) NOT NULL,
  PRIMARY KEY (`id_relacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_relacao_tamanho`
--

LOCK TABLES `ws_relacao_tamanho` WRITE;
/*!40000 ALTER TABLE `ws_relacao_tamanho` DISABLE KEYS */;
/*!40000 ALTER TABLE `ws_relacao_tamanho` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_tipo_produto`
--

DROP TABLE IF EXISTS `ws_tipo_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_tipo_produto` (
  `id_tipo_produto` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipo_produto` varchar(250) NOT NULL,
  `user_tipo_produto` int(11) NOT NULL,
  PRIMARY KEY (`id_tipo_produto`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_tipo_produto`
--

LOCK TABLES `ws_tipo_produto` WRITE;
/*!40000 ALTER TABLE `ws_tipo_produto` DISABLE KEYS */;
INSERT INTO `ws_tipo_produto` (`id_tipo_produto`, `nome_tipo_produto`, `user_tipo_produto`) VALUES (28,'Pizza',1),(29,'Sorvetes',1),(30,'Açai',1),(31,'Pizza',11),(34,'Pizza Broto',17),(35,'Meio a meio',17),(39,'Calzone',17),(40,'Ponto da Carne',1),(41,'Tipo de pão',1),(45,'AÇAI',18),(46,'PIZZA',18),(47,'Pizza',20),(48,'Complemento',20),(49,'Super Largo',20);
/*!40000 ALTER TABLE `ws_tipo_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ws_users`
--

DROP TABLE IF EXISTS `ws_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ws_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_lastname` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_email` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_cpf` varchar(250) NOT NULL,
  `user_telefone` varchar(250) NOT NULL,
  `user_img_perfil` varchar(250) NOT NULL,
  `user_password` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_ultimoacesso` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL DEFAULT '1',
  `user_plano` int(1) NOT NULL,
  `user_status` varchar(255) NOT NULL,
  `user_cont` int(11) NOT NULL,
  `user_nome_plano` varchar(300) NOT NULL,
  `user_dias_plano` int(11) NOT NULL,
  `status_assinatura_plano` varchar(300) NOT NULL,
  `codigo_assinante` varchar(60) NOT NULL,
  `user_data_renova` date NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ws_users`
--

LOCK TABLES `ws_users` WRITE;
/*!40000 ALTER TABLE `ws_users` DISABLE KEYS */;
INSERT INTO `ws_users` (`user_id`, `user_name`, `user_lastname`, `user_email`, `user_cpf`, `user_telefone`, `user_img_perfil`, `user_password`, `user_registration`, `user_ultimoacesso`, `user_level`, `user_plano`, `user_status`, `user_cont`, `user_nome_plano`, `user_dias_plano`, `status_assinatura_plano`, `codigo_assinante`, `user_data_renova`) VALUES (1,'Alex','Silva','demo@demo.com','217.745.568-55','(79).9124.6346','images/2018/07/cd-img-3.png','53444f91e698c0c7caa2dbc3bdbf93fc','2014-02-11 13:14:04',' Último acesso em: 11/09/2020 10:35 IP: ::1 ',3,1,'',0,'',0,'','','0000-00-00');
/*!40000 ALTER TABLE `ws_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'pedidora_multi'
--

--
-- Dumping routines for database 'pedidora_multi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-02  9:37:49

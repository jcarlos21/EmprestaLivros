-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autor`
--

DROP TABLE IF EXISTS `autor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autor` (
  `idAutor` int NOT NULL AUTO_INCREMENT,
  `NomeAutor` varchar(45) NOT NULL,
  PRIMARY KEY (`idAutor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autor`
--

LOCK TABLES `autor` WRITE;
/*!40000 ALTER TABLE `autor` DISABLE KEYS */;
INSERT INTO `autor` VALUES (1,'Einstein'),(2,'Catarina Dias'),(3,'Julio Vernes'),(4,'Machado de Assis'),(5,'Elis Regina'),(6,'William Shakespeare'),(7,'Carlos'),(8,'Edu');
/*!40000 ALTER TABLE `autor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `consultaarea`
--

DROP TABLE IF EXISTS `consultaarea`;
/*!50001 DROP VIEW IF EXISTS `consultaarea`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consultaarea` AS SELECT 
 1 AS `idAreaConhecimento`,
 1 AS `Descricao`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `consultalivro`
--

DROP TABLE IF EXISTS `consultalivro`;
/*!50001 DROP VIEW IF EXISTS `consultalivro`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `consultalivro` AS SELECT 
 1 AS `idLivro`,
 1 AS `ISBN`,
 1 AS `Titulo`,
 1 AS `StatusLivro`,
 1 AS `idAreaConhecimento`,
 1 AS `NumEdicao`,
 1 AS `idEditora`,
 1 AS `AnoPublicacao`,
 1 AS `PaisPublicacao`,
 1 AS `idAutor`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `editora`
--

DROP TABLE IF EXISTS `editora`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editora` (
  `idEditora` int NOT NULL AUTO_INCREMENT,
  `NomeEditora` varchar(45) NOT NULL,
  PRIMARY KEY (`idEditora`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editora`
--

LOCK TABLES `editora` WRITE;
/*!40000 ALTER TABLE `editora` DISABLE KEYS */;
INSERT INTO `editora` VALUES (1,'Esperanca'),(2,'Astros'),(3,'Vida'),(4,'Terra'),(5,'FabulasVida');
/*!40000 ALTER TABLE `editora` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emprestimo` (
  `CPF` int NOT NULL,
  `DataEmprestimo` varchar(45) NOT NULL,
  `idLivro` int NOT NULL,
  PRIMARY KEY (`CPF`,`DataEmprestimo`),
  KEY `fk_Transferência_Periodo1_idx` (`DataEmprestimo`),
  KEY `fk_Transferência_Livro1_idx` (`idLivro`),
  KEY `fk_Transferência_Usuario1_idx` (`CPF`),
  CONSTRAINT `fk_Transferência_Livro1` FOREIGN KEY (`idLivro`) REFERENCES `livro` (`idLivro`),
  CONSTRAINT `fk_Transferência_Periodo1` FOREIGN KEY (`DataEmprestimo`) REFERENCES `periodo` (`DataEmprestimo`),
  CONSTRAINT `fk_Transferência_Usuario1` FOREIGN KEY (`CPF`) REFERENCES `usuario` (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (35,'25-08-19',3),(35,'0.277777777777777777',10),(35,'1',10),(26,'25-08-20',15);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livro` (
  `idLivro` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(45) NOT NULL,
  `Titulo` varchar(45) NOT NULL,
  `StatusLivro` varchar(15) NOT NULL,
  `idAreaConhecimento` int NOT NULL,
  `NumEdicao` int NOT NULL,
  `idEditora` int NOT NULL,
  `AnoPublicacao` int DEFAULT NULL,
  `PaisPublicacao` varchar(15) DEFAULT NULL,
  `idAutor` int NOT NULL,
  PRIMARY KEY (`idLivro`),
  KEY `fk_Livro_Área1_idx` (`idAreaConhecimento`),
  KEY `fk_Livro_Editora1_idx` (`idEditora`),
  KEY `fk_Livro_Autor1_idx` (`idAutor`),
  CONSTRAINT `fk_Livro_Autor1` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  CONSTRAINT `fk_Livro_Editora1` FOREIGN KEY (`idEditora`) REFERENCES `editora` (`idEditora`),
  CONSTRAINT `fk_Livro_Área1` FOREIGN KEY (`idAreaConhecimento`) REFERENCES `área` (`idAreaConhecimento`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'25141','O Garoto Que Nao Conseguia Dormir','Disponivel',1,12,1,1998,'Espanha',5),(2,'63524','Os Deuses Eram Astronautas','Indisponivel',2,5,4,2000,'Inglaterra',3),(3,'98545','Alienigenas do Passado','Indisponivel',2,2,4,1986,'Italia',3),(4,'74585','Minha doce Aprendiz','Disponivel',1,7,1,2001,'Estados Unidos',2),(5,'96655','Ovnis: A Chegada','Indisponivel',2,10,2,1992,'Alemanha',1),(6,'21556','Versos Para Minha Amada','Indisponivel',3,19,3,1998,'Brasil',4),(7,'96655','Ovnis: A Chegada','Indisponivel',2,10,2,1992,'Alemanha',1),(8,'98545','Alienigenas do Passado','Disponivel',2,2,4,1986,'Italia',3),(9,'63524','Os Deuses Eram Astronautas','Indisponivel',2,5,4,2000,'Inglaterra',3),(10,'74585','Minha doce Aprendiz','Indisponivel',1,7,1,2001,'Estados Unidos',2),(11,'25141','O Garoto Que Nao Conseguia Dormir','Disponivel',1,12,1,1998,'Espanha',5),(12,'74585','Minha doce Aprendiz','Disponivel',1,7,1,2001,'Estados Unidos',2),(13,'63524','Os Deuses Eram Astronautas','Indisponivel',2,5,4,2000,'Inglaterra',3),(14,'98545','Alienigenas do Passado','Disponivel',2,2,4,1986,'Italia',3),(15,'25141','O Garoto Que Nao Conseguia Dormir','Indisponivel',1,12,1,1998,'Espanha',5),(16,'21556','Versos Para Minha Amada','Indisponivel',3,19,3,1998,'Brasil',4),(17,'96655','Ovnis: A Chegada','Indisponivel',2,10,2,1992,'Alemanha',1),(18,'251456','O Rei Lear','Disponivel',2,2,1,1606,'Inglaterra ',6),(19,'251456','O Rei Lear','Disponivel',2,2,1,1606,'Inglaterra ',6),(20,'251456','O Rei Lear','Disponivel',2,2,1,1606,'Inglaterra ',6),(21,'8563215','Voce','Disponivel',1,5,1,1998,'Peru',1),(22,'8563215','Voce','Disponivel',1,5,1,1998,'Peru',7),(23,'8563215','Voce','Disponivel',1,5,1,1998,'Peru',7),(24,'8563215','Voce','Disponivel',1,5,1,1998,'Peru',7),(25,'41258855','Agua','Liberado',1,2,1,1995,'Australia',8),(26,'41258855','Agua','Liberado',1,2,1,1995,'Australia',8);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `periodo`
--

DROP TABLE IF EXISTS `periodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `periodo` (
  `DataEmprestimo` varchar(45) NOT NULL,
  `DataPrevistaDevolucao` varchar(45) NOT NULL,
  `DataDevolucao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`DataEmprestimo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `periodo`
--

LOCK TABLES `periodo` WRITE;
/*!40000 ALTER TABLE `periodo` DISABLE KEYS */;
INSERT INTO `periodo` VALUES ('0.277777777777777777','0.083333333333333333',NULL),('1','-16',NULL),('25-08-19','09-07-19',NULL),('25-08-20','09-07-20',NULL);
/*!40000 ALTER TABLE `periodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `CPF` int NOT NULL,
  `Nome` varchar(45) NOT NULL,
  `DataNascimento` varchar(45) DEFAULT NULL,
  `Email` varchar(45) DEFAULT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (26,'David','25/12/2015','david.manoel2020@live.com','Liberado'),(35,'Marcos','25/12/2015','marcos.araujo2022@hotmal.com','Suspenso'),(48,'Maria','30/10/2005','maria.livramento2021@gmail.com','Liberado'),(53,'Ana Paula','1/10/1991','ana.paula4521@live.com','Liberado'),(67,'Alessandra','12/12/2012','alessandra.mendes@uol.com','Suspenso'),(79,'Felipe','14/08/1998','felipe.souza1456@terra.com','Liberado'),(545,'CArlos','08/11/91','j.carlos2020@live.com','Liberado');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `área`
--

DROP TABLE IF EXISTS `área`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `área` (
  `idAreaConhecimento` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(45) NOT NULL,
  PRIMARY KEY (`idAreaConhecimento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `área`
--

LOCK TABLES `área` WRITE;
/*!40000 ALTER TABLE `área` DISABLE KEYS */;
INSERT INTO `área` VALUES (1,'Drama'),(2,'Ficcao Cientifica'),(3,'Romance'),(4,'Ciências');
/*!40000 ALTER TABLE `área` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'mydb'
--
/*!50003 DROP PROCEDURE IF EXISTS `cadastro_area` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastro_area`(IN Nome_Area VARCHAR(45))
BEGIN
	IF NOT EXISTS (
		SELECT Descricao
        FROM área
        WHERE Descricao = Nome_Area
		) THEN
        INSERT INTO `área` (`Descricao`) VALUES (Nome_Area);    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastro_autor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastro_autor`(IN Nome_Autor VARCHAR(45))
BEGIN
    IF NOT EXISTS (
		SELECT NomeAutor
        FROM autor
        WHERE NomeAutor = Nome_Autor
		) THEN
        INSERT INTO `autor` (`NomeAutor`) VALUES (Nome_Autor);    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastro_editora` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastro_editora`(IN Nome_Editora VARCHAR(45))
BEGIN
	IF NOT EXISTS (
		SELECT NomeEditora
        FROM editora
        WHERE NomeEditora = Nome_Editora
		) THEN
        INSERT INTO `editora` (`NomeEditora`) VALUES (Nome_Editora);    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastro_livro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastro_livro`(IN Num_ISBN INT, IN NomeLivro VARCHAR(45), IN Status_Livro VARCHAR(15), IN id_Area_Conhecimento VARCHAR(45), in Num_Edicao INT, IN id_Editora VARCHAR(45), IN Ano_Publicacao INT, IN Pais_Publicacao VARCHAR(15), IN Nome_Autor VARCHAR(45))
BEGIN
	
    DECLARE AutorId INT;
        
    IF NOT EXISTS (
		SELECT NomeAutor
        FROM autor
        WHERE NomeAutor = Nome_Autor
        ) THEN
        INSERT INTO `autor` (`NomeAutor`) VALUES (Nome_Autor);
        
        SELECT idAutor INTO AutorId FROM mydb.autor WHERE NomeAutor = Nome_Autor;
		INSERT INTO `livro` (`ISBN`, `Titulo`, `StatusLivro`, `idAreaConhecimento`, `NumEdicao`, `idEditora`, `AnoPublicacao`, `PaisPublicacao`, `idAutor`)
		VALUES (Num_ISBN, NomeLivro, Status_Livro, id_Area_Conhecimento, Num_Edicao, id_Editora, Ano_Publicacao, Pais_Publicacao, AutorId);
        
	END IF;
    
    IF EXISTS (
        SELECT NomeAutor
        FROM autor
        WHERE NomeAutor = Nome_Autor
		) THEN
    
		SELECT idAutor INTO AutorId FROM autor WHERE NomeAutor = Nome_Autor;
		INSERT INTO `livro` (`ISBN`, `Titulo`, `StatusLivro`, `idAreaConhecimento`, `NumEdicao`, `idEditora`, `AnoPublicacao`, `PaisPublicacao`, `idAutor`)
		VALUES (Num_ISBN, NomeLivro, Status_Livro, id_Area_Conhecimento, Num_Edicao, id_Editora, Ano_Publicacao, Pais_Publicacao, AutorId);
    END IF;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `cadastro_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `cadastro_usuario`(IN CPFUsuario INT, IN NomeUsuario VARCHAR(45), IN Data_Nascimento VARCHAR(45), IN EmailUsuario VARCHAR(45), IN StatusUsuario VARCHAR(45))
BEGIN
	IF NOT EXISTS (
		SELECT CPF
        FROM usuario
        WHERE CPF = CPFUSUARIO
		) THEN
        INSERT INTO `usuario` (`CPF`, `Nome`, `DataNascimento`, `Email`, `Status`) VALUES (CPFUsuario, NomeUsuario, Data_Nascimento, EmailUsuario, StatusUsuario);    
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `consultaLivro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultaLivro`(IN NomeLivro VARCHAR(45))
BEGIN
	SELECT idLivro, ISBN, Titulo, StatusLivro, Descricao, NomeAutor, NumEdicao, AnoPublicacao, PaisPublicacao, NomeEditora
    FROM livro, autor, área, editora
    WHERE Titulo like NomeLivro AND livro.idAutor = autor.idAutor AND livro.idAreaConhecimento = área.idAreaConhecimento AND livro.idEditora = editora.idEditora;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `emprestimoLivro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `emprestimoLivro`(IN CPFUsuario INT, IN IDLivro INT, IN DataAtual VARCHAR(45), IN Data_PREV_Devolucao VARCHAR(45))
BEGIN
	
    IF EXISTS (
		SELECT CPF, idLivro
        FROM usuario, livro
        WHERE usuario.CPF like CPFUsuario AND livro.idLivro like IDLivro
		) THEN
        
        INSERT INTO `periodo` (`DataEmprestimo`, `DataPrevistaDevolucao`) VALUES (DataAtual, Data_PREV_Devolucao);
        INSERT INTO `emprestimo` (`CPF`, `DataEmprestimo`, `idLivro`) VALUES (CPFUsuario, DataAtual, IDLivro);
        
        UPDATE livro, usuario
		SET livro.StatusLivro = 'Indisponivel'
		WHERE usuario.CPF = CPFUsuario AND livro.idLivro = IDLivro;
        
        # EXEMPLO DE ENTRADA: call emprestimoLivro(26, 15, '25-08-20', '09-07-20');
        
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `consultaarea`
--

/*!50001 DROP VIEW IF EXISTS `consultaarea`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultaarea` AS select `área`.`idAreaConhecimento` AS `idAreaConhecimento`,`área`.`Descricao` AS `Descricao` from `área` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `consultalivro`
--

/*!50001 DROP VIEW IF EXISTS `consultalivro`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `consultalivro` AS select `livro`.`idLivro` AS `idLivro`,`livro`.`ISBN` AS `ISBN`,`livro`.`Titulo` AS `Titulo`,`livro`.`StatusLivro` AS `StatusLivro`,`livro`.`idAreaConhecimento` AS `idAreaConhecimento`,`livro`.`NumEdicao` AS `NumEdicao`,`livro`.`idEditora` AS `idEditora`,`livro`.`AnoPublicacao` AS `AnoPublicacao`,`livro`.`PaisPublicacao` AS `PaisPublicacao`,`livro`.`idAutor` AS `idAutor` from `livro` where (`livro`.`idLivro` = 20) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-19 21:22:12

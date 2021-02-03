-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 26, 2021 at 02:32 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `psi_hotelweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `t_aptos`
--

CREATE TABLE `t_aptos` (
  `ID` int(11) NOT NULL,
  `APTO` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `ID_TIPO` int(11) NOT NULL,
  `DESCRICAO` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `ID_SITUACAO` int(11) NOT NULL,
  `DIARIA` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_aptos`
--

INSERT INTO `t_aptos` (`ID`, `APTO`, `ID_TIPO`, `DESCRICAO`, `ID_SITUACAO`, `DIARIA`) VALUES
(1, '01', 1, 'APTO C/ VENTILADOR DE TETO', 1, '000002'),
(2, '02', 1, 'APTO C/ VENTILADOR DE TETO', 0, ''),
(3, '03', 2, 'APTO C/ AR-CONDICIONADO E FRIGOBAR', 3, '000052'),
(4, '04', 2, 'APTO C/ AR-CONDICIONADO E FRIGOBAR', 0, ''),
(5, '05', 1, 'APTO C/ VENTILADOR DE TETO', 1, '000022'),
(6, '06', 1, 'APTO C/ VENTILADOR DE TETO', 7, '000053'),
(7, '07', 3, 'APTO C/ AR-CONDICIONADO, FRIGOBAR E SAUNA', 0, ''),
(8, '08', 3, 'APTO C/ AR-CONDICIONADO, FRIGOBAR E SAUNA', 0, ''),
(9, '09', 4, 'APTO C/ AR-CONDICIONADO, FRIGOBAR, SAUNA E HIDRO', 8, ''),
(10, '10', 4, 'APTO C/ AR-CONDICIONADO, FRIGOBAR, SAUNA E HIDRO 	', 4, '000004'),
(11, '11', 4, 'APTO C/ AR-CONDICIONADO, FRIGOBAR, SAUNA E HIDRO 	', 0, ''),
(12, '12', 4, 'APTO C/ AR-CONDICIONADO, FRIGOBAR, SAUNA E HIDRO 	', 0, ''),
(13, '13', 1, 'APTO C/ VENTILADOR DE TETO', 0, ''),
(14, '14', 1, 'APTO C/ VENTILADOR DE TETO', 7, '000001'),
(15, '15', 2, 'APTO C/ AR-CONDICIONADO E FRIGOBAR', 4, '000003'),
(16, '16', 2, 'APTO C/ AR-CONDICIONADO E FRIGOBAR', 0, ''),
(17, '17', 3, 'APTO C/ AR-CONDICIONADO, FRIGOBAR E SAUNA', 9, ''),
(18, '18', 3, 'APTO C/ AR-CONDICIONADO, FRIGOBAR E SAUNA', 9, '');

-- --------------------------------------------------------

--
-- Table structure for table `t_contas`
--

CREATE TABLE `t_contas` (
  `ID` int(11) NOT NULL,
  `CONTA` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `SALDO` double NOT NULL,
  `DC` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_contas`
--

INSERT INTO `t_contas` (`ID`, `CONTA`, `SALDO`, `DC`) VALUES
(1, 'RECEITAS', 0, 'D'),
(2, 'DESPESAS', 0, 'C'),
(3, 'VENDAS A VISTA (DINHEIRO)', 0, 'D'),
(4, 'VENDAS A PRAZO (CARTÃO DE CRÉD', 0, 'D'),
(5, 'ÁGUA, LUZ, TELEFONE E INTERNET', 0, 'C'),
(6, 'FOLHA DE PAGTO - FUNCIONARIOS', 0, 'C'),
(7, 'TAXAS E IMPOSTOS', 0, 'C'),
(8, 'MATERIAL DE LIMPEZA', 0, 'C'),
(9, 'PRODUTOS DE COPA E ARMARINHO', 0, 'C'),
(10, 'OUTRAS DESPESAS, ETC', 0, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `t_diarias`
--

CREATE TABLE `t_diarias` (
  `ID` int(11) NOT NULL,
  `ID_APTO` int(11) NOT NULL,
  `TIPO_LOCACAO` int(11) NOT NULL,
  `ID_ENTRADA` int(11) NOT NULL,
  `ID_SAIDA` int(11) NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_diarias`
--

INSERT INTO `t_diarias` (`ID`, `ID_APTO`, `TIPO_LOCACAO`, `ID_ENTRADA`, `ID_SAIDA`, `CHV`) VALUES
(1, 14, 0, 1, 0, 'A'),
(2, 1, 0, 2, 0, 'A'),
(3, 15, 3, 3, 0, 'A'),
(4, 10, 3, 4, 0, 'A');

-- --------------------------------------------------------

--
-- Table structure for table `t_entradas`
--

CREATE TABLE `t_entradas` (
  `ID` int(11) NOT NULL,
  `ID_DIARIA` int(11) NOT NULL,
  `DT_ENTRADA` date NOT NULL,
  `HR_ENTRADA` time NOT NULL,
  `RC_ENTRADA` int(11) NOT NULL,
  `VR_ENTRADA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_entradas`
--

INSERT INTO `t_entradas` (`ID`, `ID_DIARIA`, `DT_ENTRADA`, `HR_ENTRADA`, `RC_ENTRADA`, `VR_ENTRADA`) VALUES
(1, 1, '2021-01-25', '20:16:50', 1, 0),
(2, 2, '2021-01-26', '09:24:03', 1, 100),
(3, 3, '2021-01-26', '09:32:29', 1, 100),
(4, 4, '2021-01-26', '09:54:40', 1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `t_feriados`
--

CREATE TABLE `t_feriados` (
  `ID` int(11) NOT NULL,
  `DATA` date NOT NULL,
  `DESCRICAO` varchar(30) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_feriados`
--

INSERT INTO `t_feriados` (`ID`, `DATA`, `DESCRICAO`) VALUES
(1, '2021-01-01', 'ANO NOVO'),
(2, '2021-01-25', 'CARNAVAL'),
(3, '2021-04-10', 'SEXTA FEIRA DA PAIXÃO'),
(4, '2021-04-21', 'TIRADENTES'),
(5, '2021-05-01', 'DIA DO TRABALHADOR'),
(6, '2021-06-20', 'CORPUS CHRISTI'),
(7, '2021-06-12', 'DIA DOS NAMORADOS'),
(8, '2021-09-07', 'INDEPENDÊNCIA DO BRASIL'),
(9, '2021-10-12', 'N. SRA. APARECIDA'),
(10, '2021-11-02', 'DIA DE FINADOS'),
(11, '2021-11-15', 'PROCLAMAÇÃO DA REPÚBLICA'),
(12, '2021-12-12', 'ANIVERSÁRIO DE BH'),
(13, '2021-12-25', 'NATAL'),
(14, '2021-12-31', 'FIM DE ANO (ANO NOVO)');

-- --------------------------------------------------------

--
-- Table structure for table `t_fornecedores`
--

CREATE TABLE `t_fornecedores` (
  `ID` int(11) NOT NULL,
  `FORNECEDOR` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `EMAIL` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `TELEFONE` varchar(18) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_fornecedores`
--

INSERT INTO `t_fornecedores` (`ID`, `FORNECEDOR`, `EMAIL`, `TELEFONE`) VALUES
(1, 'RM DISTRIBUIDORA LTDA', 'contato@rmdistribuidora.com.br', '(31) 98080-0000'),
(2, 'ABC ATACADO E VAREJO LTDA', 'contato@abcatacado.com.br', '(31) 0800-113-000'),
(3, 'COMERCIAL JM LTDA', 'comercialjm@gmail.com', '(31) 4040-8000');

-- --------------------------------------------------------

--
-- Table structure for table `t_itensdevenda`
--

CREATE TABLE `t_itensdevenda` (
  `ID` int(11) NOT NULL,
  `ID_VENDA` int(11) NOT NULL,
  `ID_PRODUTO` int(11) NOT NULL,
  `QTD` int(11) NOT NULL,
  `VALOR_UN` double NOT NULL,
  `VALOR_TOTAL` double NOT NULL,
  `ID_USUARIO` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_itensdevenda`
--

INSERT INTO `t_itensdevenda` (`ID`, `ID_VENDA`, `ID_PRODUTO`, `QTD`, `VALOR_UN`, `VALOR_TOTAL`, `ID_USUARIO`) VALUES
(1, 1, 47, 2, 1.99, 3.98, 1),
(2, 1, 34, 1, 7.5, 7.5, 1),
(3, 1, 36, 1, 10, 10, 1),
(4, 2, 34, 2, 7.5, 15, 1),
(5, 2, 18, 1, 29.99, 29.99, 1),
(6, 3, 34, 1, 7.5, 7.5, 2),
(7, 4, 47, 1, 1.99, 1.99, 2),
(8, 4, 22, 1, 7, 7, 2),
(9, 4, 14, 1, 18, 18, 2),
(10, 4, 38, 2, 5, 10, 2),
(11, 5, 47, 2, 1.99, 3.98, 2),
(12, 6, 34, 2, 7.5, 15, 2),
(13, 6, 18, 1, 29.99, 29.99, 2),
(14, 7, 34, 1, 7.5, 7.5, 1),
(15, 7, 47, 1, 3, 3, 1),
(16, 7, 38, 1, 5, 5, 1),
(17, 8, 49, 1, 30, 30, 1),
(18, 8, 50, 1, 15, 15, 1),
(19, 8, 48, 2, 4.5, 9, 1),
(20, 8, 34, 2, 7.5, 15, 1),
(21, 8, 18, 1, 29.99, 29.99, 1),
(22, 9, 49, 1, 30, 30, 1),
(23, 9, 50, 2, 15, 30, 1),
(24, 9, 48, 1, 4.5, 4.5, 1),
(25, 9, 34, 2, 7.5, 15, 1),
(26, 10, 49, 1, 30, 30, 1),
(27, 10, 34, 1, 7.5, 7.5, 1),
(28, 11, 49, 1, 30, 30, 1),
(29, 11, 48, 1, 4.5, 4.5, 1),
(30, 11, 34, 2, 7.5, 15, 1),
(31, 11, 18, 1, 29.99, 29.99, 1),
(32, 0, 47, 1, 3, 3, 1),
(33, 0, 34, 2, 7.5, 15, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_lancamentos`
--

CREATE TABLE `t_lancamentos` (
  `ID` int(11) NOT NULL,
  `DATA` date NOT NULL,
  `HISTORICO` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `VALOR` double(10,2) NOT NULL,
  `TIPO` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `ID_CONTA` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_lancamentos`
--

INSERT INTO `t_lancamentos` (`ID`, `DATA`, `HISTORICO`, `VALOR`, `TIPO`, `ID_USUARIO`, `ID_CONTA`) VALUES
(1, '2020-12-13', 'RECEITAS C/ VENDAS EM DINHEIRO', 1500.00, 'D', 1, 1),
(2, '2020-12-13', 'RECEITAS C/ CARTAO DE CREDITO', 800.00, 'D', 1, 4),
(3, '2020-12-13', 'PGTO CEMIG', 138.55, 'C', 1, 5),
(4, '2020-12-01', 'PGTO FORNEC. GÁS', 188.00, 'C', 1, 2),
(5, '2020-12-12', 'PGTO VALE FUNCIONARIOS', 150.00, 'C', 1, 6),
(6, '2020-12-12', 'DESPESAS C/ MATERIAL DE LIMPEZA', 80.00, 'C', 1, 8),
(8, '2020-12-15', 'VENDAS A VISTA', 1885.00, 'D', 1, 1),
(13, '2020-12-16', 'PAGO ISS/COFINS', 185.00, 'C', 1, 7),
(14, '2020-12-26', 'PAGO CONTA LUZ CEMIG REF. DEZEMBRO DE 2020', 135.00, 'C', 1, 5),
(15, '2020-12-29', 'VENDA Nº 000001 - EZEQUIAS MARTINS', 21.48, 'D', 1, 1),
(16, '2020-12-29', 'VENDA Nº 000002 - EZEQUIAS MARTINS', 44.99, 'D', 1, 1),
(17, '2020-12-29', 'VENDA Nº 000003 - JOSÉ CARLOS', 7.50, 'D', 2, 1),
(18, '2021-01-06', 'VENDA Nº 000006 - JOSÉ CARLOS', 44.99, 'D', 2, 1),
(19, '2021-01-06', 'VENDA Nº 000007 - EZEQUIAS MARTINS', 15.50, 'D', 1, 1),
(20, '2021-01-06', 'VENDA Nº 000008 - EZEQUIAS MARTINS', 98.99, 'D', 1, 1),
(21, '2021-01-06', 'VENDA Nº 000009 - EZEQUIAS MARTINS', 79.50, 'D', 1, 1),
(22, '2021-01-06', 'VENDA Nº 000010 - EZEQUIAS MARTINS', 37.50, 'D', 1, 1),
(23, '2021-01-08', 'VENDA Nº 000011 - EZEQUIAS MARTINS', 79.49, 'D', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_produtos`
--

CREATE TABLE `t_produtos` (
  `ID` int(11) NOT NULL,
  `PRODUTO` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `IMAGEM` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ESTQ_ATUAL` int(11) NOT NULL,
  `UNIDADE` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `VALOR` double(10,2) NOT NULL,
  `ID_FORNECEDOR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_produtos`
--

INSERT INTO `t_produtos` (`ID`, `PRODUTO`, `IMAGEM`, `ESTQ_ATUAL`, `UNIDADE`, `VALOR`, `ID_FORNECEDOR`) VALUES
(14, 'LASANHA BOLONHESA', '000014.jpg', 9, 'UN', 18.00, 3),
(18, 'PORÇÃO FRANGO PASSARINHO C/ FRITAS', '000018.jpg', 5, 'PC', 29.99, 2),
(19, 'GUARANÁ ANTÁRTICA LATA 350 ML', '000019.jpg', 80, 'UN', 5.00, 1),
(22, 'WHISKY OLD EIGTH (DOSE)', '000054.jpg', 99, 'UN', 7.00, 1),
(34, 'CERVEJA LATA 350 ML', '000034.jpg', 172, 'UN', 7.50, 2),
(36, 'HAMBÚGUER ', '000036.jpg', 13, 'UN', 10.00, 2),
(38, 'COCA COLA LATA 350 ML', '000038.jpg', 75, 'UN', 5.00, 1),
(39, 'LASANHA 4 QUEIJOS', '000039.jpg', 13, 'UN', 18.00, 3),
(46, 'CHEESEBURGUER', '000046.jpg', 98, 'UN', 1.99, 2),
(47, 'ÁGUA MINERAL SEM GÁS 200ML', '000047.jpg', 71, 'UN', 3.00, 1),
(48, 'ÁGUA MINERAL GASOSA 300 ML', '000048.jpg', 96, 'UN', 4.50, 2);

-- --------------------------------------------------------

--
-- Table structure for table `t_saidas`
--

CREATE TABLE `t_saidas` (
  `ID` int(11) NOT NULL,
  `ID_DIARIA` int(11) NOT NULL,
  `DT_SAIDA` date NOT NULL,
  `HR_SAIDA` time NOT NULL,
  `RC_SAIDA` int(11) NOT NULL,
  `VR_SAIDA` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `t_situacao`
--

CREATE TABLE `t_situacao` (
  `ID` int(11) NOT NULL,
  `SITUACAO` varchar(18) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_situacao`
--

INSERT INTO `t_situacao` (`ID`, `SITUACAO`) VALUES
(0, 'LIVRE'),
(1, 'HORA'),
(2, 'PERNOITE'),
(3, 'DIÁRIA'),
(4, 'PROMO 2H'),
(5, 'PROMO 3H'),
(6, '24H'),
(7, 'EM ARRUMAÇÃO'),
(8, 'MANUTENÇÃO'),
(9, 'RESERVADO');

-- --------------------------------------------------------

--
-- Table structure for table `t_tabeladeprecos`
--

CREATE TABLE `t_tabeladeprecos` (
  `ID` int(11) NOT NULL,
  `ID_TIPO` int(18) NOT NULL,
  `DESCRICAO` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `TABELA` varchar(1) COLLATE utf8_unicode_ci NOT NULL,
  `HORA` double NOT NULL,
  `HORA_EXCED` double NOT NULL,
  `PERNOITE` double NOT NULL,
  `P_ENTRADA` time NOT NULL,
  `P_SAIDA` time NOT NULL,
  `DIARIA` double NOT NULL,
  `D_ENTRADA` time NOT NULL,
  `D_SAIDA` time NOT NULL,
  `PROMO_2H` double NOT NULL,
  `PROMO_3H` double NOT NULL,
  `24H` double NOT NULL,
  `I_DIA` int(11) NOT NULL,
  `I_HORA` time NOT NULL,
  `T_DIA` int(11) NOT NULL,
  `T_HORA` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_tabeladeprecos`
--

INSERT INTO `t_tabeladeprecos` (`ID`, `ID_TIPO`, `DESCRICAO`, `TABELA`, `HORA`, `HORA_EXCED`, `PERNOITE`, `P_ENTRADA`, `P_SAIDA`, `DIARIA`, `D_ENTRADA`, `D_SAIDA`, `PROMO_2H`, `PROMO_3H`, `24H`, `I_DIA`, `I_HORA`, `T_DIA`, `T_HORA`) VALUES
(1, 1, 'TABELA DE DOMINGO A QUINTA', 'A', 30, 10, 40, '19:00:00', '12:00:00', 40, '07:00:00', '17:00:00', 35, 45, 80, 1, '07:00:00', 5, '23:59:00'),
(2, 1, 'TABELA DE FIM DE SEMANA', 'B', 40, 15, 50, '23:00:00', '12:00:00', 50, '07:00:00', '17:00:00', 45, 55, 100, 6, '00:00:00', 1, '06:59:00'),
(3, 2, 'TABELA DE DOMINGO A QUINTA', 'A', 45, 15, 60, '19:00:00', '12:00:00', 60, '07:00:00', '17:00:00', 50, 60, 120, 1, '00:00:00', 5, '23:59:00'),
(4, 2, 'TABELA DE FIM DE SEMANA', 'B', 50, 20, 70, '19:00:00', '12:00:00', 70, '07:00:00', '17:00:00', 60, 70, 140, 6, '00:00:00', 1, '23:59:00');

-- --------------------------------------------------------

--
-- Table structure for table `t_tipos`
--

CREATE TABLE `t_tipos` (
  `ID` int(11) NOT NULL,
  `TIPO` varchar(18) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_tipos`
--

INSERT INTO `t_tipos` (`ID`, `TIPO`) VALUES
(1, 'APTO SIMPLES'),
(2, 'APTO LUXO'),
(3, 'APTO SUPER-LUXO'),
(4, 'SUÍTE ESPECIAL');

-- --------------------------------------------------------

--
-- Table structure for table `t_usuarios`
--

CREATE TABLE `t_usuarios` (
  `ID` int(11) NOT NULL,
  `NOME` varchar(35) COLLATE utf8_unicode_ci NOT NULL,
  `FUNCAO` varchar(18) COLLATE utf8_unicode_ci NOT NULL,
  `USUARIO` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `SENHA` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `NIVEL` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_usuarios`
--

INSERT INTO `t_usuarios` (`ID`, `NOME`, `FUNCAO`, `USUARIO`, `SENHA`, `NIVEL`) VALUES
(1, 'EZEQUIAS MARTINS', 'SUPORTE TÉCNICO', 'SUPORTE', '*1A030512019B7B4B97167D5515EBB6C7105EB12F', 9),
(2, 'JOSÉ CARLOS', 'ADMINISTRADOR', 'GERENTE', '*FEBD3F175627C983536CFD57AC42DE8D823AAD91', 7),
(3, 'ANA MARIA', 'OPERADORA', 'DIARISTA', '*4CB947971FACB7AB4E93FAF2078DD186A4C91A46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `t_vendas`
--

CREATE TABLE `t_vendas` (
  `ID` int(11) NOT NULL,
  `ID_USUARIO` int(11) NOT NULL,
  `DATA` date NOT NULL,
  `VALOR_TOTAL` double(10,2) NOT NULL,
  `CHV` varchar(1) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `t_vendas`
--

INSERT INTO `t_vendas` (`ID`, `ID_USUARIO`, `DATA`, `VALOR_TOTAL`, `CHV`) VALUES
(1, 1, '2020-12-29', 21.48, 'F'),
(2, 1, '2020-12-29', 44.99, 'F'),
(3, 2, '2020-12-29', 7.50, 'F'),
(4, 2, '2020-12-29', 36.99, 'F'),
(5, 2, '2020-12-29', 3.98, 'F'),
(6, 2, '2021-01-06', 44.99, 'F'),
(7, 1, '2021-01-06', 15.50, 'F'),
(8, 1, '2021-01-06', 98.99, 'F'),
(9, 1, '2021-01-06', 79.50, 'F'),
(10, 1, '2021-01-06', 37.50, 'F'),
(11, 1, '2021-01-08', 79.49, 'F');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `t_aptos`
--
ALTER TABLE `t_aptos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_contas`
--
ALTER TABLE `t_contas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_diarias`
--
ALTER TABLE `t_diarias`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_entradas`
--
ALTER TABLE `t_entradas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_feriados`
--
ALTER TABLE `t_feriados`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_fornecedores`
--
ALTER TABLE `t_fornecedores`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_itensdevenda`
--
ALTER TABLE `t_itensdevenda`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_lancamentos`
--
ALTER TABLE `t_lancamentos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_produtos`
--
ALTER TABLE `t_produtos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_saidas`
--
ALTER TABLE `t_saidas`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_situacao`
--
ALTER TABLE `t_situacao`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_tabeladeprecos`
--
ALTER TABLE `t_tabeladeprecos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_tipos`
--
ALTER TABLE `t_tipos`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_usuarios`
--
ALTER TABLE `t_usuarios`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `t_vendas`
--
ALTER TABLE `t_vendas`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `t_aptos`
--
ALTER TABLE `t_aptos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `t_contas`
--
ALTER TABLE `t_contas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `t_diarias`
--
ALTER TABLE `t_diarias`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_entradas`
--
ALTER TABLE `t_entradas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_feriados`
--
ALTER TABLE `t_feriados`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `t_fornecedores`
--
ALTER TABLE `t_fornecedores`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_itensdevenda`
--
ALTER TABLE `t_itensdevenda`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `t_lancamentos`
--
ALTER TABLE `t_lancamentos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `t_produtos`
--
ALTER TABLE `t_produtos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `t_saidas`
--
ALTER TABLE `t_saidas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `t_situacao`
--
ALTER TABLE `t_situacao`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `t_tabeladeprecos`
--
ALTER TABLE `t_tabeladeprecos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_tipos`
--
ALTER TABLE `t_tipos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `t_usuarios`
--
ALTER TABLE `t_usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `t_vendas`
--
ALTER TABLE `t_vendas`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

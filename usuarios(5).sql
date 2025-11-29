-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2025 at 03:27 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `usuarios`
--

-- --------------------------------------------------------

--
-- Table structure for table `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `uf` varchar(2) NOT NULL,
  `cidade` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome`, `cnpj`, `uf`, `cidade`) VALUES
(1, 'Tomas Turbo', '213952345234', 'SP', 'Mogi das Cruzes'),
(2, 'Brixx ', '345323456', 'BA', 'Salvador');

-- --------------------------------------------------------

--
-- Table structure for table `ordens`
--

CREATE TABLE `ordens` (
  `id` int(11) NOT NULL,
  `numero_ordem` int(11) NOT NULL,
  `id_fornecedor` int(11) NOT NULL,
  `placa` varchar(10) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `fornecedor_id` int(11) DEFAULT NULL,
  `data` date NOT NULL,
  `status` varchar(20) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ordens`
--

INSERT INTO `ordens` (`id`, `numero_ordem`, `id_fornecedor`, `placa`, `modelo`, `fornecedor_id`, `data`, `status`, `descricao`) VALUES
(2, 1, 1, 'DXJ5I30', 'CB Twister', NULL, '2005-10-11', 'Concluída', 'preventiva'),
(3, 2, 1, 'RTE3I67', 'CG TITAN ', NULL, '2024-12-22', 'Encerrada', 'motor'),
(4, 3, 2, 'XLE3D32', 'Polo Track', NULL, '2020-03-02', 'Em andamento', 'motor'),
(5, 4, 2, 'TFG4D34', 'VW Virtus', NULL, '2025-10-12', 'Aberta', 'revisão');

-- --------------------------------------------------------

--
-- Table structure for table `os`
--

CREATE TABLE `os` (
  `id` int(11) NOT NULL,
  `id_ordem` int(11) NOT NULL,
  `tipo_os` varchar(50) NOT NULL,
  `descricao` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `os`
--

INSERT INTO `os` (`id`, `id_ordem`, `tipo_os`, `descricao`) VALUES
(1, 2, 'sinistro', 'colisão'),
(2, 2, 'corretiva', 'freio'),
(3, 4, 'preventiva', 'troca de óleo'),
(4, 5, 'preventiva', 'troce de óleo');

-- --------------------------------------------------------

--
-- Table structure for table `os_itens`
--

CREATE TABLE `os_itens` (
  `id` int(11) NOT NULL,
  `id_os` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `descricao` text NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `os_itens`
--

INSERT INTO `os_itens` (`id`, `id_os`, `tipo`, `descricao`, `quantidade`, `valor`) VALUES
(1, 1, 'Peça', 'Parachoque dianteiro ', 1, 600.00),
(2, 1, 'Mão de obra', 'pintura parachoque dianteiro', 1, 250.00),
(3, 1, 'Mão de obra', 'troca parachoque dianteiro', 1, 120.00),
(4, 4, 'Peça', 'Óleo 5w30 (flex)', 4, 25.00),
(5, 4, 'Mão de obra', 'revisão', 1, 40.00);

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `sobrenome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `sobrenome`, `email`, `senha`) VALUES
(1, 'Renan', 'Monteiro', 'renan@umc.br', '0000'),
(2, 'rafael', 'amorim', 'rafa@gmail.com', '00000');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cnpj` (`cnpj`);

--
-- Indexes for table `ordens`
--
ALTER TABLE `ordens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_ordem_fornecedor` (`id_fornecedor`);

--
-- Indexes for table `os`
--
ALTER TABLE `os`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_os_ordem` (`id_ordem`);

--
-- Indexes for table `os_itens`
--
ALTER TABLE `os_itens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_os` (`id_os`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ordens`
--
ALTER TABLE `ordens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `os`
--
ALTER TABLE `os`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `os_itens`
--
ALTER TABLE `os_itens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ordens`
--
ALTER TABLE `ordens`
  ADD CONSTRAINT `fk_ordem_fornecedor` FOREIGN KEY (`id_fornecedor`) REFERENCES `fornecedores` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `os`
--
ALTER TABLE `os`
  ADD CONSTRAINT `fk_os_ordem` FOREIGN KEY (`id_ordem`) REFERENCES `ordens` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `os_itens`
--
ALTER TABLE `os_itens`
  ADD CONSTRAINT `os_itens_ibfk_1` FOREIGN KEY (`id_os`) REFERENCES `os` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

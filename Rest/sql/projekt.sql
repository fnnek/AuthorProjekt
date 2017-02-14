-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Czas generowania: 14 Lut 2017, 15:27
-- Wersja serwera: 10.1.19-MariaDB
-- Wersja PHP: 5.6.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `projekt`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `kategorie`
--

CREATE TABLE `kategorie` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `kategorie`
--

INSERT INTO `kategorie` (`id`, `nazwa`) VALUES
(1, 'news'),
(2, 'artykul'),
(3, 'opowiadanie'),
(4, 'Informacja');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `komentarze`
--

CREATE TABLE `komentarze` (
  `id` int(11) NOT NULL,
  `id_wpisu` int(11) NOT NULL,
  `autor` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL,
  `data` date NOT NULL,
  `tresc` varchar(500) CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `komentarze`
--

INSERT INTO `komentarze` (`id`, `id_wpisu`, `autor`, `data`, `tresc`) VALUES
(1, 1, 'Kowalski', '2017-02-03', 'Jakiś tam komentarz'),
(2, 4, 'Kowalski', '2017-02-03', 'Komentarz 1'),
(3, 4, 'Kowalski', '2017-02-03', 'komentarz 2'),
(5, 0, 'Kowalski', '2017-02-02', 'Tresc kom'),
(6, 0, 'Kowalski', '2017-02-02', 'Tresc kom'),
(7, 0, 'Kowalski', '2017-02-02', 'Tresc kom 2'),
(8, 1, 'Nowak', '2017-01-25', 'Komentarz do artykułu'),
(19, 1, 'Nick', '2017-01-02', 'Komentarz'),
(20, 7, 'Nick', '2017-01-02', 'Komentarz'),
(21, 7, 'Nick', '2017-01-02', 'Komentarz'),
(22, 7, 'Nick', '2017-01-02', 'Komentarz 2'),
(23, 10, 'Nick', '2017-01-02', 'Komentarz'),
(24, 6, 'Nick', '2017-01-02', 'Komentarz'),
(25, 11, 'Nick', '2017-01-02', 'Komentarz'),
(26, 12, 'nick', '2017-01-02', 'Komentarz'),
(27, 13, 'Nick', '2017-01-02', 'Komentarz inny'),
(29, 5, 'Nic', '2017-01-02', 'Nic'),
(30, 8, 'Nick', '2017-01-03', 'Komentarz'),
(36, 5, 'ś', '2017-02-09', 'ś'),
(37, 1, 'Bożek', '2017-01-10', 'Treść'),
(38, 1, 'Bożek', '2017-01-01', 'Komentarz'),
(39, 14, 'Komentarz', '2017-01-01', 'Komentarz usunięty przez moderatora');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `ksiazki`
--

CREATE TABLE `ksiazki` (
  `id` int(11) NOT NULL,
  `tytul` varchar(50) CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL,
  `tresc` text CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL,
  `okladka` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `ksiazki`
--

INSERT INTO `ksiazki` (`id`, `tytul`, `tresc`, `okladka`) VALUES
(1, 'Tytuł Książki', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus feugiat tincidunt. Donec libero ex, semper sed viverra nec, viverra in erat. Duis imperdiet felis arcu, a consectetur orci eleifend non. Nulla felis leo, tincidunt nec aliquam vitae, ultrices ut felis. Quisque dolor lorem, egestas sit amet felis vitae, accumsan elementum nibh. Cras sapien nunc, placerat ac ex at, sagittis molestie nisi. Praesent imperdiet sem tincidunt, tempus erat ac, vestibulum odio. Morbi accumsan nunc non urna ultrices blandit sed quis urna.', 'cover1.jpg'),
(2, 'Książka Numer Dwa', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus feugiat tincidunt. Donec libero ex, semper sed viverra nec, viverra in erat. Duis imperdiet felis arcu, a consectetur orci eleifend non. Nulla felis leo, tincidunt nec aliquam vitae, ultrices ut felis. Quisque dolor lorem, egestas sit amet felis vitae, accumsan elementum nibh. Cras sapien nunc, placerat ac ex at, sagittis molestie nisi. Praesent imperdiet sem tincidunt, tempus erat ac, vestibulum odio. Morbi accumsan nunc non urna ultrices blandit sed quis urna.\r\n\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Integer luctus feugiat tincidunt. Donec libero ex, semper sed viverra nec, viverra in erat. Duis imperdiet felis arcu, a consectetur orci eleifend non. Nulla felis leo, tincidunt nec aliquam vitae, ultrices ut felis. Quisque dolor lorem, egestas sit amet felis vitae, accumsan elementum nibh. Cras sapien nunc, placerat ac ex at, sagittis molestie nisi. Praesent imperdiet sem tincidunt, tempus erat ac, vestibulum odio. Morbi accumsan nunc non urna ultrices blandit sed quis urna.', 'cover2.jpg');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(25) CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `menu`
--

INSERT INTO `menu` (`id`, `nazwa`, `link`) VALUES
(1, 'Strona Główna', '#/'),
(2, 'O Autorze', '#/about'),
(3, 'Aktualności', '#/meetings'),
(4, 'Książki', '#/books');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wpisy`
--

CREATE TABLE `wpisy` (
  `id` int(11) NOT NULL,
  `tytul` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL,
  `kategoria` int(11) NOT NULL,
  `tresc` text CHARACTER SET cp1250 COLLATE cp1250_polish_ci NOT NULL,
  `data` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Zrzut danych tabeli `wpisy`
--

INSERT INTO `wpisy` (`id`, `tytul`, `kategoria`, `tresc`, `data`) VALUES
(1, 'Wpis numer 2', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent elementum aliquet quam, eget consequat risus dignissim et. Morbi in neque tristique metus blandit pretium. Donec a nisi volutpat, suscipit orci nec, tempus mauris. Nullam vitae mi ligula. Curabitur et mollis eros. Integer id sollicitudin erat, et iaculis velit. Vivamus vulputate risus et malesuada posuere. Donec nec iaculis urna. In quis laoreet dolor. Sed tincidunt velit eget ex sollicitudin suscipit. Duis elementum venenatis rutrum.\r\n\r\n<img src="images/img1.jpg" alt="Obraz 1"></img>\r\n\r\nAliquam erat volutpat. Ut fringilla eros sed ultricies posuere. Vivamus vel volutpat nibh. Nulla interdum elit et condimentum venenatis. Praesent nec fermentum justo. Vivamus facilisis congue diam, sed maximus tortor maximus vel. Suspendisse bibendum ex id lobortis dictum. Suspendisse tincidunt nunc quis urna porta, a fermentum sapien congue. Duis vel risus commodo, vehicula eros eget, rutrum ipsum. Donec dignissim, orci eu vestibulum fringilla, augue nunc volutpat enim, in malesuada justo massa vitae enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam maximus neque non justo sodales fringilla.\r\n\r\n<img src="images/img2.jpg" alt="Obraz 2"></img>\r\n\r\nQuisque a imperdiet mi. In euismod commodo metus, vel faucibus nibh feugiat sed. Donec congue tellus id lectus sagittis, sit amet sagittis urna faucibus. Mauris et lacus vitae nisl euismod interdum eget ut metus. Fusce tincidunt felis ut enim efficitur egestas. Curabitur condimentum lacus ut mattis pellentesque. Maecenas sem metus, gravida non fringilla id, commodo nec massa. Curabitur sed lacus dapibus, mollis nulla vitae, interdum dolor. Suspendisse iaculis, sapien non pulvinar tincidunt, libero nulla tempor erat, sit amet commodo quam erat et quam. Sed mollis risus felis, vitae bibendum justo accumsan id. Nulla eleifend sem quis consequat vulputate. Vivamus eget orci vitae turpis scelerisque porta. Cras in malesuada nisi. Phasellus malesuada, lacus elementum dapibus facilisis, nisi est laoreet nulla, quis lacinia magna justo eget nunc. Suspendisse potenti.\r\n\r\nVivamus mollis nunc ut condimentum sagittis. Quisque non justo nulla. Nunc velit libero, congue ac porta ut, ultricies vitae urna. Praesent rhoncus lorem ut leo mattis scelerisque. Curabitur sapien nunc, porta quis velit ac, pharetra iaculis massa. Aenean et accumsan lorem, sed bibendum risus. Fusce tempus quis quam sit amet finibus. Donec a pellentesque est. Pellentesque rutrum massa ante, et vestibulum lacus viverra vel. Sed vitae tellus ante. Quisque vitae molestie mauris. Vestibulum sodales, eros at elementum pharetra, arcu erat dignissim lectus, non posuere ipsum neque eu ipsum. Morbi commodo aliquet ex, vitae tempus lectus molestie et. Nulla facilisi. Mauris erat purus, egestas at dapibus sed, maximus et risus. Suspendisse potenti.\r\n\r\nSed sagittis vel elit ut hendrerit. Sed congue consequat suscipit. Nulla venenatis, orci id auctor lobortis, velit nunc iaculis est, sit amet consectetur justo erat quis turpis. Maecenas interdum nisl vitae elit pretium, nec tempor felis euismod. Nullam ac feugiat felis. Donec id ultricies orci. Mauris ac diam mollis, semper enim et, fermentum turpis. Etiam convallis sapien sed arcu varius, in tincidunt eros fringilla. Aliquam erat volutpat. Donec volutpat, magna a porttitor commodo, nisi sapien dictum orci, et placerat erat nulla et velit. Mauris turpis orci, fermentum id rhoncus nec, egestas vitae risus. Nullam volutpat, tortor vitae tincidunt tincidunt, turpis ex convallis arcu, id convallis turpis sem et dolor. In lectus dolor, varius at ornare vel, imperdiet sit amet dolor. In a rhoncus ipsum. Nam vel posuere magna, ac viverra velit. Suspendisse lobortis enim diam.', '2017-02-03'),
(7, 'Spotkanie 17-01-2017', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lorem orci, tempus in consectetur sed, efficitur at nisi. Praesent nisi quam, convallis ac tincidunt auctor, maximus sed justo. Morbi bibendum ac dui sed viverra. Vivamus sed sapien eu nisi efficitur placerat. Nulla pellentesque magna et massa cursus semper. Donec enim nibh, vehicula non vehicula a, egestas in nibh. Nam et hendrerit elit. Suspendisse ut tincidunt orci, ac ultricies dui. Morbi massa leo, accumsan sed neque sit amet, tristique aliquam mi.', '2017-01-12'),
(8, 'Wywiad dla gazety', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lorem orci, tempus in consectetur sed, efficitur at nisi. Praesent nisi quam, convallis ac tincidunt auctor, maximus sed justo. Morbi bibendum ac dui sed viverra. Vivamus sed sapien eu nisi efficitur placerat. Nulla pellentesque magna et massa cursus semper. Donec enim nibh, vehicula non vehicula a, egestas in nibh. Nam et hendrerit elit. Suspendisse ut tincidunt orci, ac ultricies dui. Morbi massa leo, accumsan sed neque sit amet, tristique aliquam mi.', '2017-01-13'),
(11, 'Wywiad', 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lorem orci, tempus in consectetur sed, efficitur at nisi. Praesent nisi quam, convallis ac tincidunt auctor, maximus sed justo. Morbi bibendum ac dui sed viverra. Vivamus sed sapien eu nisi efficitur placerat. Nulla pellentesque magna et massa cursus semper. Donec enim nibh, vehicula non vehicula a, egestas in nibh. Nam et hendrerit elit. Suspendisse ut tincidunt orci, ac ultricies dui. Morbi massa leo, accumsan sed neque sit amet, tristique aliquam mi.', '2017-02-01'),
(12, 'Opowiadanie numer 1', 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a quam vitae justo mollis dignissim sit amet ac enim. Donec hendrerit ligula at lacus sodales pellentesque. Sed dignissim diam ac lectus congue fermentum. Fusce vel sapien sed massa condimentum tristique vitae sed ante. Etiam et diam velit. Vivamus consequat neque turpis, vitae porttitor magna feugiat nec. In hac habitasse platea dictumst. Aenean elementum pretium metus, at pulvinar risus elementum et. Proin venenatis aliquam eros, sed finibus dui gravida non. Integer dapibus turpis rhoncus volutpat maximus. Curabitur tincidunt, mauris et posuere lobortis, velit nisl suscipit magna, sagittis sagittis felis sem dignissim odio. Vivamus eu mi nibh.\r\n\r\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam non dapibus nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam a consectetur orci. Nullam cursus in metus sed rhoncus. Sed suscipit nibh eros, non egestas magna viverra facilisis. Duis neque mi, blandit lacinia tortor et, dictum bibendum ipsum. Sed lobortis hendrerit nisi, eget congue risus sagittis quis. Nulla sed nisi a est imperdiet rutrum. Phasellus neque elit, bibendum sed molestie quis, porta id leo. Ut venenatis, risus quis iaculis tempor, erat erat lobortis erat, eget fermentum purus est vitae est.\r\n\r\nEtiam ut lacinia augue. Nulla ac turpis auctor, rutrum metus quis, lobortis urna. Duis condimentum bibendum ex, eget tempus nibh consectetur ut. Pellentesque odio eros, elementum ac massa id, viverra condimentum augue. Nunc sodales euismod nisi quis vehicula. Sed vitae eros id dui volutpat posuere. Sed eu libero quis lorem iaculis placerat. Phasellus eget feugiat ante, sed luctus lorem. Fusce venenatis dapibus tristique. Fusce tristique massa ut sapien scelerisque, id dapibus quam ornare. Etiam eget vestibulum odio. Integer vitae lacus eu nisi tempus lobortis.\r\n\r\nDuis hendrerit egestas iaculis. Sed venenatis, purus sit amet congue sodales, lacus tellus fringilla justo, ut consectetur ligula lectus quis justo. Nunc tristique metus nec dui volutpat dapibus. Vivamus magna nunc, commodo ac tempus eget, molestie volutpat justo. In imperdiet orci vel nunc venenatis molestie tristique vitae massa. Ut imperdiet sem sodales, finibus enim vel, porttitor elit. Quisque metus ipsum, tincidunt vel pharetra ut, suscipit feugiat neque. Integer viverra magna commodo nulla euismod lacinia. Proin vel hendrerit nisl, in venenatis nulla. Maecenas vehicula ante at sagittis blandit. Mauris a nisi eu massa consequat mollis sit amet vel risus. Nullam mattis mauris est, eu sodales felis commodo ut. Fusce et pellentesque lorem. Sed sit amet mauris finibus, faucibus urna sed, porttitor massa. Proin fermentum, ex sit amet accumsan dignissim, neque dolor bibendum lorem, eget molestie augue est et nibh. Proin scelerisque lacus ac fringilla vestibulum.\r\n\r\nCras eget purus eu orci tincidunt congue sed vitae purus. Nunc at tempor sapien, id egestas nunc. Nam quis lectus sit amet massa malesuada pellentesque ut sit amet velit. Aliquam id magna vehicula, dictum est ac, aliquam nibh. Maecenas lacinia et lorem vitae volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam tristique turpis vitae massa vestibulum scelerisque. Integer accumsan faucibus feugiat. Phasellus et velit commodo, pharetra lorem non, pellentesque magna. In vehicula volutpat quam vel blandit. Aenean convallis, sem sed rhoncus aliquet, dui quam suscipit metus, consectetur sodales enim risus eu diam.\r\n\r\nDonec dictum, augue quis placerat ultrices, mauris nunc pharetra est, nec vehicula diam felis a eros. Maecenas nisi massa, rutrum sed eleifend at, egestas quis orci. Maecenas a erat sit amet tortor fermentum pharetra ac id orci. Praesent quis dictum turpis. Vivamus pharetra velit ac sapien venenatis, vitae consectetur elit posuere. Sed vehicula interdum turpis ut molestie. Vivamus consequat, diam posuere interdum laoreet, orci ligula vehicula urna, sit amet pellentesque sapien eros eleifend eros. Proin id enim arcu. Nunc efficitur bibendum condimentum. Fusce at dictum enim. In hac habitasse platea dictumst. Nullam malesuada bibendum efficitur. Donec laoreet justo nec massa mollis, vel viverra nisi auctor.\r\n\r\nUt et ante porttitor, dictum ex quis, pellentesque ligula. Mauris dui ex, ornare at gravida non, ultricies porttitor dolor. Suspendisse a fermentum mauris. Phasellus odio risus, tempus a dui vel, finibus feugiat est. Maecenas pellentesque, nisi eget laoreet blandit, ex turpis mollis urna, nec aliquet sapien elit eu ante. Nam vitae auctor nisl. Aenean id diam vel ante mollis semper. Vivamus non mauris vitae risus pharetra tincidunt nec et orci. Donec eros enim, imperdiet vitae orci ultrices, lobortis maximus mauris. Maecenas viverra dapibus commodo. Mauris non nunc dignissim, sodales metus non, pulvinar turpis. Donec tristique vel ex id maximus. Morbi feugiat sem sit amet blandit varius. Nam blandit odio non erat convallis dapibus. Aliquam erat volutpat. Proin vestibulum urna at purus aliquam, in ultrices odio sodales.', '2017-01-19'),
(13, 'Opowiadanie numer 2', 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a quam vitae justo mollis dignissim sit amet ac enim. Donec hendrerit ligula at lacus sodales pellentesque. Sed dignissim diam ac lectus congue fermentum. Fusce vel sapien sed massa condimentum tristique vitae sed ante. Etiam et diam velit. Vivamus consequat neque turpis, vitae porttitor magna feugiat nec. In hac habitasse platea dictumst. Aenean elementum pretium metus, at pulvinar risus elementum et. Proin venenatis aliquam eros, sed finibus dui gravida non. Integer dapibus turpis rhoncus volutpat maximus. Curabitur tincidunt, mauris et posuere lobortis, velit nisl suscipit magna, sagittis sagittis felis sem dignissim odio. Vivamus eu mi nibh.\r\n\r\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam non dapibus nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam a consectetur orci. Nullam cursus in metus sed rhoncus. Sed suscipit nibh eros, non egestas magna viverra facilisis. Duis neque mi, blandit lacinia tortor et, dictum bibendum ipsum. Sed lobortis hendrerit nisi, eget congue risus sagittis quis. Nulla sed nisi a est imperdiet rutrum. Phasellus neque elit, bibendum sed molestie quis, porta id leo. Ut venenatis, risus quis iaculis tempor, erat erat lobortis erat, eget fermentum purus est vitae est.\r\n\r\nEtiam ut lacinia augue. Nulla ac turpis auctor, rutrum metus quis, lobortis urna. Duis condimentum bibendum ex, eget tempus nibh consectetur ut. Pellentesque odio eros, elementum ac massa id, viverra condimentum augue. Nunc sodales euismod nisi quis vehicula. Sed vitae eros id dui volutpat posuere. Sed eu libero quis lorem iaculis placerat. Phasellus eget feugiat ante, sed luctus lorem. Fusce venenatis dapibus tristique. Fusce tristique massa ut sapien scelerisque, id dapibus quam ornare. Etiam eget vestibulum odio. Integer vitae lacus eu nisi tempus lobortis.\r\n\r\nDuis hendrerit egestas iaculis. Sed venenatis, purus sit amet congue sodales, lacus tellus fringilla justo, ut consectetur ligula lectus quis justo. Nunc tristique metus nec dui volutpat dapibus. Vivamus magna nunc, commodo ac tempus eget, molestie volutpat justo. In imperdiet orci vel nunc venenatis molestie tristique vitae massa. Ut imperdiet sem sodales, finibus enim vel, porttitor elit. Quisque metus ipsum, tincidunt vel pharetra ut, suscipit feugiat neque. Integer viverra magna commodo nulla euismod lacinia. Proin vel hendrerit nisl, in venenatis nulla. Maecenas vehicula ante at sagittis blandit. Mauris a nisi eu massa consequat mollis sit amet vel risus. Nullam mattis mauris est, eu sodales felis commodo ut. Fusce et pellentesque lorem. Sed sit amet mauris finibus, faucibus urna sed, porttitor massa. Proin fermentum, ex sit amet accumsan dignissim, neque dolor bibendum lorem, eget molestie augue est et nibh. Proin scelerisque lacus ac fringilla vestibulum.\r\n\r\nCras eget purus eu orci tincidunt congue sed vitae purus. Nunc at tempor sapien, id egestas nunc. Nam quis lectus sit amet massa malesuada pellentesque ut sit amet velit. Aliquam id magna vehicula, dictum est ac, aliquam nibh. Maecenas lacinia et lorem vitae volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam tristique turpis vitae massa vestibulum scelerisque. Integer accumsan faucibus feugiat. Phasellus et velit commodo, pharetra lorem non, pellentesque magna. In vehicula volutpat quam vel blandit. Aenean convallis, sem sed rhoncus aliquet, dui quam suscipit metus, consectetur sodales enim risus eu diam.\r\n\r\nDonec dictum, augue quis placerat ultrices, mauris nunc pharetra est, nec vehicula diam felis a eros. Maecenas nisi massa, rutrum sed eleifend at, egestas quis orci. Maecenas a erat sit amet tortor fermentum pharetra ac id orci. Praesent quis dictum turpis. Vivamus pharetra velit ac sapien venenatis, vitae consectetur elit posuere. Sed vehicula interdum turpis ut molestie. Vivamus consequat, diam posuere interdum laoreet, orci ligula vehicula urna, sit amet pellentesque sapien eros eleifend eros. Proin id enim arcu. Nunc efficitur bibendum condimentum. Fusce at dictum enim. In hac habitasse platea dictumst. Nullam malesuada bibendum efficitur. Donec laoreet justo nec massa mollis, vel viverra nisi auctor.\r\n\r\nUt et ante porttitor, dictum ex quis, pellentesque ligula. Mauris dui ex, ornare at gravida non, ultricies porttitor dolor. Suspendisse a fermentum mauris. Phasellus odio risus, tempus a dui vel, finibus feugiat est. Maecenas pellentesque, nisi eget laoreet blandit, ex turpis mollis urna, nec aliquet sapien elit eu ante. Nam vitae auctor nisl. Aenean id diam vel ante mollis semper. Vivamus non mauris vitae risus pharetra tincidunt nec et orci. Donec eros enim, imperdiet vitae orci ultrices, lobortis maximus mauris. Maecenas viverra dapibus commodo. Mauris non nunc dignissim, sodales metus non, pulvinar turpis. Donec tristique vel ex id maximus. Morbi feugiat sem sit amet blandit varius. Nam blandit odio non erat convallis dapibus. Aliquam erat volutpat. Proin vestibulum urna at purus aliquam, in ultrices odio sodales.\r\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nam a quam vitae justo mollis dignissim sit amet ac enim. Donec hendrerit ligula at lacus sodales pellentesque. Sed dignissim diam ac lectus congue fermentum. Fusce vel sapien sed massa condimentum tristique vitae sed ante. Etiam et diam velit. Vivamus consequat neque turpis, vitae porttitor magna feugiat nec. In hac habitasse platea dictumst. Aenean elementum pretium metus, at pulvinar risus elementum et. Proin venenatis aliquam eros, sed finibus dui gravida non. Integer dapibus turpis rhoncus volutpat maximus. Curabitur tincidunt, mauris et posuere lobortis, velit nisl suscipit magna, sagittis sagittis felis sem dignissim odio. Vivamus eu mi nibh.\r\n\r\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam non dapibus nisi. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nam a consectetur orci. Nullam cursus in metus sed rhoncus. Sed suscipit nibh eros, non egestas magna viverra facilisis. Duis neque mi, blandit lacinia tortor et, dictum bibendum ipsum. Sed lobortis hendrerit nisi, eget congue risus sagittis quis. Nulla sed nisi a est imperdiet rutrum. Phasellus neque elit, bibendum sed molestie quis, porta id leo. Ut venenatis, risus quis iaculis tempor, erat erat lobortis erat, eget fermentum purus est vitae est.\r\n\r\nEtiam ut lacinia augue. Nulla ac turpis auctor, rutrum metus quis, lobortis urna. Duis condimentum bibendum ex, eget tempus nibh consectetur ut. Pellentesque odio eros, elementum ac massa id, viverra condimentum augue. Nunc sodales euismod nisi quis vehicula. Sed vitae eros id dui volutpat posuere. Sed eu libero quis lorem iaculis placerat. Phasellus eget feugiat ante, sed luctus lorem. Fusce venenatis dapibus tristique. Fusce tristique massa ut sapien scelerisque, id dapibus quam ornare. Etiam eget vestibulum odio. Integer vitae lacus eu nisi tempus lobortis.\r\n\r\nDuis hendrerit egestas iaculis. Sed venenatis, purus sit amet congue sodales, lacus tellus fringilla justo, ut consectetur ligula lectus quis justo. Nunc tristique metus nec dui volutpat dapibus. Vivamus magna nunc, commodo ac tempus eget, molestie volutpat justo. In imperdiet orci vel nunc venenatis molestie tristique vitae massa. Ut imperdiet sem sodales, finibus enim vel, porttitor elit. Quisque metus ipsum, tincidunt vel pharetra ut, suscipit feugiat neque. Integer viverra magna commodo nulla euismod lacinia. Proin vel hendrerit nisl, in venenatis nulla. Maecenas vehicula ante at sagittis blandit. Mauris a nisi eu massa consequat mollis sit amet vel risus. Nullam mattis mauris est, eu sodales felis commodo ut. Fusce et pellentesque lorem. Sed sit amet mauris finibus, faucibus urna sed, porttitor massa. Proin fermentum, ex sit amet accumsan dignissim, neque dolor bibendum lorem, eget molestie augue est et nibh. Proin scelerisque lacus ac fringilla vestibulum.\r\n\r\nCras eget purus eu orci tincidunt congue sed vitae purus. Nunc at tempor sapien, id egestas nunc. Nam quis lectus sit amet massa malesuada pellentesque ut sit amet velit. Aliquam id magna vehicula, dictum est ac, aliquam nibh. Maecenas lacinia et lorem vitae volutpat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Etiam tristique turpis vitae massa vestibulum scelerisque. Integer accumsan faucibus feugiat. Phasellus et velit commodo, pharetra lorem non, pellentesque magna. In vehicula volutpat quam vel blandit. Aenean convallis, sem sed rhoncus aliquet, dui quam suscipit metus, consectetur sodales enim risus eu diam.\r\n\r\nDonec dictum, augue quis placerat ultrices, mauris nunc pharetra est, nec vehicula diam felis a eros. Maecenas nisi massa, rutrum sed eleifend at, egestas quis orci. Maecenas a erat sit amet tortor fermentum pharetra ac id orci. Praesent quis dictum turpis. Vivamus pharetra velit ac sapien venenatis, vitae consectetur elit posuere. Sed vehicula interdum turpis ut molestie. Vivamus consequat, diam posuere interdum laoreet, orci ligula vehicula urna, sit amet pellentesque sapien eros eleifend eros. Proin id enim arcu. Nunc efficitur bibendum condimentum. Fusce at dictum enim. In hac habitasse platea dictumst. Nullam malesuada bibendum efficitur. Donec laoreet justo nec massa mollis, vel viverra nisi auctor.\r\n\r\nUt et ante porttitor, dictum ex quis, pellentesque ligula. Mauris dui ex, ornare at gravida non, ultricies porttitor dolor. Suspendisse a fermentum mauris. Phasellus odio risus, tempus a dui vel, finibus feugiat est. Maecenas pellentesque, nisi eget laoreet blandit, ex turpis mollis urna, nec aliquet sapien elit eu ante. Nam vitae auctor nisl. Aenean id diam vel ante mollis semper. Vivamus non mauris vitae risus pharetra tincidunt nec et orci. Donec eros enim, imperdiet vitae orci ultrices, lobortis maximus mauris. Maecenas viverra dapibus commodo. Mauris non nunc dignissim, sodales metus non, pulvinar turpis. Donec tristique vel ex id maximus. Morbi feugiat sem sit amet blandit varius. Nam blandit odio non erat convallis dapibus. Aliquam erat volutpat. Proin vestibulum urna at purus aliquam, in ultrices odio sodales.', '2017-01-19'),
(39, 'Wpis numer 1', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent elementum aliquet quam, eget consequat risus dignissim et. Morbi in neque tristique metus blandit pretium. Donec a nisi volutpat, suscipit orci nec, tempus mauris. Nullam vitae mi ligula. Curabitur et mollis eros. Integer id sollicitudin erat, et iaculis velit. Vivamus vulputate risus et malesuada posuere. Donec nec iaculis urna. In quis laoreet dolor. Sed tincidunt velit eget ex sollicitudin suscipit. Duis elementum venenatis rutrum.\r\n\r\n<img src="images/img1.jpg" alt="Obraz 1"></img>\r\n\r\nAliquam erat volutpat. Ut fringilla eros sed ultricies posuere. Vivamus vel volutpat nibh. Nulla interdum elit et condimentum venenatis. Praesent nec fermentum justo. Vivamus facilisis congue diam, sed maximus tortor maximus vel. Suspendisse bibendum ex id lobortis dictum. Suspendisse tincidunt nunc quis urna porta, a fermentum sapien congue. Duis vel risus commodo, vehicula eros eget, rutrum ipsum. Donec dignissim, orci eu vestibulum fringilla, augue nunc volutpat enim, in malesuada justo massa vitae enim. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nullam maximus neque non justo sodales fringilla.\r\n\r\n<img src="images/img2.jpg" alt="Obraz 2"></img>\r\n\r\nQuisque a imperdiet mi. In euismod commodo metus, vel faucibus nibh feugiat sed. Donec congue tellus id lectus sagittis, sit amet sagittis urna faucibus. Mauris et lacus vitae nisl euismod interdum eget ut metus. Fusce tincidunt felis ut enim efficitur egestas. Curabitur condimentum lacus ut mattis pellentesque. Maecenas sem metus, gravida non fringilla id, commodo nec massa. Curabitur sed lacus dapibus, mollis nulla vitae, interdum dolor. Suspendisse iaculis, sapien non pulvinar tincidunt, libero nulla tempor erat, sit amet commodo quam erat et quam. Sed mollis risus felis, vitae bibendum justo accumsan id. Nulla eleifend sem quis consequat vulputate. Vivamus eget orci vitae turpis scelerisque porta. Cras in malesuada nisi. Phasellus malesuada, lacus elementum dapibus facilisis, nisi est laoreet nulla, quis lacinia magna justo eget nunc. Suspendisse potenti.\r\n\r\nVivamus mollis nunc ut condimentum sagittis. Quisque non justo nulla. Nunc velit libero, congue ac porta ut, ultricies vitae urna. Praesent rhoncus lorem ut leo mattis scelerisque. Curabitur sapien nunc, porta quis velit ac, pharetra iaculis massa. Aenean et accumsan lorem, sed bibendum risus. Fusce tempus quis quam sit amet finibus. Donec a pellentesque est. Pellentesque rutrum massa ante, et vestibulum lacus viverra vel. Sed vitae tellus ante. Quisque vitae molestie mauris. Vestibulum sodales, eros at elementum pharetra, arcu erat dignissim lectus, non posuere ipsum neque eu ipsum. Morbi commodo aliquet ex, vitae tempus lectus molestie et. Nulla facilisi. Mauris erat purus, egestas at dapibus sed, maximus et risus. Suspendisse potenti.\r\n\r\nSed sagittis vel elit ut hendrerit. Sed congue consequat suscipit. Nulla venenatis, orci id auctor lobortis, velit nunc iaculis est, sit amet consectetur justo erat quis turpis. Maecenas interdum nisl vitae elit pretium, nec tempor felis euismod. Nullam ac feugiat felis. Donec id ultricies orci. Mauris ac diam mollis, semper enim et, fermentum turpis. Etiam convallis sapien sed arcu varius, in tincidunt eros fringilla. Aliquam erat volutpat. Donec volutpat, magna a porttitor commodo, nisi sapien dictum orci, et placerat erat nulla et velit. Mauris turpis orci, fermentum id rhoncus nec, egestas vitae risus. Nullam volutpat, tortor vitae tincidunt tincidunt, turpis ex convallis arcu, id convallis turpis sem et dolor. In lectus dolor, varius at ornare vel, imperdiet sit amet dolor. In a rhoncus ipsum. Nam vel posuere magna, ac viverra velit. Suspendisse lobortis enim diam.', '2017-02-03');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `kategorie`
--
ALTER TABLE `kategorie`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `komentarze`
--
ALTER TABLE `komentarze`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ksiazki`
--
ALTER TABLE `ksiazki`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wpisy`
--
ALTER TABLE `wpisy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `kategorie`
--
ALTER TABLE `kategorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `komentarze`
--
ALTER TABLE `komentarze`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT dla tabeli `ksiazki`
--
ALTER TABLE `ksiazki`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT dla tabeli `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT dla tabeli `wpisy`
--
ALTER TABLE `wpisy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

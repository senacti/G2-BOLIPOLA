-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-09-2023 a las 00:24:47
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_bolipola`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_height` >= 0),
  `logo_max_width` smallint(5) UNSIGNED NOT NULL CHECK (`logo_max_width` >= 0),
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  `css_generic_link_active_color` varchar(10) NOT NULL,
  `collapsible_stacked_inlines` tinyint(1) NOT NULL,
  `collapsible_stacked_inlines_collapsed` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines` tinyint(1) NOT NULL,
  `collapsible_tabular_inlines_collapsed` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add Theme', 1, 'add_theme'),
(2, 'Can change Theme', 1, 'change_theme'),
(3, 'Can delete Theme', 1, 'delete_theme'),
(4, 'Can view Theme', 1, 'view_theme'),
(5, 'Can add log entry', 2, 'add_logentry'),
(6, 'Can change log entry', 2, 'change_logentry'),
(7, 'Can delete log entry', 2, 'delete_logentry'),
(8, 'Can view log entry', 2, 'view_logentry'),
(9, 'Can add permission', 3, 'add_permission'),
(10, 'Can change permission', 3, 'change_permission'),
(11, 'Can delete permission', 3, 'delete_permission'),
(12, 'Can view permission', 3, 'view_permission'),
(13, 'Can add group', 4, 'add_group'),
(14, 'Can change group', 4, 'change_group'),
(15, 'Can delete group', 4, 'delete_group'),
(16, 'Can view group', 4, 'view_group'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add Calendario', 7, 'add_calendar'),
(26, 'Can change Calendario', 7, 'change_calendar'),
(27, 'Can delete Calendario', 7, 'delete_calendar'),
(28, 'Can view Calendario', 7, 'view_calendar'),
(29, 'Can add Categoría', 8, 'add_category'),
(30, 'Can change Categoría', 8, 'change_category'),
(31, 'Can delete Categoría', 8, 'delete_category'),
(32, 'Can view Categoría', 8, 'view_category'),
(33, 'Can add Evento', 9, 'add_event'),
(34, 'Can change Evento', 9, 'change_event'),
(35, 'Can delete Evento', 9, 'delete_event'),
(36, 'Can view Evento', 9, 'view_event'),
(37, 'Can add Inventario', 10, 'add_inventory'),
(38, 'Can change Inventario', 10, 'change_inventory'),
(39, 'Can delete Inventario', 10, 'delete_inventory'),
(40, 'Can view Inventario', 10, 'view_inventory'),
(41, 'Can add Reserva', 11, 'add_reservation'),
(42, 'Can change Reserva', 11, 'change_reservation'),
(43, 'Can delete Reserva', 11, 'delete_reservation'),
(44, 'Can view Reserva', 11, 'view_reservation'),
(45, 'Can add Equipo', 12, 'add_team'),
(46, 'Can change Equipo', 12, 'change_team'),
(47, 'Can delete Equipo', 12, 'delete_team'),
(48, 'Can view Equipo', 12, 'view_team'),
(49, 'Can add Torneo', 13, 'add_tournament'),
(50, 'Can change Torneo', 13, 'change_tournament'),
(51, 'Can delete Torneo', 13, 'delete_tournament'),
(52, 'Can view Torneo', 13, 'view_tournament'),
(53, 'Can add Torneo y equipo', 14, 'add_tournamentteam'),
(54, 'Can change Torneo y equipo', 14, 'change_tournamentteam'),
(55, 'Can delete Torneo y equipo', 14, 'delete_tournamentteam'),
(56, 'Can view Torneo y equipo', 14, 'view_tournamentteam'),
(57, 'Can add Venta', 15, 'add_sale'),
(58, 'Can change Venta', 15, 'change_sale'),
(59, 'Can delete Venta', 15, 'delete_sale'),
(60, 'Can view Venta', 15, 'view_sale'),
(61, 'Can add Producto', 16, 'add_product'),
(62, 'Can change Producto', 16, 'change_product'),
(63, 'Can delete Producto', 16, 'delete_product'),
(64, 'Can view Producto', 16, 'view_product'),
(65, 'Can add Jugador', 17, 'add_player'),
(66, 'Can change Jugador', 17, 'change_player'),
(67, 'Can delete Jugador', 17, 'delete_player'),
(68, 'Can view Jugador', 17, 'view_player'),
(69, 'Can add Salida', 18, 'add_output'),
(70, 'Can change Salida', 18, 'change_output'),
(71, 'Can delete Salida', 18, 'delete_output'),
(72, 'Can view Salida', 18, 'view_output'),
(73, 'Can add user', 19, 'add_userboli'),
(74, 'Can change user', 19, 'change_userboli'),
(75, 'Can delete user', 19, 'delete_userboli'),
(76, 'Can view user', 19, 'view_userboli');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calendario`
--

CREATE TABLE `calendario` (
  `id` bigint(20) NOT NULL,
  `date` datetime(6) NOT NULL,
  `availability` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `forOlder` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(2, 'admin', 'logentry'),
(1, 'admin_interface', 'theme'),
(4, 'auth', 'group'),
(3, 'auth', 'permission'),
(5, 'contenttypes', 'contenttype'),
(7, 'core', 'calendar'),
(8, 'core', 'category'),
(9, 'core', 'event'),
(10, 'core', 'inventory'),
(18, 'core', 'output'),
(17, 'core', 'player'),
(16, 'core', 'product'),
(11, 'core', 'reservation'),
(15, 'core', 'sale'),
(12, 'core', 'team'),
(13, 'core', 'tournament'),
(14, 'core', 'tournamentteam'),
(6, 'sessions', 'session'),
(19, 'user', 'userboli');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-09-06 21:46:50.717444'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-09-06 21:46:50.754771'),
(3, 'auth', '0001_initial', '2023-09-06 21:46:50.900995'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-09-06 21:46:50.932017'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-09-06 21:46:50.937994'),
(6, 'auth', '0004_alter_user_username_opts', '2023-09-06 21:46:50.942027'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-09-06 21:46:50.945026'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-09-06 21:46:50.947995'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-09-06 21:46:50.952996'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-09-06 21:46:50.956994'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-09-06 21:46:50.960995'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-09-06 21:46:50.969995'),
(13, 'auth', '0011_update_proxy_permissions', '2023-09-06 21:46:50.974995'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-09-06 21:46:50.978995'),
(15, 'user', '0001_initial', '2023-09-06 21:46:51.152052'),
(16, 'admin', '0001_initial', '2023-09-06 21:46:51.248483'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-09-06 21:46:51.255811'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-09-06 21:46:51.262251'),
(19, 'admin_interface', '0001_initial', '2023-09-06 21:46:51.278950'),
(20, 'admin_interface', '0002_add_related_modal', '2023-09-06 21:46:51.325962'),
(21, 'admin_interface', '0003_add_logo_color', '2023-09-06 21:46:51.342533'),
(22, 'admin_interface', '0004_rename_title_color', '2023-09-06 21:46:51.351741'),
(23, 'admin_interface', '0005_add_recent_actions_visible', '2023-09-06 21:46:51.365785'),
(24, 'admin_interface', '0006_bytes_to_str', '2023-09-06 21:46:51.403303'),
(25, 'admin_interface', '0007_add_favicon', '2023-09-06 21:46:51.416826'),
(26, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2023-09-06 21:46:51.439670'),
(27, 'admin_interface', '0009_add_enviroment', '2023-09-06 21:46:51.463044'),
(28, 'admin_interface', '0010_add_localization', '2023-09-06 21:46:51.474077'),
(29, 'admin_interface', '0011_add_environment_options', '2023-09-06 21:46:51.511824'),
(30, 'admin_interface', '0012_update_verbose_names', '2023-09-06 21:46:51.519065'),
(31, 'admin_interface', '0013_add_related_modal_close_button', '2023-09-06 21:46:51.533525'),
(32, 'admin_interface', '0014_name_unique', '2023-09-06 21:46:51.545531'),
(33, 'admin_interface', '0015_add_language_chooser_active', '2023-09-06 21:46:51.561735'),
(34, 'admin_interface', '0016_add_language_chooser_display', '2023-09-06 21:46:51.575567'),
(35, 'admin_interface', '0017_change_list_filter_dropdown', '2023-09-06 21:46:51.580569'),
(36, 'admin_interface', '0018_theme_list_filter_sticky', '2023-09-06 21:46:51.594365'),
(37, 'admin_interface', '0019_add_form_sticky', '2023-09-06 21:46:51.620853'),
(38, 'admin_interface', '0020_module_selected_colors', '2023-09-06 21:46:51.652092'),
(39, 'admin_interface', '0021_file_extension_validator', '2023-09-06 21:46:51.658281'),
(40, 'admin_interface', '0022_add_logo_max_width_and_height', '2023-09-06 21:46:51.684030'),
(41, 'admin_interface', '0023_theme_foldable_apps', '2023-09-06 21:46:51.698819'),
(42, 'admin_interface', '0024_remove_theme_css', '2023-09-06 21:46:51.707858'),
(43, 'admin_interface', '0025_theme_language_chooser_control', '2023-09-06 21:46:51.721278'),
(44, 'admin_interface', '0026_theme_list_filter_highlight', '2023-09-06 21:46:51.736564'),
(45, 'admin_interface', '0027_theme_list_filter_removal_links', '2023-09-06 21:46:51.751211'),
(46, 'admin_interface', '0028_theme_show_fieldsets_as_tabs_and_more', '2023-09-06 21:46:51.779558'),
(47, 'admin_interface', '0029_theme_css_generic_link_active_color', '2023-09-06 21:46:51.795095'),
(48, 'admin_interface', '0030_theme_collapsible_stacked_inlines_and_more', '2023-09-06 21:46:51.845564'),
(49, 'core', '0001_initial', '2023-09-06 21:46:52.575812'),
(50, 'sessions', '0001_initial', '2023-09-06 21:46:52.599005'),
(51, 'user', '0002_alter_userboli_avatar_alter_userboli_birthdate_and_more', '2023-09-06 21:52:04.865264');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipo`
--

CREATE TABLE `equipo` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `color` varchar(60) NOT NULL,
  `players_num` bigint(20) UNSIGNED NOT NULL CHECK (`players_num` >= 0),
  `avatar` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` bigint(20) NOT NULL,
  `type` varchar(50) NOT NULL,
  `place` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `cost` double NOT NULL,
  `guests` int(10) UNSIGNED NOT NULL CHECK (`guests` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` bigint(20) NOT NULL,
  `entry_date` datetime(6) NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL CHECK (`product_quantity` >= 0),
  `product_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugador`
--

CREATE TABLE `jugador` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `birthdate` date NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(200) NOT NULL,
  `dorsal` bigint(20) UNSIGNED NOT NULL CHECK (`dorsal` >= 0),
  `age` int(10) UNSIGNED NOT NULL CHECK (`age` >= 0),
  `gender` varchar(50) NOT NULL,
  `position` varchar(60) NOT NULL,
  `yellow_card` int(11) NOT NULL,
  `blue_card` int(11) NOT NULL,
  `red_card` int(11) NOT NULL,
  `equipo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cost` double NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(100) NOT NULL,
  `due_date` date NOT NULL,
  `category_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reserva`
--

CREATE TABLE `reserva` (
  `id` bigint(20) NOT NULL,
  `availability` tinyint(1) NOT NULL,
  `place` varchar(50) NOT NULL,
  `type` varchar(50) NOT NULL,
  `start_time` datetime(6) NOT NULL,
  `end_time` datetime(6) NOT NULL,
  `cost` double NOT NULL,
  `calendar_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salida`
--

CREATE TABLE `salida` (
  `id` bigint(20) NOT NULL,
  `output_date` datetime(6) NOT NULL,
  `product_quantity_out` int(10) UNSIGNED NOT NULL CHECK (`product_quantity_out` >= 0),
  `inventory_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo`
--

CREATE TABLE `torneo` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `number_teams` int(10) UNSIGNED NOT NULL CHECK (`number_teams` >= 0),
  `registered_teams` int(10) UNSIGNED NOT NULL CHECK (`registered_teams` >= 0),
  `date` datetime(6) NOT NULL,
  `prize_payment` double NOT NULL,
  `registration_cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `torneo_equipo`
--

CREATE TABLE `torneo_equipo` (
  `id` bigint(20) NOT NULL,
  `goals_for` int(11) NOT NULL,
  `goals_against` int(11) NOT NULL,
  `goals_diff` int(11) NOT NULL,
  `games_tied` int(11) NOT NULL,
  `games_won` int(11) NOT NULL,
  `games_lost` int(11) NOT NULL,
  `games_played` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `team_id` bigint(20) NOT NULL,
  `tournament_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_userboli`
--

CREATE TABLE `user_userboli` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `email` varchar(254) NOT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `rango` int(10) UNSIGNED NOT NULL CHECK (`rango` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_userboli`
--

INSERT INTO `user_userboli` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `is_staff`, `is_active`, `date_joined`, `email`, `avatar`, `birthdate`, `phone`, `gender`, `rango`) VALUES
(1, 'pbkdf2_sha256$600000$2bZnruJCZryYweQlCNND6r$KZRiLRbLts+pmelrpxEfSJXYWohkKiAZWjszISXijDg=', NULL, 1, 'admin', '', '', 1, 1, '2023-09-06 21:53:01.686383', 'admin@admin.com', '', NULL, NULL, 'Otro', 0),
(2, 'pbkdf2_sha256$600000$rDrUEcbL3bnkRBpOAzexpV$+XaHDtA3qNuFGSk0fwLHOJqxmZRQeXQLjsDknC6V3/4=', NULL, 0, 'jua@soy.com', 'Tatiana', 'Alfreda', 0, 1, '2023-09-06 21:59:46.659757', 'jua@soy.com', '', '2003-12-12', '3224587458', 'F', 0),
(3, 'pbkdf2_sha256$600000$Kqbow709NNAoOMolXEJqL8$PCSTi/84Bqz7tTC1HRx7Udatr+2YzQeglO+EAel69YQ=', NULL, 0, 'juan@com.com', 'elkakas', 'juanito123', 0, 1, '2023-09-06 22:03:42.358296', 'juan@com.com', '', '2004-12-12', '8574857892', 'F', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_userboli_groups`
--

CREATE TABLE `user_userboli_groups` (
  `id` bigint(20) NOT NULL,
  `userboli_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_userboli_user_permissions`
--

CREATE TABLE `user_userboli_user_permissions` (
  `id` bigint(20) NOT NULL,
  `userboli_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `id` bigint(20) NOT NULL,
  `total_cost` double NOT NULL,
  `payment_type` varchar(50) NOT NULL,
  `discount` tinyint(1) NOT NULL,
  `total_discount` double NOT NULL,
  `status` varchar(50) NOT NULL,
  `date` datetime(6) NOT NULL,
  `type` varchar(50) NOT NULL,
  `product_quantity` int(10) UNSIGNED NOT NULL CHECK (`product_quantity` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_event`
--

CREATE TABLE `venta_event` (
  `id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  `event_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_inventory`
--

CREATE TABLE `venta_inventory` (
  `id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  `inventory_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_reservation`
--

CREATE TABLE `venta_reservation` (
  `id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  `reservation_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta_tournament`
--

CREATE TABLE `venta_tournament` (
  `id` bigint(20) NOT NULL,
  `sale_id` bigint(20) NOT NULL,
  `tournament_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `calendario`
--
ALTER TABLE `calendario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_user_userboli_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indices de la tabla `equipo`
--
ALTER TABLE `equipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `inventario_product_id_a1edc06a_fk_producto_id` (`product_id`);

--
-- Indices de la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jugador_equipo_id_f972fb22_fk_equipo_id` (`equipo_id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producto_category_id_d39dad7c_fk_categoria_id` (`category_id`);

--
-- Indices de la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reserva_calendar_id_0e77bd6e_fk_calendario_id` (`calendar_id`);

--
-- Indices de la tabla `salida`
--
ALTER TABLE `salida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salida_inventory_id_3d569ade_fk_inventario_id` (`inventory_id`);

--
-- Indices de la tabla `torneo`
--
ALTER TABLE `torneo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `torneo_equipo`
--
ALTER TABLE `torneo_equipo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `torneo_equipo_team_id_aff5ce69_fk_equipo_id` (`team_id`),
  ADD KEY `torneo_equipo_tournament_id_2a153cdb_fk_torneo_id` (`tournament_id`);

--
-- Indices de la tabla `user_userboli`
--
ALTER TABLE `user_userboli`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `user_userboli_groups`
--
ALTER TABLE `user_userboli_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_userboli_groups_userboli_id_group_id_a1fadfcc_uniq` (`userboli_id`,`group_id`),
  ADD KEY `user_userboli_groups_group_id_c57ab420_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `user_userboli_user_permissions`
--
ALTER TABLE `user_userboli_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_userboli_user_permi_userboli_id_permission_i_046faf5d_uniq` (`userboli_id`,`permission_id`),
  ADD KEY `user_userboli_user_p_permission_id_b052ddf3_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `venta_event`
--
ALTER TABLE `venta_event`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `venta_Event_sale_id_event_id_1010857e_uniq` (`sale_id`,`event_id`),
  ADD KEY `venta_Event_event_id_6228417f_fk_evento_id` (`event_id`);

--
-- Indices de la tabla `venta_inventory`
--
ALTER TABLE `venta_inventory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `venta_inventory_sale_id_inventory_id_fa6c2d39_uniq` (`sale_id`,`inventory_id`),
  ADD KEY `venta_inventory_inventory_id_d006d13b_fk_inventario_id` (`inventory_id`);

--
-- Indices de la tabla `venta_reservation`
--
ALTER TABLE `venta_reservation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `venta_Reservation_sale_id_reservation_id_00f0cb35_uniq` (`sale_id`,`reservation_id`),
  ADD KEY `venta_Reservation_reservation_id_e760ca9a_fk_reserva_id` (`reservation_id`);

--
-- Indices de la tabla `venta_tournament`
--
ALTER TABLE `venta_tournament`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `venta_Tournament_sale_id_tournament_id_36d04102_uniq` (`sale_id`,`tournament_id`),
  ADD KEY `venta_Tournament_tournament_id_fa034e3f_fk_torneo_id` (`tournament_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT de la tabla `calendario`
--
ALTER TABLE `calendario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de la tabla `equipo`
--
ALTER TABLE `equipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jugador`
--
ALTER TABLE `jugador`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `reserva`
--
ALTER TABLE `reserva`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `salida`
--
ALTER TABLE `salida`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneo`
--
ALTER TABLE `torneo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `torneo_equipo`
--
ALTER TABLE `torneo_equipo`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_userboli`
--
ALTER TABLE `user_userboli`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_userboli_groups`
--
ALTER TABLE `user_userboli_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user_userboli_user_permissions`
--
ALTER TABLE `user_userboli_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_event`
--
ALTER TABLE `venta_event`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_inventory`
--
ALTER TABLE `venta_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_reservation`
--
ALTER TABLE `venta_reservation`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta_tournament`
--
ALTER TABLE `venta_tournament`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_userboli_id` FOREIGN KEY (`user_id`) REFERENCES `user_userboli` (`id`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_product_id_a1edc06a_fk_producto_id` FOREIGN KEY (`product_id`) REFERENCES `producto` (`id`);

--
-- Filtros para la tabla `jugador`
--
ALTER TABLE `jugador`
  ADD CONSTRAINT `jugador_equipo_id_f972fb22_fk_equipo_id` FOREIGN KEY (`equipo_id`) REFERENCES `equipo` (`id`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_category_id_d39dad7c_fk_categoria_id` FOREIGN KEY (`category_id`) REFERENCES `categoria` (`id`);

--
-- Filtros para la tabla `reserva`
--
ALTER TABLE `reserva`
  ADD CONSTRAINT `reserva_calendar_id_0e77bd6e_fk_calendario_id` FOREIGN KEY (`calendar_id`) REFERENCES `calendario` (`id`);

--
-- Filtros para la tabla `salida`
--
ALTER TABLE `salida`
  ADD CONSTRAINT `salida_inventory_id_3d569ade_fk_inventario_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventario` (`id`);

--
-- Filtros para la tabla `torneo_equipo`
--
ALTER TABLE `torneo_equipo`
  ADD CONSTRAINT `torneo_equipo_team_id_aff5ce69_fk_equipo_id` FOREIGN KEY (`team_id`) REFERENCES `equipo` (`id`),
  ADD CONSTRAINT `torneo_equipo_tournament_id_2a153cdb_fk_torneo_id` FOREIGN KEY (`tournament_id`) REFERENCES `torneo` (`id`);

--
-- Filtros para la tabla `user_userboli_groups`
--
ALTER TABLE `user_userboli_groups`
  ADD CONSTRAINT `user_userboli_groups_group_id_c57ab420_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_userboli_groups_userboli_id_3cbe31ac_fk_user_userboli_id` FOREIGN KEY (`userboli_id`) REFERENCES `user_userboli` (`id`);

--
-- Filtros para la tabla `user_userboli_user_permissions`
--
ALTER TABLE `user_userboli_user_permissions`
  ADD CONSTRAINT `user_userboli_user_p_permission_id_b052ddf3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_userboli_user_p_userboli_id_0c75c885_fk_user_user` FOREIGN KEY (`userboli_id`) REFERENCES `user_userboli` (`id`);

--
-- Filtros para la tabla `venta_event`
--
ALTER TABLE `venta_event`
  ADD CONSTRAINT `venta_Event_event_id_6228417f_fk_evento_id` FOREIGN KEY (`event_id`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `venta_Event_sale_id_be4786ff_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `venta_inventory`
--
ALTER TABLE `venta_inventory`
  ADD CONSTRAINT `venta_inventory_inventory_id_d006d13b_fk_inventario_id` FOREIGN KEY (`inventory_id`) REFERENCES `inventario` (`id`),
  ADD CONSTRAINT `venta_inventory_sale_id_3ec0a1ef_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `venta_reservation`
--
ALTER TABLE `venta_reservation`
  ADD CONSTRAINT `venta_Reservation_reservation_id_e760ca9a_fk_reserva_id` FOREIGN KEY (`reservation_id`) REFERENCES `reserva` (`id`),
  ADD CONSTRAINT `venta_Reservation_sale_id_3eab4339_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`);

--
-- Filtros para la tabla `venta_tournament`
--
ALTER TABLE `venta_tournament`
  ADD CONSTRAINT `venta_Tournament_sale_id_4fd2d748_fk_venta_id` FOREIGN KEY (`sale_id`) REFERENCES `venta` (`id`),
  ADD CONSTRAINT `venta_Tournament_tournament_id_fa034e3f_fk_torneo_id` FOREIGN KEY (`tournament_id`) REFERENCES `torneo` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

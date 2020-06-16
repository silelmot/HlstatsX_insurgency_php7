-- HlstatsX - Tables for Game: Insurgency
--
-- Daten für Tabelle `hlstats_Actions`
--

INSERT IGNORE INTO `hlstats_Actions` (`game`, `code`, `reward_player`, `reward_team`, `team`, `description`, `for_PlayerActions`, `for_PlayerPlayerActions`, `for_TeamActions`, `for_WorldActions`) VALUES
('insurgency', 'suppressed', 1, 0, '', 'Suppressing', '0', '1', '0', '0'),
('insurgency', 'teamkill', 0, 0, '', 'Teamkill', '1', '0', '0', '0'),
('insurgency', 'selfkill', 0, 0, '', 'Suicide', '1', '0', '0', '0'),
('insurgency', 'death', 0, 0, '', 'Death', '0', '1', '0', '0'),
('insurgency', 'burned', 5, 0, '', 'Burned', '0', '1', '0', '0');



--
-- Tabellenstruktur für Tabelle `hlstats_Awards`
--
SET @dbname = DATABASE();
SET @tablename = "hlstats_Awards";
SET @columnname = "negative";
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
  ) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE ", @tablename, " ADD ", @columnname, " tinyint(3) NOT NULL DEFAULT 0;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;

--
-- Daten für Tabelle `hlstats_Games_Defaults`
--

INSERT IGNORE INTO `hlstats_Games_Defaults` (`code`, `parameter`, `value`) VALUES
('insurgency', 'Admins', ''),
('insurgency', 'AutoBanRetry', '0'),
('insurgency', 'AutoTeamBalance', '0'),
('insurgency', 'BonusRoundIgnore', '0'),
('insurgency', 'BonusRoundTime', '0'),
('insurgency', 'BroadCastEvents', '1'),
('insurgency', 'BroadCastEventsCommand', 'hlx_sm_psay'),
('insurgency', 'BroadCastEventsCommandAnnounce', 'hlx_sm_csay'),
('insurgency', 'BroadCastPlayerActions', '1'),
('insurgency', 'ConnectAnnounce', '1'),
('insurgency', 'DefaultDisplayEvents', '1'),
('insurgency', 'DisplayResultsInBrowser', '0'),
('insurgency', 'EnablePublicCommands', '1'),
('insurgency', 'GameEngine', '2'),
('insurgency', 'GameType', '0'),
('insurgency', 'HLStatsURL', 'http://www/hlstatsx'),
('insurgency', 'IgnoreBots', '0'),
('insurgency', 'MinimumPlayersRank', '0'),
('insurgency', 'MinPlayers', '1'),
('insurgency', 'Mod', 'SOURCEMOD'),
('insurgency', 'PlayerEvents', '1'),
('insurgency', 'PlayerEventsAdminCommand', 'sm_chat'),
('insurgency', 'PlayerEventsCommand', 'hlx_sm_psay'),
('insurgency', 'PlayerEventsCommandHint', ''),
('insurgency', 'PlayerEventsCommandOSD', 'hlx_sm_msay'),
('insurgency', 'ShowStats', '1'),
('insurgency', 'SkillMode', '0'),
('insurgency', 'SuicidePenalty', '5'),
('insurgency', 'SwitchAdmins', '0'),
('insurgency', 'TKPenalty', '25'),
('insurgency', 'TrackServerLoad', '1'),
('insurgency', 'UpdateHostname', '1');


--
-- Daten für Tabelle `hlstats_Awards`
--

INSERT IGNORE INTO `hlstats_Awards` (`awardType`, `game`, `code`, `name`, `verb`, `d_winner_id`, `d_winner_count`, `g_winner_id`, `g_winner_count`, `negative`) VALUES
('O', 'insurgency', 'ins_cp_captured', 'Captured Objective', 'Captured Objectives', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'ins_cp_destroyed', 'Destroyed Objective', 'Destroyed Objectives', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'kill assist', 'Kill Assist', 'Kill Assists', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'headshot', 'Headshot', 'Headshots', NULL, NULL, NULL, NULL, 0),
('P', 'insurgency', 'suppressed', 'Suppressing', 'Enemies Suppressed', NULL, NULL, NULL, NULL, 0),
('V', 'insurgency', 'suppressed', 'Suppressed', 'x Suppressed by Enemies', NULL, NULL, NULL, NULL, 1),
('O', 'insurgency', 'teamkill', 'Teamkill', 'Teamkills done', NULL, NULL, NULL, NULL, 1),
('O', 'insurgency', 'selfkill', 'Suicide', 'times stupidly killed himself', NULL, NULL, NULL, NULL, 1),
('P', 'insurgency', 'burned', 'Grillmeister', 'Enemies Burned', NULL, NULL, NULL, NULL, 0),
('V', 'insurgency', 'burned', 'Grillfleisch', 'Burned', NULL, NULL, NULL, NULL, 1),
('P', 'insurgency', 'death', 'Kills', 'kills', NULL, NULL, NULL, NULL, 0),
('V', 'insurgency', 'death', 'Deaths', 'deaths', NULL, NULL, NULL, NULL, 1),
('W', 'insurgency', 'latency', 'Best Latency', 'ms average connection', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_ak74', 'AK-74', 'Kills with AK-74', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_akm', 'AKM', 'Kills with AKM', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_aks74u', 'AKS-74U', 'Kills with AKS-74U', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_anm14', 'AN-M14', 'Kills with AN-M14', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_at4', 'AT4', 'Kills with AT4', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_c4_clicker', 'C4', 'Kills with C4', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_c4_ied', 'IED', 'Kills with IED', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_f1', 'F1 Frag', 'Kills with F1 Frag', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_fal', 'FAL', 'Kills with FAL', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_galil', 'Galil', 'Kills with Galil', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_gp25_he', 'GP-25 HE', 'Kills with GP-25 HE', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_gp25_smoke', 'GP-25 Smoke', 'Kills with GP-25 Smoke', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_gurkha', 'Khukuri', 'Kills with Khukuri', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_kabar', 'Knife', 'Kills with Knife', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_l1a1', 'L1A1 SLR', 'Kills with L1A1 SLR', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m14', 'M14 EBR', 'Kills with M14 EBR', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m16a4', 'M16A4', 'Kills with M16A4', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m18', 'M18 Smoke', 'Kills with M18 Smoke', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m1911', 'M1911', 'Kills with M1911', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m1a1', 'M1 Carbine', 'Kills with M1 Carbine', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m203_he', 'M203 HE', 'Kills with M203 HE', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m203_smoke', 'M203 Smoke', 'Kills with M203 Smoke', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m249', 'M249', 'Kills with M249', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m40a1', 'M40A1', 'Kills with M40A1', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m45', 'M45A1', 'Kills with M45A1', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m4a1', 'M4A1', 'Kills with M4A1', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m590', 'M590', 'Kills with M590', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m67', 'M67 Frag', 'Kills with M67 Frag', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m84', 'M84 Flash', 'Kills with M84 Flash', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_m9', 'M9', 'Kills with M9', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_makarov', 'Makarov', 'Kills with Makarov', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_mini14', 'AC-556', 'Kills with AC-556', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_mk18', 'G36c', 'Kills with G36c', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_mk48', 'MK48', 'Kills with MK48', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_model10', 'Model 10', 'Kills with Model 10', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_molotov', 'Molotov', 'Kills with Molotov', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_mosin', 'Mosin', 'Kills with Mosin', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_mp40', 'MP40', 'Kills with MP40', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_mp5', 'MP7', 'Kills with MP7', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_p2a1', 'Flare Gun', 'Kills with Flare Gun', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_rpg7', 'RPG-7', 'Kills with RPG-7', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_rpk', 'RPK', 'Kills with RPK', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_sks', 'SKS', 'Kills with SKS', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_sterling', 'Sterling', 'Kills with Sterling', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_toz', 'TOZ', 'Kills with TOZ', NULL, NULL, NULL, NULL, 0),
('W', 'insurgency', 'weapon_ump45', 'UMP-45', 'Kills with UMP-45', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'ins_cp_captured', 'Captured Objective', 'Captured Objectives', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'ins_cp_destroyed', 'Destroyed Objective', 'Destroyed Objectives', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'kill assist', 'Kill Assist', 'Kill Assists', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'headshot', 'Headshot', 'Headshots', NULL, NULL, NULL, NULL, 0),
('P', 'insurgency', 'suppressed', 'Suppressing', 'Enemies Suppressed', NULL, NULL, NULL, NULL, 0),
('V', 'insurgency', 'suppressed', 'Suppressed', 'x Suppressed by Enemies', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'teamkill', 'Teamkill', 'Teamkills done', NULL, NULL, NULL, NULL, 0),
('O', 'insurgency', 'selfkill', 'Suicide', 'times stupidly killed himself', NULL, NULL, NULL, NULL, 0),
('P', 'insurgency', 'burned', 'Grillmeister', 'Enemies Burned', NULL, NULL, NULL, NULL, 0),
('V', 'insurgency', 'burned', 'Grillfleisch', 'Burned', NULL, NULL, NULL, NULL, 0),
('P', 'insurgency', 'death', 'Kills', 'kills', NULL, NULL, NULL, NULL, 0),
('V', 'insurgency', 'death', 'Deaths', 'deaths', NULL, NULL, NULL, NULL, 0);



--
-- Daten für Tabelle `hlstats_Games`
--

INSERT IGNORE INTO `hlstats_Games` (`code`, `name`, `hidden`, `realgame`) VALUES
('insurgency', 'Insurgency', '0', 'insurgency');




--
-- Daten für Tabelle `hlstats_Games_Supported`
--

INSERT IGNORE INTO `hlstats_Games_Supported` (`code`, `name`) VALUES
('insurgency', 'Insurgency');




--
-- Daten für Tabelle `hlstats_Heatmap_Config`
--

INSERT IGNORE INTO `hlstats_Heatmap_Config` (`id`, `map`, `game`, `xoffset`, `yoffset`, `flipx`, `flipy`, `rotate`, `days`, `brush`, `scale`, `font`, `thumbw`, `thumbh`, `cropx1`, `cropy1`, `cropx2`, `cropy2`) VALUES
(443, 'buhriz', 'insurgency', 11503, 9100, 1, 0, 0, 30, 'small', 18, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(444, 'buhriz_coop', 'insurgency', 11503, 9100, 1, 0, 0, 30, 'small', 18, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(445, 'buhriz_night', 'insurgency', 11500, 9098, 1, 0, 0, 30, 'small', 18, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(446, 'contact', 'insurgency', 4648, 3900, 1, 0, 0, 30, 'small', 9, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(447, 'contact_coop', 'insurgency', 4648, 3900, 1, 0, 0, 30, 'small', 9, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(448, 'contact_night', 'insurgency', 4377, 4091, 1, 0, 0, 30, 'small', 9, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(449, 'district', 'insurgency', 9976, 10261, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(450, 'district_coop', 'insurgency', 9976, 10261, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(451, 'district_night', 'insurgency', 10963, 10178, 1, 0, 0, 30, 'small', 13, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(452, 'doi_bastogne', 'insurgency', 7796, 8678, 1, 0, 0, 30, 'small', 17, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(453, 'doi_bastogne_night', 'insurgency', 7796, 8678, 1, 0, 0, 30, 'small', 17, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(454, 'doi_dog_red', 'insurgency', 7030, 10257, 1, 0, 0, 30, 'small', 12.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(455, 'doi_landfall', 'insurgency', 8877, 15000, 1, 0, 0, 30, 'small', 15.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(456, 'doi_ps7', 'insurgency', 5055, 4602, 1, 0, 0, 30, 'small', 9.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(457, 'drycanal', 'insurgency', 2542, 3189, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(458, 'drycanal_coop', 'insurgency', 2542, 3189, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(459, 'drycanal_night', 'insurgency', 2874, 3791, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(460, 'embassy', 'insurgency', 5156, 4771, 1, 0, 0, 30, 'small', 9.35, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(461, 'embassy_coop', 'insurgency', 5156, 4771, 1, 0, 0, 30, 'small', 9.35, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(462, 'embassy_night', 'insurgency', 5994, 4684, 1, 0, 0, 30, 'small', 9.35, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(463, 'heights', 'insurgency', 7150, 6500, 1, 0, 0, 30, 'small', 14, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(464, 'heights_coop', 'insurgency', 7150, 6500, 1, 0, 0, 30, 'small', 14, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(465, 'heights_night', 'insurgency', 7352, 7918, 1, 0, 0, 30, 'small', 16, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(466, 'kandagal', 'insurgency', 5873, 7426, 1, 0, 0, 30, 'small', 11, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(467, 'kandagal_night', 'insurgency', 6194, 7425, 1, 0, 0, 30, 'small', 11, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(468, 'market', 'insurgency', 6386, 5390, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(469, 'market_coop', 'insurgency', 6386, 5390, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(470, 'market_night', 'insurgency', 6448, 5827, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(471, 'ministry', 'insurgency', 7000, 4650, 1, 0, 0, 30, 'small', 13, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(472, 'ministry_coop', 'insurgency', 7000, 4650, 1, 0, 0, 30, 'small', 13, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(473, 'ministry_night', 'insurgency', 6520, 4169, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(474, 'panj', 'insurgency', 5374, 5842, 1, 0, 0, 30, 'small', 11, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(475, 'panj_night', 'insurgency', 5374, 5842, 1, 0, 0, 30, 'small', 11, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(476, 'peak', 'insurgency', 8812, 8534, 1, 0, 0, 30, 'small', 17, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(477, 'peak_night', 'insurgency', 8812, 8534, 1, 0, 0, 30, 'small', 17, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(478, 'revolt', 'insurgency', 5763, 4728, 1, 0, 0, 30, 'small', 10, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(479, 'revolt_coop', 'insurgency', 5763, 4728, 1, 0, 0, 30, 'small', 10, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(480, 'revolt_night', 'insurgency', 5763, 4728, 1, 0, 0, 30, 'small', 10, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(481, 'siege', 'insurgency', 5400, 4110, 1, 0, 0, 30, 'small', 8, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(482, 'siege_coop', 'insurgency', 5400, 4110, 1, 0, 0, 30, 'small', 8, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(483, 'sinjar', 'insurgency', 7351, 8007, 1, 0, 0, 30, 'small', 13.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(484, 'sinjar_coop', 'insurgency', 7351, 8007, 1, 0, 0, 30, 'small', 13.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(485, 'sinjar_night', 'insurgency', 7351, 8007, 1, 0, 0, 30, 'small', 13.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(486, 'station', 'insurgency', 6534, 6747, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(487, 'station_night', 'insurgency', 6534, 6747, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(488, 'tell', 'insurgency', 6899, 2360, 1, 0, 0, 30, 'small', 10, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(489, 'tell_coop', 'insurgency', 6899, 2360, 1, 0, 0, 30, 'small', 10, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(490, 'tell_night', 'insurgency', 7642, 2559, 1, 0, 0, 30, 'small', 11.5, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(491, 'uprising', 'insurgency', 3497, 4054, 1, 0, 0, 30, 'small', 7, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(492, 'uprising_night', 'insurgency', 4322, 4902, 1, 0, 0, 30, 'small', 8, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(493, 'verticality', 'insurgency', 7124, 6169, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(494, 'verticality_coop', 'insurgency', 7124, 6169, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0),
(495, 'verticality_night', 'insurgency', 7078, 5716, 1, 0, 0, 30, 'small', 12, 10, 0.170312, 0.170312, 0, 0, 0, 0);


--

--
-- Daten für Tabelle `hlstats_Ranks`
--

INSERT IGNORE INTO `hlstats_Ranks` (`rankId`, `image`, `minKills`, `maxKills`, `rankName`, `game`) VALUES
(1181, 'brigadier', 7250, 7999, 'Brigadier', 'insurgency'),
(1182, 'brigadier-general', 8000, 8999, 'Brigadier General', 'insurgency'),
(1183, 'captain', 2000, 2249, 'Captain', 'insurgency'),
(1184, 'colonel', 6500, 7249, 'Colonel', 'insurgency'),
(1185, 'commander', 4500, 4999, 'Commander', 'insurgency'),
(1186, 'commander-general', 15000, 17499, 'Commander General', 'insurgency'),
(1187, 'commander-of-the-army', 25000, 27499, 'Commander of the Army', 'insurgency'),
(1188, 'corporal', 300, 399, 'Corporal', 'insurgency'),
(1189, 'ensign', 1200, 1399, 'Ensign', 'insurgency'),
(1190, 'field-marshal', 20000, 22499, 'Field Marshal', 'insurgency'),
(1191, 'field-vice-marshal', 17500, 19999, 'Field Vice Marshal', 'insurgency'),
(1192, 'first-lieutenant', 1800, 1999, 'First Lieutenant', 'insurgency'),
(1193, 'first-sergeant', 800, 899, 'First Sergeant', 'insurgency'),
(1194, 'general', 12500, 14999, 'General', 'insurgency'),
(1195, 'group-captain', 2250, 2499, 'Group Captain', 'insurgency'),
(1196, 'group-commander', 5000, 5749, 'Group Commander', 'insurgency'),
(1197, 'group-major', 3500, 3999, 'Group Major', 'insurgency'),
(1198, 'gunnery-sergeant', 600, 699, 'Gunnery Sergeant', 'insurgency'),
(1199, 'high-commander', 27500, 29999, 'High Commander', 'insurgency'),
(1200, 'lance-corporal', 200, 299, 'Lance Corporal', 'insurgency'),
(1201, 'lieutenant-colonel', 5750, 6499, 'Lieutenant Colonel', 'insurgency'),
(1202, 'lieutenant-commander', 4000, 4499, 'Lieutenant Commander', 'insurgency'),
(1203, 'lieutenant-general', 10000, 12499, 'Lieutenant General', 'insurgency'),
(1204, 'lieutenant-major', 2750, 2999, 'Lieutenant Major', 'insurgency'),
(1205, 'major', 3000, 3499, 'Major', 'insurgency'),
(1206, 'major-general', 9000, 9999, 'Major General', 'insurgency'),
(1207, 'master-chief', 900, 999, 'Master Chief', 'insurgency'),
(1208, 'master-sergeant', 700, 799, 'Master Sergeant', 'insurgency'),
(1209, 'private', 50, 99, 'Private', 'insurgency'),
(1210, 'private-first-class', 100, 199, 'Private First Class', 'insurgency'),
(1211, 'recruit', 0, 49, 'Recruit', 'insurgency'),
(1212, 'second-lieutenant', 1600, 1799, 'Second Lieutenant', 'insurgency'),
(1213, 'senior-captain', 2500, 2749, 'Senior Captain', 'insurgency'),
(1214, 'sergeant', 400, 499, 'Sergeant', 'insurgency'),
(1215, 'sergeant-major', 1000, 1199, 'Sergeant Major', 'insurgency'),
(1216, 'staff-sergeant', 500, 599, 'Staff Sergeant', 'insurgency'),
(1217, 'supreme-commander', 30000, 34999, 'Supreme Commander', 'insurgency'),
(1218, 'terminator', 35000, 9999999, 'Terminator', 'insurgency'),
(1219, 'third-lieutenant', 1400, 1599, 'Third Lieutenant', 'insurgency'),
(1220, 'vice-commander-of-the-army', 22500, 24999, 'Vice Commander of the Army', 'insurgency');

--
-- Tabellenstruktur für Tabelle `hlstats_Ribbons`
--
SET @dbname = DATABASE();
SET @tablename = "hlstats_Ribbons";
SET @columnname = "negative";
SET @preparedStatement = (SELECT IF(
  (
    SELECT COUNT(*) FROM INFORMATION_SCHEMA.COLUMNS
    WHERE
      (table_name = @tablename)
      AND (table_schema = @dbname)
      AND (column_name = @columnname)
  ) > 0,
  "SELECT 1",
  CONCAT("ALTER TABLE ", @tablename, " ADD ", @columnname, " tinyint(3) NOT NULL DEFAULT 0;")
));
PREPARE alterIfNotExists FROM @preparedStatement;
EXECUTE alterIfNotExists;
DEALLOCATE PREPARE alterIfNotExists;



--
-- Daten für Tabelle `hlstats_Ribbons`
--

INSERT IGNORE INTO `hlstats_Ribbons` (`awardCode`, `awardCount`, `special`, `game`, `image`, `ribbonName`, `negative`) VALUES
('*total connection hours*', 168, 2, 'insurgency', '1waward.png', 'Connection Time 1 Week ', 0),
('weapon_ak74', 10, 0, 'insurgency', 'rg_ak74.png', 'Gold AK-74', 0),
('weapon_ak74', 5, 0, 'insurgency', 'rs_ak74.png', 'Silver AK-74', 0),
('weapon_akm', 10, 0, 'insurgency', 'rg_akm.png', 'Gold AKM', 0),
('weapon_akm', 5, 0, 'insurgency', 'rs_akm.png', 'Silver AKM', 0),
('weapon_aks74u', 10, 0, 'insurgency', 'rg_aks74u.png', 'Gold AKS-74U', 0),
('weapon_aks74u', 5, 0, 'insurgency', 'rs_aks74u.png', 'Silver AKS-74U', 0),
('weapon_anm14', 10, 0, 'insurgency', 'rg_anm14.png', 'Gold AN-M14', 0),
('weapon_anm14', 5, 0, 'insurgency', 'rs_anm14.png', 'Silver AN-M14', 0),
('weapon_at4', 10, 0, 'insurgency', 'rg_at4.png', 'Gold AT4', 0),
('weapon_at4', 5, 0, 'insurgency', 'rs_at4.png', 'Silver AT4', 0),
('weapon_c4_clicker', 10, 0, 'insurgency', 'rg_c4_clicker.png', 'Gold C4', 0),
('weapon_c4_clicker', 5, 0, 'insurgency', 'rs_c4_clicker.png', 'Silver C4', 0),
('weapon_c4_ied', 10, 0, 'insurgency', 'rg_c4_ied.png', 'Gold IED', 0),
('weapon_c4_ied', 5, 0, 'insurgency', 'rs_c4_ied.png', 'Silver IED', 0),
('weapon_f1', 10, 0, 'insurgency', 'rg_f1.png', 'Gold F1 Frag', 0),
('weapon_f1', 5, 0, 'insurgency', 'rs_f1.png', 'Silver F1 Frag', 0),
('weapon_fal', 10, 0, 'insurgency', 'rg_fal.png', 'Gold FAL', 0),
('weapon_fal', 5, 0, 'insurgency', 'rs_fal.png', 'Silver FAL', 0),
('weapon_galil', 10, 0, 'insurgency', 'rg_galil.png', 'Gold Galil', 0),
('weapon_galil', 5, 0, 'insurgency', 'rs_galil.png', 'Silver Galil', 0),
('weapon_galil_sar', 10, 0, 'insurgency', 'rg_galil_sar.png', 'Gold Galil SAR', 0),
('weapon_galil_sar', 5, 0, 'insurgency', 'rs_galil_sar.png', 'Silver Galil SAR', 0),
('weapon_gp25_he', 10, 0, 'insurgency', 'rg_gp25_he.png', 'Gold GP-25 HE', 0),
('weapon_gp25_he', 5, 0, 'insurgency', 'rs_gp25_he.png', 'Silver GP-25 HE', 0),
('weapon_gp25_smoke', 10, 0, 'insurgency', 'rg_gp25_smoke.png', 'Gold GP-25 Smoke', 0),
('weapon_gp25_smoke', 5, 0, 'insurgency', 'rs_gp25_smoke.png', 'Silver GP-25 Smoke', 0),
('weapon_gurkha', 10, 0, 'insurgency', 'rg_gurkha.png', 'Gold Khukuri', 0),
('weapon_gurkha', 5, 0, 'insurgency', 'rs_gurkha.png', 'Silver Khukuri', 0),
('weapon_kabar', 10, 0, 'insurgency', 'rg_kabar.png', 'Gold Knife', 0),
('weapon_kabar', 5, 0, 'insurgency', 'rs_kabar.png', 'Silver Knife', 0),
('weapon_l1a1', 10, 0, 'insurgency', 'rg_l1a1.png', 'Gold L1A1 SLR', 0),
('weapon_l1a1', 5, 0, 'insurgency', 'rs_l1a1.png', 'Silver L1A1 SLR', 0),
('weapon_m14', 10, 0, 'insurgency', 'rg_m14.png', 'Gold M14 EBR', 0),
('weapon_m14', 5, 0, 'insurgency', 'rs_m14.png', 'Silver M14 EBR', 0),
('weapon_m16a4', 10, 0, 'insurgency', 'rg_m16a4.png', 'Gold M16A4', 0),
('weapon_m16a4', 5, 0, 'insurgency', 'rs_m16a4.png', 'Silver M16A4', 0),
('weapon_m18', 10, 0, 'insurgency', 'rg_m18.png', 'Gold M18 Smoke', 0),
('weapon_m18', 5, 0, 'insurgency', 'rs_m18.png', 'Silver M18 Smoke', 0),
('weapon_m1911', 10, 0, 'insurgency', 'rg_m1911.png', 'Gold M1911', 0),
('weapon_m1911', 5, 0, 'insurgency', 'rs_m1911.png', 'Silver M1911', 0),
('weapon_m1a1', 10, 0, 'insurgency', 'rg_m1a1.png', 'Gold M1 Carbine', 0),
('weapon_m1a1', 5, 0, 'insurgency', 'rs_m1a1.png', 'Silver M1 Carbine', 0),
('weapon_m203_he', 10, 0, 'insurgency', 'rg_m203_he.png', 'Gold M203 HE', 0),
('weapon_m203_he', 5, 0, 'insurgency', 'rs_m203_he.png', 'Silver M203 HE', 0),
('weapon_m203_smoke', 10, 0, 'insurgency', 'rg_m203_smoke.png', 'Gold M203 Smoke', 0),
('weapon_m203_smoke', 5, 0, 'insurgency', 'rs_m203_smoke.png', 'Silver M203 Smoke', 0),
('weapon_m249', 10, 0, 'insurgency', 'rg_m249.png', 'Gold M249', 0),
('weapon_m249', 5, 0, 'insurgency', 'rs_m249.png', 'Silver M249', 0),
('weapon_m40a1', 10, 0, 'insurgency', 'rg_m40a1.png', 'Gold M40A1', 0),
('weapon_m40a1', 5, 0, 'insurgency', 'rs_m40a1.png', 'Silver M40A1', 0),
('weapon_m45', 10, 0, 'insurgency', 'rg_m45.png', 'Gold M45A1', 0),
('weapon_m45', 5, 0, 'insurgency', 'rs_m45.png', 'Silver M45A1', 0),
('weapon_m4a1', 10, 0, 'insurgency', 'rg_m4a1.png', 'Gold M4A1', 0),
('weapon_m4a1', 5, 0, 'insurgency', 'rs_m4a1.png', 'Silver M4A1', 0),
('weapon_m590', 10, 0, 'insurgency', 'rg_m590.png', 'Gold M590', 0),
('weapon_m590', 5, 0, 'insurgency', 'rs_m590.png', 'Silver M590', 0),
('weapon_m67', 10, 0, 'insurgency', 'rg_m67.png', 'Gold M67 Frag', 0),
('weapon_m67', 5, 0, 'insurgency', 'rs_m67.png', 'Silver M67 Frag', 0),
('weapon_m84', 10, 0, 'insurgency', 'rg_m84.png', 'Gold M84 Flash', 0),
('weapon_m84', 5, 0, 'insurgency', 'rs_m84.png', 'Silver M84 Flash', 0),
('weapon_m9', 10, 0, 'insurgency', 'rg_m9.png', 'Gold M9', 0),
('weapon_m9', 5, 0, 'insurgency', 'rs_m9.png', 'Silver M9', 0),
('weapon_makarov', 10, 0, 'insurgency', 'rg_makarov.png', 'Gold Makarov', 0),
('weapon_makarov', 5, 0, 'insurgency', 'rs_makarov.png', 'Silver Makarov', 0),
('weapon_mini14', 10, 0, 'insurgency', 'rg_mini14.png', 'Gold AC-556', 0),
('weapon_mini14', 5, 0, 'insurgency', 'rs_mini14.png', 'Silver AC-556', 0),
('weapon_mk18', 10, 0, 'insurgency', 'rg_mk18.png', 'Gold Mk18', 0),
('weapon_mk18', 5, 0, 'insurgency', 'rs_mk18.png', 'Silver Mk18', 0),
('weapon_mk48', 10, 0, 'insurgency', 'rg_mk48.png', 'Gold MK48', 0),
('weapon_mk48', 5, 0, 'insurgency', 'rs_mk48.png', 'Silver MK48', 0),
('weapon_model10', 10, 0, 'insurgency', 'rg_model10.png', 'Gold Model 10', 0),
('weapon_model10', 5, 0, 'insurgency', 'rs_model10.png', 'Silver Model 10', 0),
('weapon_molotov', 10, 0, 'insurgency', 'rg_molotov.png', 'Gold Molotov', 0),
('weapon_molotov', 5, 0, 'insurgency', 'rs_molotov.png', 'Silver Molotov', 0),
('weapon_mosin', 10, 0, 'insurgency', 'rg_mosin.png', 'Gold Mosin', 0),
('weapon_mosin', 5, 0, 'insurgency', 'rs_mosin.png', 'Silver Mosin', 0),
('weapon_mp40', 10, 0, 'insurgency', 'rg_mp40.png', 'Gold MP40', 0),
('weapon_mp40', 5, 0, 'insurgency', 'rs_mp40.png', 'Silver MP40', 0),
('weapon_mp5', 10, 0, 'insurgency', 'rg_mp5.png', 'Gold MP5K', 0),
('weapon_mp5', 5, 0, 'insurgency', 'rs_mp5.png', 'Silver MP5K', 0),
('weapon_p2a1', 10, 0, 'insurgency', 'rg_p2a1.png', 'Gold Flare Gun', 0),
('weapon_p2a1', 5, 0, 'insurgency', 'rs_p2a1.png', 'Silver Flare Gun', 0),
('weapon_rpg7', 10, 0, 'insurgency', 'rg_rpg7.png', 'Gold RPG-7', 0),
('weapon_rpg7', 5, 0, 'insurgency', 'rs_rpg7.png', 'Silver RPG-7', 0),
('weapon_rpk', 10, 0, 'insurgency', 'rg_rpk.png', 'Gold RPK', 0),
('weapon_rpk', 5, 0, 'insurgency', 'rs_rpk.png', 'Silver RPK', 0),
('weapon_sks', 10, 0, 'insurgency', 'rg_sks.png', 'Gold SKS', 0),
('weapon_sks', 5, 0, 'insurgency', 'rs_sks.png', 'Silver SKS', 0),
('weapon_sterling', 10, 0, 'insurgency', 'rg_sterling.png', 'Gold Sterling', 0),
('weapon_sterling', 5, 0, 'insurgency', 'rs_sterling.png', 'Silver Sterling', 0),
('weapon_toz', 10, 0, 'insurgency', 'rg_toz.png', 'Gold TOZ', 0),
('weapon_toz', 5, 0, 'insurgency', 'rs_toz.png', 'Silver TOZ', 0),
('weapon_ump45', 10, 0, 'insurgency', 'rg_ump45.png', 'Gold UMP-45', 0),
('weapon_ump45', 5, 0, 'insurgency', 'rs_ump45.png', 'Silver UMP-45', 0);


--
-- Daten für Tabelle `hlstats_Roles`
--

INSERT IGNORE INTO `hlstats_Roles` (`game`, `code`, `name`, `hidden`, `picked`, `kills`, `deaths`) VALUES
('insurgency', 'bomber', 'Bomber', '0', 0, 0, 0),
('insurgency', 'breacher', 'Breacher', '0', 0, 0, 0),
('insurgency', 'demolitions', 'Demolitions', '0', 0, 0, 0),
('insurgency', 'designated_marksman', 'Designated Marksman', '0', 0, 0, 0),
('insurgency', 'engineer', 'Engineer', '0', 0, 0, 0),
('insurgency', 'escort', 'Escort', '0', 0, 0, 0),
('insurgency', 'fighter', 'Fighter', '0', 0, 0, 0),
('insurgency', 'grenadier', 'Grenadier', '0', 0, 0, 0),
('insurgency', 'machinegunner', 'Machine Gunner', '0', 0, 0, 0),
('insurgency', 'militant', 'Militant', '0', 0, 0, 0),
('insurgency', 'recon', 'Recon', '0', 0, 0, 0),
('insurgency', 'rifleman', 'Rifleman', '0', 0, 0, 0),
('insurgency', 'rocketeer', 'Rocketeer', '0', 0, 0, 0),
('insurgency', 'sapper', 'Sapper', '0', 0, 0, 0),
('insurgency', 'scout', 'Scout', '0', 0, 0, 0),
('insurgency', 'sharpshooter', 'Sharpshooter', '0', 0, 0, 0),
('insurgency', 'sniper', 'Sniper', '0', 0, 0, 0),
('insurgency', 'specialist', 'Specialist', '0', 0, 0, 0),
('insurgency', 'striker', 'Striker', '0', 0, 0, 0),
('insurgency', 'suicide', 'Suicide Bomber', '0', 0, 0, 0),
('insurgency', 'support', 'Support', '0', 0, 0, 0),
('insurgency', 'vip', 'VIP', '0', 0, 0, 0);



--
-- Daten für Tabelle `hlstats_Teams`
--

INSERT IGNORE INTO `hlstats_Teams` (`game`, `code`, `name`, `hidden`, `playerlist_bgcolor`, `playerlist_color`, `playerlist_index`) VALUES
('insurgency', '#Team_Insurgent', 'Insurgent Forces', '0', '#FFD5D5', '#FF2D2D', 1),
('insurgency', '#Team_Security', 'Security Forces', '0', '#D2E8F7', '#0080C0', 2);




--
-- Daten für Tabelle `hlstats_Weapons`
--

INSERT IGNORE INTO `hlstats_Weapons` (`game`, `code`, `name`, `modifier`, `kills`, `headshots`) VALUES
('insurgency', 'weapon_ak74', 'AK-74', 1.00, 0, 0),
('insurgency', 'weapon_akm', 'AKM', 1.00, 0, 0),
('insurgency', 'weapon_aks74u', 'AKS-74U', 1.00, 0, 0),
('insurgency', 'grenade_anm14', 'AN-M14', 10.00, 0, 0),
('insurgency', 'weapon_at4', 'AT4', 2.00, 0, 0),
('insurgency', 'weapon_c4_clicker', 'C4', 2.00, 0, 0),
('insurgency', 'weapon_c4_ied', 'IED', 2.00, 0, 0),
('insurgency', 'grenade_f1', 'F1 Frag', 2.00, 0, 0),
('insurgency', 'weapon_fal', 'FAL', 1.00, 0, 0),
('insurgency', 'weapon_galil', 'Galil', 1.00, 0, 0),
('insurgency', 'weapon_galil_sar', 'Galil SAR', 1.00, 0, 0),
('insurgency', 'weapon_gp25_he', 'GP-25 HE', 2.00, 0, 0),
('insurgency', 'weapon_gp25_smoke', 'GP-25 Smoke', 2.00, 0, 0),
('insurgency', 'weapon_gurkha', 'Khukuri', 1.00, 0, 0),
('insurgency', 'weapon_kabar', 'Knife', 10.00, 0, 0),
('insurgency', 'weapon_l1a1', 'L1A1 SLR', 1.00, 0, 0),
('insurgency', 'weapon_m14', 'M14 EBR', 1.00, 0, 0),
('insurgency', 'weapon_m16a4', 'M16A4', 1.00, 0, 0),
('insurgency', 'grenade_m18', 'M18 Smoke', 10.00, 0, 0),
('insurgency', 'weapon_m1911', 'M1911', 1.00, 0, 0),
('insurgency', 'weapon_m1a1', 'M1 Carbine', 1.00, 0, 0),
('insurgency', 'weapon_m203_he', 'M203 HE', 2.00, 0, 0),
('insurgency', 'weapon_m203_smoke', 'M203 Smoke', 2.00, 0, 0),
('insurgency', 'weapon_m249', 'M249', 1.00, 0, 0),
('insurgency', 'weapon_m40a1', 'M40A1', 1.00, 0, 0),
('insurgency', 'weapon_m45', 'M45A1', 1.00, 0, 0),
('insurgency', 'weapon_m4a1', 'M4A1', 1.00, 0, 0),
('insurgency', 'weapon_m590', 'M590', 1.00, 0, 0),
('insurgency', 'grenade_m67', 'M67 Frag', 2.00, 0, 0),
('insurgency', 'grenade_m84', 'M84 Flash', 10.00, 0, 0),
('insurgency', 'weapon_m9', 'M9', 1.00, 0, 0),
('insurgency', 'weapon_makarov', 'Makarov', 1.00, 0, 0),
('insurgency', 'weapon_mini14', 'AC-556', 1.00, 0, 0),
('insurgency', 'weapon_mk18', 'G36c', 1.00, 0, 0),
('insurgency', 'weapon_model10', 'Model 10', 1.00, 0, 0),
('insurgency', 'grenade_molotov', 'Molotov', 2.00, 0, 0),
('insurgency', 'weapon_mosin', 'Mosin', 1.00, 0, 0),
('insurgency', 'weapon_mp40', 'MP40', 1.00, 0, 0),
('insurgency', 'weapon_mp5', 'MP7', 1.00, 0, 0),
('insurgency', 'weapon_p2a1', 'Flare Gun', 1.00, 0, 0),
('insurgency', 'weapon_rpg7', 'RPG-7', 1.00, 0, 0),
('insurgency', 'weapon_rpk', 'RPK', 1.00, 0, 0),
('insurgency', 'weapon_sks', 'SKS', 1.00, 0, 0),
('insurgency', 'weapon_sterling', 'Sterling', 1.00, 0, 0),
('insurgency', 'weapon_toz', 'TOZ', 1.00, 0, 0),
('insurgency', 'weapon_ump45', 'UMP-45', 1.00, 0, 0);

--

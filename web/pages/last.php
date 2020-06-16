<?php
/*
HLstatsX Community Edition - Real-time player and clan rankings and statistics
Copyleft (L) 2008-20XX Nicholas Hastings (nshastings@gmail.com)
http://www.hlxcommunity.com

HLstatsX Community Edition is a continuation of 
ELstatsNEO - Real-time player and clan rankings and statistics
Copyleft (L) 2008-20XX Malte Bayer (steam@neo-soft.org)
http://ovrsized.neo-soft.org/

ELstatsNEO is an very improved & enhanced - so called Ultra-Humongus Edition of HLstatsX
HLstatsX - Real-time player and clan rankings and statistics for Half-Life 2
http://www.hlstatsx.com/
Copyright (C) 2005-2007 Tobias Oetzel (Tobi@hlstatsx.com)

HLstatsX is an enhanced version of HLstats made by Simon Garner
HLstats - Real-time player and clan rankings and statistics for Half-Life
http://sourceforge.net/projects/hlstats/
Copyright (C) 2001  Simon Garner
            
This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

For support and installation notes visit http://www.hlxcommunity.com
*/

	if ( !defined('IN_HLSTATS') )
	{
		die('Do not access this file directly.');
	}
// Player Rankings
	$db->query
	("
		SELECT
			hlstats_Games.name
		FROM
			hlstats_Games
		WHERE
			hlstats_Games.code = '$game'
	");
	if ($db->num_rows() < 1) error("No such game '$game'.");
	list($gamename) = $db->fetch_row();
	$db->free_result();
	if (isset($_GET['hours']))
	{
		$hours = valid_request($_GET['hours'], 1);
	}
	else
	{
		$hours = 24;
	}
	$time =  date('Y-m-d H:m:s', strtotime('-'.$hours.' hours'));
	pageHeader
	(
		array ($gamename, 'Players last '.$hours.'h'),
		array ($gamename=>"%s?game=$game", 'Players last '.$hours.'h'=>'')
	);
		
// Autocomplete function below implemented by KingJ. Heavy modified to use HTML request instead of JSON.
?>

<div class="block">
	<?php printSectionTitle('Players last '.$hours.'h');	?>
		
		<div style="clear:both;"></div><br /><br /><br /><br />
	</div>
	<?php
		$table = new Table
			(
				array
				(
					new TableColumn
					(
						'time',
						'Last Connect',
						'width=10&align=right&sort=no'
					),					
					new TableColumn
					(
						'lastName',
						'Player',
						'width=25&flag=1&link=' . urlencode('mode=playerinfo&amp;player=%k') .'&sort=no'
					),
					new TableColumn
					(
						'skill',
						'Points',
						'width=7&align=right&skill_change=1&sort=no'
					),
					new TableColumn
					(
						'activity',
						'Activity',
						'width=10&sort=no&type=bargraph'
					),
					new TableColumn
					(
						'connection_time',
						'Connection Time',
						'width=10&align=right&type=timestamp&sort=no'
					),
					new TableColumn
					(
						'kills',
						'Kills',
						'width=7&align=right&sort=no'
					),
					new TableColumn
					(
						'deaths',
						'Deaths',
						'width=7&align=right&sort=no'
					),
					new TableColumn
					(
						'kpd',
						'K:D',
						'width=6&align=right&sort=no'
					),
					new TableColumn
					(
						'headshots',
						'Headshots',
						'width=6&align=right&sort=no'
					),
					new TableColumn
					(
						'hpk',
						'HS:K',
						'width=6&align=right&sort=no'
					),
					new TableColumn
					(
						'acc',
						'Accuracy',
						'width=6&align=right&append=' . urlencode('%') .'&sort=no'
					)
				),
				'playerId',
				'kpd',
				true
			);
		
			$result = $db->query
			("
				SELECT
					SQL_CALC_FOUND_ROWS
					hlstats_Players.playerId,
					hlstats_Players.connection_time,
                                        unhex(replace(hex(hlstats_Players.lastName), 'E280AE', '')) as lastName,
					hlstats_Players.flag,
					time,
					hlstats_Players.country,
					hlstats_Players.skill,
					hlstats_Players.kills,
					hlstats_Players.deaths,
					hlstats_Players.last_skill_change,
					ROUND(hlstats_Players.kills/(IF(hlstats_Players.deaths=0, 1, hlstats_Players.deaths)), 2) AS kpd,
					hlstats_Players.headshots,
					ROUND(hlstats_Players.headshots/(IF(hlstats_Players.kills=0, 1, hlstats_Players.kills)), 2) AS hpk,
					IFNULL(ROUND((hlstats_Players.hits / hlstats_Players.shots * 100), 1), 0) AS acc,
					activity
				FROM
					hlstats_Players
				INNER JOIN
					( SELECT 
						MAX(eventTime) as time,
						playerId
					FROM
					( SELECT playerId, eventTime
						FROM hlstats_Events_Disconnects
					UNION ALL
						SELECT playerId, eventTime
						FROM hlstats_Events_Connects) as subQuery
 					WHERE	eventTime >= '$time'
					GROUP BY
						playerId
					ORDER BY
						time ASC ) DisconnectsTime
				ON
					DisconnectsTime.playerId = hlstats_Players.playerId
				WHERE
					hlstats_Players.game = '$game'
					AND hlstats_Players.hideranking = 0
					AND lastAddress!=''
				GROUP BY
					hlstats_Players.playerId		
				ORDER BY
					time DESC
				LIMIT
					$table->startitem,
					$table->numperpage
			");
			
			$resultCount = $db->query("SELECT FOUND_ROWS()");
			list($numitems) = $db->fetch_row($resultCount);
		
		$table->draw($result, $numitems, 95);
	?><br /><br />
	<div class="subblock">
		<div style="float:left;">
			<form method="get" action="<?php echo $g_options['scripturl']; ?>">
				<?php					
					foreach ($_GET as $k=>$v)
					{
						$v = valid_request($v, 0);
						if ($k != 'hours')
						{
							echo "<input type=\"hidden\" name=\"" . htmlspecialchars($k) . "\" value=\"" . htmlspecialchars($v) . "\" />\n";
						}
					}
				?>
				<strong>&#8226;</strong> Only show players online last
					<input type="text" name="hours" size="4" maxlength="3" value="<?php echo $hours; ?>" class="textbox" /> hours.
					<input type="submit" value="Apply" class="smallsubmit" />
			</form>
		</div>
		<div style="float:right;">
			Go to: <a href="<?php echo $g_options["scripturl"] . "?mode=clans&amp;game=$game"; ?>">Clan Rankings</a>
		</div>	
	</div>
</div>

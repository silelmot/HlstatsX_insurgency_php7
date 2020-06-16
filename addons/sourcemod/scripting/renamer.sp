#include <sourcemod>
#include <sdktools>
#include <smlib/crypt>

public Plugin myinfo =
{
	name = "Renamer with Password",
	author = "sil_el_mot",
	description = "Just a try to get password protected names",
	version = "0.0.0.1",
	url = "http://www.sourcemod.net/"
}
 
char new_name[MAXPLAYERS+1][64];

public void OnPluginStart()
{
	RegConsoleCmd("login", Command_Login);
	RegConsoleCmd("register", Command_Register);
	HookEvent("player_spawn",SpawnEvent);
	HookEvent("player_disconnect", DisconnectEvent);
}


public Action:SpawnEvent(Handle:event,const String:name[],bool:dontBroadcast)
{
	new client_id = GetEventInt(event, "userid");
	new client = GetClientOfUserId(client_id);

	//decl String:new_name[MAXPLAYERS+1][64];
	
	if (!new_name[client][0]) //(!StrEqual(new_name[client], ))
	{
		//GetClientName(int client, orig_name)		
		PrintToChat(client, "Du musst dich mit dem Befehl '/login' einloggen oder mit '/register' registrieren")
	}
	else 
	{
		ReplyToCommand(client,"dein name: %s",new_name[client]);
		SetClientName(client, new_name[client]);
	}
} 

public Action:DisconnectEvent(Handle:event,const String:name[],bool:dontBroadcast)
{
	new client_id = GetEventInt(event, "userid");
	new client = GetClientOfUserId(client_id);
	new_name[client][0] = '\0'
}

Database Connect()
{
	char error[255];
	Database db = SQL_DefConnect(error, sizeof(error));
	 
	if (db == null)
	{
		PrintToServer("Could not connect: %s", error);
	} 
	
	return db;
}

/*void PrintResults(Handle query)
{
	char name[MAX_NAME_LENGTH];
	while (SQL_FetchRow(query))
	{
		SQL_FetchString(query, 0, name, sizeof(name));
		PrintToServer("Name \"%s\" was found.", name);
	}
}*/

public Action Command_Login(int client, int args)
{
	char arg1[32];
	char arg2[32];
	char query[100];
 
	GetCmdArg(1, arg1, sizeof(arg1));
 	GetCmdArg(2, arg2, sizeof(arg2));

	if (args < 1)
	{
   	ReplyToCommand(client, "[SM] You need to enter a name!");
      //return Plugin_Handled;
	}
	else if (args < 2)
	{
		ReplyToCommand(client, "[SM] You need to enter a password!");
		return Plugin_Handled;
	}
	Database db = Connect()

	if (db == null)
	{
		ReplyToCommand(client, "[SM] Could not connect to database");
		return Plugin_Handled;
	}
	
	Format(query, sizeof(query), "SELECT passwort FROM hlstats_logins WHERE name = '%s'", arg1);
	DBResultSet hQuery = SQL_Query(db, query);
	
	if (hQuery == null)
	{
		char error[255];
		SQL_GetError(db, error, sizeof(error));
		PrintToServer("Failed to query (error: %s)", error);
	} 
	else 
	{
		new String:passwort[120];
		new String:md5pass[256];
		while (SQL_FetchRow(hQuery))
		{
			SQL_FetchString(hQuery, 0,passwort, sizeof(passwort));
		}
		
		Crypt_MD5(arg2,md5pass,256)

		if(StrEqual(md5pass,passwort))
		{
			SetClientName(client, arg1);
			Format(new_name[client],sizeof(new_name[]),"%s",arg1); 
			ReplyToCommand(client, "[SM] Your new name is %s", arg1);
		} 
		else 
		{
			ReplyToCommand(client, "[SM] Dein Passwort war falsch! ");
		}

	}
	delete hQuery;
	return Plugin_Handled;
}


public Action Command_Register(int client, int args)
{
	char arg1[32];
	char arg2[32];
 
	GetCmdArg(1, arg1, sizeof(arg1));
 	GetCmdArg(2, arg2, sizeof(arg2));

	if (args < 1)
  	{
   	ReplyToCommand(client, "[SM] You need to enter a name!");
   	return Plugin_Handled;
  	}
	else if (args < 2)
	{
		ReplyToCommand(client, "[SM] You need to enter a password!");
		return Plugin_Handled;
	}
	 
	char query[100];
	char md5pass[256];
			
	Database db = Connect()

	if (db == null)
	{
		ReplyToCommand(client, "[SM] Could not connect to database");
		return Plugin_Handled;
	}
	
	Format(query, sizeof(query), "SELECT passwort FROM hlstats_logins WHERE name = '%s'", arg1);
	DBResultSet hQuery = SQL_Query(db, query);
	
	if (hQuery == null)
	{
		char error[255];
		SQL_GetError(db, error, sizeof(error));
		PrintToServer("Failed to query (error: %s)", error);
	} 
	else 
	{
		int count = SQL_GetRowCount(hQuery);
		if (count == 0)
		{
			delete hQuery;			
			Crypt_MD5(arg2,md5pass,256)
 
			Format(query, sizeof(query), "INSERT INTO hlstats_logins(name, passwort) VALUES ('%s','%s')", arg1, md5pass);
			SQL_Query(db, query);
			ReplyToCommand(client, "Name erfolgreich registriert!");
			SetClientName(client, arg1);
			
		}
		else 
		{		
			ReplyToCommand(client, "[SM] Der Name %s ist bereits vorhanden!" , arg1);
		}
	}
	delete hQuery;
 
	return Plugin_Handled;
}



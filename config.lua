--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 

Config {}

Config.Death {
    ScreenMessage = true, -- Displays DeathMessage on Screen | Chat Message by Default
    DeathMessage = "You have died!! You may respawn in 60 seconds or revive in 120 seconds.",
}

Config.Revive {
EnableAcePerms = true, -- Addes ACE perm options for admins to bypass revive timer
AcePermString = "AJ.Revive", -- The ACE perm string that will be added to your server.cfg

ReviveTime = 120, -- Amount of time before a player can revive (Seconds)
ReviveMessage = "You have been revived!",
}

Config.Respawn {
EnableAcePerms = true, -- Addes ACE perm options for admins to bypass respawn timer
AcePermString = "AJ.Respawn", -- The ACE perm string that will be added to your server.cfg

RespawnTime = 60, -- Amount of time before a player can respawn (Seconds)
RespawnMessage = "You have been respawned!",
}

Config.Locations { -- Spawn Locations for Respawn
    {
    "name": "Spawn1",
    "x": 123.45,
    "y": 67.89,
    "z": 10.11
  },
  {
    "name": "Spawn2",
    "x": 234.56,
    "y": 78.91,
    "z": 20.21
  },
}

Config.Logs {
  RespawnLog = true, -- Adds logs for players using /respawn
  ReviveLog = true, -- Adds logs for players using /revive
  AdminRespawnLog = true, -- Adds logs for admins using /adrespawn
  AdminReviveLog = true, -- Adds logs for admins using /adrevive

  Webhook = "WEBHOOK_HERE" -- Paste your discord webhook here for logs
  IncludeIP = true, -- Include players IP in the log embed
  IncludeID = true, -- Include players ID in the log embed
  IncludeLicense = true, -- Include players license in the log embed
}
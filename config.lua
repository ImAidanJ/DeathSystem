--  ___              _    _     _                 _ 
-- |_ _|_ __ ___    / \  (_) __| | __ _ _ __     | |
--  | || '_ ` _ \  / _ \ | |/ _` |/ _` | '_ \ _  | |
--  | || | | | | |/ ___ \| | (_| | (_| | | | | |_| |
-- |___|_| |_| |_/_/   \_\_|\__,_|\__,_|_| |_|\___/ 
-- 


-- Support: https://discord.gg/cGdUjQQnNT


Config = {}


Config.EnableAcePerms = true -- Toggle Ace Perms
Config.DeathMessage = "You have died, Wait 60 seconds to respawn or 120 seconds to revive."


Config.Revive = {
  AcePermString = "AJ.Revive", -- The ACE perm string that will be added to your server.cfg
  ReviveTime = 120, -- Amount of time before a player can revive (Seconds)
  ReviveMessage = "You have been revived!",
}


Config.Respawn = {
  AcePermString = "AJ.Respawn", -- The ACE perm string that will be added to your server.cfg
  RespawnTime = 60, -- Amount of time before a player can respawn (Seconds)
  RespawnMessage = "You have been respawned!",
  Location = {
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
  },
}

Config.Logs = {
  RespawnLog = true, -- Adds logs for players using /respawn
  ReviveLog = true, -- Adds logs for players using /revive
  AdminRespawnLog = true, -- Adds logs for admins using /adrespawn
  AdminReviveLog = true, -- Adds logs for admins using /adrevive

  Webhook = "WEBHOOK_HERE" -- Paste your discord webhook here for logs
  IncludeIP = true, -- Include players IP in the log embed
  IncludeID = true, -- Include players ID in the log embed
  IncludeLicense = true, -- Include players license in the log embed
}
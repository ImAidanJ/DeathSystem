Config {}

Config.Death {
    ScreenMessage = true, -- Displays the text on screen (I recommend keeping one true and the other false so it does not send both)
    ChatMessage = false, -- Displays the text in chat (I recommend keeping one true and the other false so it does not send both)
    DeathMessage = "You have died!! You may respawn in 60 seconds or revive in 120 seconds.",
}

Config.Revive {
EnableAcePerms = true, -- Enable perms for admins to revive instanly or to revive others.
AcePermString = "AJ.Revive", -- The ace perm string that will be added to you server.cfg

ReviveTime = 120, -- The amount of time until revive becomes avalible
ReviveMessage = "You have been revived!",
}

Config.Respawn {
EnableAcePerms = true, -- Enable perms for admins to respawn instanly or to respawn others.
AcePermString = "AJ.Respawn", -- The ace perm string that will be added to you server.cfg

RespawnTime = 60, -- The amount of time until respawn becomes avalible (Seconds)
RespawnMessage = "You have been respawned!",
}

Config.Locations {
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
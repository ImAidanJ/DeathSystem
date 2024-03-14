Config {}

Config.Revive {
EnableAcePerms = true, -- Enable perms for admins to revive instanly or to revive others.
AcePermString = "AJ.Revive", -- The ace perm string that will be added to you server.cfg

ReviveTime = 120, -- The amount of time until revive becomes avalible
}

Config.Respawn {
EnableAcePerms = true, -- Enable perms for admins to respawn instanly or to respawn others.
AcePermString = "AJ.Respawn", -- The ace perm string that will be added to you server.cfg

RespawnTime = 60, -- The amount of time until respawn becomes avalible (Seconds)
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
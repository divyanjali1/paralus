local claims = std.extVar('claims');

local fName = if "name" in claims && claims.name!=null && std.length(std.findSubstr(" ", claims.name)) > 0 then std.splitLimit(claims.name, " ", 1)[0] else "Paralus";
local lName = if "name" in claims && claims.name!=null && std.length(std.findSubstr(" ", claims.name)) > 0 then std.splitLimit(claims.name, " ", 1)[1] else "User";

{
  identity: {
    traits: {
      email: claims.email,
      first_name: fName,
      last_name: lName,
      [if "groups" in claims.raw_claims then "idp_groups" else null]: std.split(claims.raw_claims.groups, ','),
    },
    metadata_public: {
      Organization: "c5858cd5-da05-49c7-a1f1-d2a80686aaf8",
      Partner:      "8a173c19-fbc1-43c0-af47-795c60179bc4"
    }
  },
}

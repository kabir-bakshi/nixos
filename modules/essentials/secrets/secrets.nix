let
  kabir = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIB6dH9JLSW2SEAGVoutADGo0xShe7FglMhjvbebl6vLG";
  users = [ kabir ];

  m720q = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAII087V1RBzhck4tC4Qi8ezYVsYfGVzQYb13myxKWMZYV";
  systems = [ m720q ];
in
{
  "aria2.age".publicKeys = [ kabir m720q ];
}

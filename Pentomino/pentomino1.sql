--  @C:\Work\Pentomino\pentomino1
@@C:\Work\Pentomino\pentomoni
doc

create table steen_definitie
(steen_nr   number(2,0) not null
,orientatie number(1,0) not null
,x1         number(1,0) not null
,y1         number(1,0) not null
,x2         number(1,0) not null
,y2         number(1,0) not null
,x3         number(1,0) not null
,y3         number(1,0) not null
,x4         number(1,0)
,y4         number(1,0)
,x5         number(1,0)
,y5         number(1,0)
,disp_x     number(1,0)
,max_x      number(1,0)
,max_y      number(1,0)
)
tablespace users;

alter table  steen_definitie
  add constraint steen_definitie_pk primary key (steen_nr, orientatie)
  using index tablespace users;

create table steen
(steen_nr   number(2,0) not null
,orientatie number(1,0) not null
,x          number(1,0) not null
,y          number(1,0) not null)
tablespace users;

alter table  steen
  add constraint steen_pk primary key (steen_nr, orientatie, x, y)
  using index tablespace users;

create table pentomino_oplossing
(volgnummer  number(10,0)
,regelnummer       number(1,0)
,tekst       varchar2(11))
tablespace users;

alter table  pentomino_oplossing
  add constraint pentomino_oplossing_pk primary key (volgnummer, regelnummer)
  using index tablespace users;


col volgnummer  for 9999
col regelnummer for 9999

select volgnummer, regelnummer, tekst from pentomino_oplossing
order by volgnummer, regelnummer
/


#

set serveroutput on size 1000000
set lines 120 pages 1000


declare
type punt_ty  is record (kleur char, vrij boolean);
type rij_ty   is table of punt_ty index by binary_integer;
type vlak_ty  is table of rij_ty  index by binary_integer;
pentomino vlak_ty;

blank   constant char  := '.';
grijs   constant char  := 'X';
oranje  constant char  := 'O';


l_oplossing_nr number(10,0) := 1;
l_regelnummer  number(10,0) := 1;

type steen_ty is record (kleur char, beschikbaar number(1,0));
type blok_ty  is table of steen_ty index by binary_integer;
blokje blok_ty;


procedure vul_stenen_van_def is
begin
  delete from steen;
  insert into steen select steen_nr, orientatie, x1, y1 from steen_definitie;
  insert into steen select steen_nr, orientatie, x2, y2 from steen_definitie;
  insert into steen select steen_nr, orientatie, x3, y3 from steen_definitie;
  insert into steen select steen_nr, orientatie, x4, y4 from steen_definitie where x4 is not null and y4 is not null;
  insert into steen select steen_nr, orientatie, x5, y5 from steen_definitie where x5 is not null and y5 is not null;

  update steen_definitie d
  set disp_x = (select min(x) from steen s where s.steen_nr = d.steen_nr and s.orientatie = d.orientatie and s.y =0)
    , max_x  = (select max(x) from steen s where s.steen_nr = d.steen_nr and s.orientatie = d.orientatie)
    , max_y  = (select max(y) from steen s where s.steen_nr = d.steen_nr and s.orientatie = d.orientatie)
;
  commit;
end;


procedure init_pentomino
is
begin
  for x in 1 .. 11
  loop
    for y in 1 .. 5
    loop
      pentomino(x)(y).kleur := blank;
      pentomino(x)(y).vrij  := true;
    end loop;
  end loop;
end;


procedure init_steen
is
begin
  blokje(1).kleur  := 'A'; blokje(1).beschikbaar   := 1;
  blokje(2).kleur  := 'B'; blokje(2).beschikbaar   := 1;
  blokje(3).kleur  := 'C'; blokje(3).beschikbaar   := 1;
  blokje(4).kleur  := 'D'; blokje(4).beschikbaar   := 1;
  blokje(5).kleur  := 'E'; blokje(5).beschikbaar   := 1;
  blokje(6).kleur  := 'F'; blokje(6).beschikbaar   := 1;
  blokje(7).kleur  := 'G'; blokje(7).beschikbaar   := 1;
  blokje(8).kleur  := 'H'; blokje(8).beschikbaar   := 1;
  blokje(9).kleur  := 'I'; blokje(9).beschikbaar   := 1;
  blokje(10).kleur := 'J'; blokje(10).beschikbaar  := 1;
  blokje(11).kleur := 'K'; blokje(11).beschikbaar  := 1;
  blokje(12).kleur := 'L'; blokje(12).beschikbaar  := 1;
end;


procedure print_steen (p_steen in number, p_orientatie in number)
is
bord vlak_ty;
begin
  for x in 0 .. 3
  loop
    for y in 0 .. 3
    loop
      bord(x)(y).kleur := blank;
    end loop;
  end loop;

  for j in (select x, y from steen where steen_nr = p_steen and orientatie = p_orientatie)
  loop
    bord(j.x)(j.y).kleur := grijs;
  end loop;

  bord(0)(0).kleur := oranje;

    for y in reverse 0 .. 3
    loop
      for x in 0 .. 3
      loop
        dbms_output.put(bord(x)(y).kleur);
      end loop;
      dbms_output.new_line;
    end loop;
end;


procedure print_pentomino
is
begin
    for y in reverse 1 .. 5
    loop
      for x in 1 .. 11
      loop
        dbms_output.put(pentomino(x)(y).kleur);
      end loop;
      dbms_output.new_line;
    end loop;
end;


procedure bewaar_pentomino_oplossing
is
l_hulpstring   varchar2(11);
begin
    for y in reverse 1 .. 5
    loop
      l_hulpstring := '';
      for x in 1 .. 11
      loop
        l_hulpstring := l_hulpstring || pentomino(x)(y).kleur;
      end loop;
      insert into pentomino_oplossing values(l_oplossing_nr, l_regelnummer, l_hulpstring);
      l_regelnummer := l_regelnummer + 1;
    end loop;
    commit;
l_oplossing_nr := l_oplossing_nr + 1;
end;


procedure bereken_pentomino (p_diepte in number) is
l_x            number(2,0);
l_y            number(2,0);
l_kan_leggen   boolean;
begin
l_x := mod(p_diepte -1, 11) + 1;
l_y := floor((p_diepte-1) / 11) + 1;

if p_diepte >= 44
then
  -- print_pentomino;  -- !! Hebbes
  bewaar_pentomino_oplossing;
elsif not pentomino(l_x)(l_y).vrij
then bereken_pentomino (p_diepte + 1);
else
  for j in (select steen_nr, orientatie, disp_x, max_x, max_y from steen_definitie)
  loop
  if blokje(j.steen_nr).beschikbaar = 1
  then

    l_kan_leggen := true;
    if
     l_x - j.disp_x < 1 or
     l_x + j.max_x  - j.disp_x > 11 or
     l_y + j.max_y > 5
    then
      l_kan_leggen := false;
    else
      <<lus>>
      for k in (select x - j.disp_x x, y from steen where steen_nr = j.steen_nr and orientatie = j.orientatie)
      loop
        l_kan_leggen := pentomino(l_x + k.x)(l_y + k.y).vrij;
        exit lus when not l_kan_leggen;
      end loop;
    end if;

  -- Indien mogelijk, leg steen
    if l_kan_leggen
    then

      for l in (select x - j.disp_x x, y from steen where steen_nr = j.steen_nr and orientatie = j.orientatie)
      loop
        pentomino(l_x + l.x)(l_y + l.y).kleur := blokje(j.steen_nr).kleur;
        pentomino(l_x + l.x)(l_y + l.y).vrij  := false;
      end loop;

      blokje(j.steen_nr).beschikbaar   := 0;

      bereken_pentomino (p_diepte + 1);

      blokje(j.steen_nr).beschikbaar   := 1;

      for m in (select x - j.disp_x x, y from steen where steen_nr = j.steen_nr and orientatie = j.orientatie)
      loop
        pentomino(l_x + m.x)(l_y + m.y).kleur := blank;
        pentomino(l_x + m.x)(l_y + m.y).vrij  := true;
      end loop;
    end if;

  end if;
  end loop;
end if;

end;


begin
-- Initiatie routine
init_steen;
init_pentomino;
vul_stenen_van_def;

delete from pentomino_oplossing;
commit;

-- Vullen vaste vlakken

-- Blokje 11

pentomino(1)(5).kleur := blokje(11).kleur;  pentomino(1)(5).vrij  := false;
pentomino(2)(5).kleur := blokje(11).kleur;  pentomino(2)(5).vrij  := false;
pentomino(3)(5).kleur := blokje(11).kleur;  pentomino(3)(5).vrij  := false;
pentomino(3)(4).kleur := blokje(11).kleur;  pentomino(3)(4).vrij  := false;
blokje(11).beschikbaar  := 0;

-- Blokje 4

pentomino(4)(5).kleur := blokje(4).kleur;  pentomino(4)(5).vrij  := false;
pentomino(5)(5).kleur := blokje(4).kleur;  pentomino(5)(5).vrij  := false;
pentomino(6)(5).kleur := blokje(4).kleur;  pentomino(6)(5).vrij  := false;
pentomino(7)(5).kleur := blokje(4).kleur;  pentomino(7)(5).vrij  := false;
blokje(4).beschikbaar  := 0;

-- Blokje 10

pentomino(8)(5).kleur  := blokje(10).kleur;  pentomino(8)(5).vrij   := false;
pentomino(9)(5).kleur  := blokje(10).kleur;  pentomino(9)(5).vrij   := false;
pentomino(10)(5).kleur := blokje(10).kleur;  pentomino(10)(5).vrij  := false;
pentomino(11)(5).kleur := blokje(10).kleur;  pentomino(11)(5).vrij  := false;
pentomino(10)(4).kleur := blokje(10).kleur;  pentomino(10)(4).vrij  := false;
blokje(10).beschikbaar  := 0;


-- In recursie
 bereken_pentomino(1);

end;
/



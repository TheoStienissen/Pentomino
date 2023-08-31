create table pentomino
( series       number(2)
, orientation  number(1)
, mirror       number(1)
, color        char(1)
, x1           number(1)
, y1           number(1)
, x2           number(1)
, y2           number(1)
, x3           number(1)
, y3           number(1)
, x4           number(1)
, y4           number(1));


create table t_pentomino
( series       number(2)
, orientation  number(1)
, color        char(1)
, x           number(1)
, y           number(1)
, x_min       number(1)
, x_max       number(1)
, y_max       number(1));

-- I
insert into pentomino values (  1, 1, 0, 'I', 0, 1, 0, 2, 0, 3, 0, 4);
insert into pentomino values (  1, 2, 0, 'I', 1, 0, 2, 0, 3, 0, 4, 0);

-- T
insert into pentomino values (  2, 1, 0, 'T', 0, 1, 0, 2, 1, 2,-1, 2);
insert into pentomino values (  2, 2, 0, 'T', 0, 1, 0, 2,-1, 0, 1, 0);
insert into pentomino values (  2, 3, 0, 'T', 0, 1, 0, 2, 1, 1, 2, 1);
insert into pentomino values (  2, 4, 0, 'T', 0, 1, 0, 2,-1, 1,-2, 1);

-- X
insert into pentomino values ( 10, 1, 0, 'X', 0, 1, 0, 2, 1, 1,-1, 1);

-- J
insert into pentomino values (  3, 1, 1, 'J', 0, 1, 1, 1, 2, 1, 3, 1);
insert into pentomino values (  3, 2, 1, 'J', 0, 1, 0, 2, 0, 3, 1, 0);
insert into pentomino values (  3, 3,-1, 'J', 0, 1, 1, 0, 2, 0, 3, 0);
insert into pentomino values (  3, 4,-1, 'J', 1, 0, 1, 1, 1, 2, 1, 3);
insert into pentomino values (  3, 5,-1, 'J', 0, 1,-1, 1,-2, 1,-3, 1);
insert into pentomino values (  3, 6,-1, 'J', 0, 1, 0, 2, 0, 3, 1, 3);
insert into pentomino values (  3, 7, 1, 'J', 0, 1, 0, 2, 0, 3,-1, 3);
insert into pentomino values (  3, 8, 1, 'J', 1, 0, 2, 0, 3, 0, 3, 1);

-- U
insert into pentomino values (  4, 1, 0, 'U', 1, 0, 0, 1, 0, 2, 1, 2);
insert into pentomino values (  4, 2, 0, 'U', 0, 1, 1, 1, 2, 0, 2, 1);
insert into pentomino values (  4, 3, 0, 'U', 0, 1, 1, 0, 2, 0, 2, 1);
insert into pentomino values (  4, 4, 0, 'U', 0, 2, 1, 0, 1, 1, 1, 2);

-- L
insert into pentomino values (  5, 1, 0, 'L', 0, 1, 0, 2, 1, 2, 2, 2);
insert into pentomino values (  5, 2, 0, 'L', 0, 1, 0, 2, 1, 0, 2, 0);

insert into pentomino values (  5, 3, 0, 'L', 1, 0, 2, 0, 2, 1, 2, 2);
insert into pentomino values (  5, 4, 0, 'L', 0, 1, 0, 2,-1, 2,-2, 2);

-- insert into pentomino values (  5, 3, 0, 'L', 0, 1, 0, 2, 1, 2, 2, 2);
-- insert into pentomino values (  5, 4, 0, 'L', 1, 0, 2, 0, 2, 1, 2, 2);

-- P
insert into pentomino values (  6, 1, 1, 'P', 0, 1, 0, 2, 1, 1, 1, 2);
insert into pentomino values (  6, 2, 1, 'P', 1, 0, 2, 0, 0, 1, 1, 1);
insert into pentomino values (  6, 3,-1, 'P', 0, 1, 0, 2,-1, 1,-1, 2);
insert into pentomino values (  6, 4,-1, 'P', 1, 0, 0, 1, 1, 1, 2, 1);
insert into pentomino values (  6, 5,-1, 'P', 1, 0, 2, 0, 1, 1, 2, 1);
insert into pentomino values (  6, 6, 1, 'P', 1, 0,-1, 1, 0, 1, 1, 1);
insert into pentomino values (  6, 7,-1, 'P', 0, 1, 0, 2, 1, 0, 1, 1);
insert into pentomino values (  6, 8, 1, 'P', 0, 1, 1, 0, 1, 1, 1, 2);

-- Y
insert into pentomino values (  7, 1, 1, 'Y', 0, 1, 0, 2, 0, 3, 1, 2);
insert into pentomino values (  7, 2,-1, 'Y', 0, 1, 0, 2, 0, 3,-1, 2);
insert into pentomino values (  7, 3,-1, 'Y', 0, 1, 0, 2, 0, 3, 1, 1);
insert into pentomino values (  7, 4, 1, 'Y', 0, 1, 0, 2, 0, 3,-1, 1);
insert into pentomino values (  7, 5, 1, 'Y', 1, 0, 2, 0, 3, 0, 1, 1);
insert into pentomino values (  7, 6,-1, 'Y', 1, 0, 2, 0, 3, 0, 2, 1);
insert into pentomino values (  7, 7,-1, 'Y',-1, 1, 0, 1, 1, 1, 2, 1);
insert into pentomino values (  7, 8, 1, 'Y',-2, 1,-1, 1, 0, 1, 1, 1);

-- W
insert into pentomino values (  8, 1, 0, 'W',-1, 1,-1, 2, 0, 1, 1, 0);
insert into pentomino values (  8, 2, 0, 'W', 1, 0, 1, 1, 2, 1, 2, 2);
insert into pentomino values (  8, 3, 0, 'W', 0, 1,-1, 1,-1, 2,-2, 2);
insert into pentomino values (  8, 4, 0, 'W', 0, 1, 1, 1, 1, 2, 2, 2);

-- F
insert into pentomino values (  9, 1, 1, 'F', 0, 1, 0, 2,-1, 1, 1, 2);
insert into pentomino values (  9, 2, 1, 'F', 0, 1,-1, 1,-1, 2, 1, 1);
insert into pentomino values (  9, 3, 1, 'F', 0, 1, 0, 2,-1, 0, 1, 1);
insert into pentomino values (  9, 4,-1, 'F',-1, 1, 0, 1, 1, 1, 1, 2);
insert into pentomino values (  9, 5,-1, 'F', 0, 1, 0, 2,-1, 2, 1, 1);
insert into pentomino values (  9, 6,-1, 'F', 0, 1, 1, 1, 1, 2, 2, 1);
insert into pentomino values (  9, 7,-1, 'F', 0, 1, 0, 2,-1, 1, 1, 0);
insert into pentomino values (  9, 8, 1, 'F',-2, 1,-1, 1, 0, 1,-1, 2);

-- Z
insert into pentomino values ( 12, 1, 1, 'Z', 0, 1, 0, 2,-1, 2, 1, 0);
insert into pentomino values ( 12, 2,-1, 'Z', 0, 1, 0, 2,-1, 0, 1, 2);
insert into pentomino values ( 12, 3, 1, 'Z', 0, 1, 1, 1, 2, 1, 2, 2);
insert into pentomino values ( 12, 4,-1, 'Z', 0, 1,-1, 1,-2, 1,-2, 2);

-- N
insert into pentomino values ( 11, 1, 1, 'N', 0, 1,-1, 1,-1, 2,-1, 3);
insert into pentomino values ( 11, 2,-1, 'N', 0, 1, 1, 1, 1, 2, 1, 3);
insert into pentomino values ( 11, 3, 1, 'N', 0, 1, 0, 2, 1, 2, 1, 3);
insert into pentomino values ( 11, 4,-1, 'N', 1, 0, 2, 0, 2, 1, 3, 1);
insert into pentomino values ( 11, 5,-1, 'N',-2, 1,-1, 1, 0, 1, 1, 0);
insert into pentomino values ( 11, 6,-1, 'N',-1, 1, 0, 1, 1, 0, 2, 0);
insert into pentomino values ( 11, 7, 1, 'N', 1, 0, 1, 1, 2, 1, 3, 1);
insert into pentomino values ( 11, 8,-1, 'N', 0, 1, 0, 2,-1, 2,-1, 3);


alter table pentomino add constraint pentomino_pk primary key (series, orientation) using index;

create table pentomino_solutions
( id         number(6)
, line_no    number(2)
, text       varchar2(30));

create sequence pentomino_solutions_seq;

create trigger pentomino_solutions_briu
before insert or update on  pentomino_solutions
for each row
begin
if :new.id is null
then
  select pentomino_solutions_seq.nextval into :new.id from dual;
end if;
end pentomino_solutions_briu;
/


create or replace view v_pentomino_stone as
select 10 *  series + orientation stone, 0 x, 0 y, color from pentomino
union all
select 10 *  series + orientation, x1, y1, color from pentomino
union all
select 10 *  series + orientation, x2, y2, color from pentomino
union all
select 10 *  series + orientation, x3, y3, color from pentomino
union all
select 10 *  series + orientation, x4, y4, color from pentomino
/

create or replace view v_pentomino as
select series, orientation, 0 x, 0 y, color from pentomino
union all
select series, orientation, x1, y1, color from pentomino
union all
select series, orientation, x2, y2, color from pentomino
union all
select series, orientation, x3, y3, color from pentomino
union all
select series, orientation, x4, y4, color from pentomino
/

/*************************************************************************************************************************************************/

Name:        pentomino_pkg.sql

Last update: 16-th of March 2014

Author:      Theo stienissen

E-mail:      theo.stienissen@gmail.com


create or replace package pentomino_pkg
as

type pentomino_point_ty      is record (field varchar2(1));
type pentomino_row_ty        is table of pentomino_point_ty index by pls_integer;
type pentomino_ty            is table of pentomino_pkg.pentomino_row_ty index by pls_integer;
p_pentomino                  pentomino_ty;

type stone_ty                is record (available pls_integer);
type stone_array_ty          is table of stone_ty index by pls_integer;
p_stone                      stone_array_ty;

type v_pentomino_ty          is record (series number(2), orientation  number(1), x number(1), y number(1), color char(1));
type v_pentomino_row_ty      is table of v_pentomino_ty index by pls_integer;

p_width       number(3) := 12;
p_heigth      number(3) := 5;
p_stones      number(2);

free          constant varchar2(1) := '.';
border        constant varchar2(1) := 'X';

procedure init_pentomino;

procedure print_stone (p_stone in number);

procedure print_pentomino;

procedure save_pentomino;

function stone_free (p_series in number) return number;

procedure resolve_pentomino (p_x in number, p_y in number);

end pentomino_pkg;
/

/*************************************************************************************************************************************************/

create or replace package body pentomino_pkg
as

procedure init_pentomino
is
begin
  for x in 1 .. pentomino_pkg.p_width
  loop
    for y in 1 .. pentomino_pkg.p_heigth
    loop
      p_pentomino(x)(y).field  := pentomino_pkg.free;
    end loop;
  end loop;

  select count(distinct series) into pentomino_pkg.p_stones from pentomino;

  for j in 1 .. pentomino_pkg.p_stones
  loop
    p_stone(j).available := 1;
  end loop;

--  execute immediate 'truncate table t_pentomino';
--  insert into t_pentomino (series , orientation, x, y, color) select * from v_pentomino;
--  commit;

end init_pentomino;

/*************************************************************************************************************************************************/

procedure print_stone (p_stone in number)
is
l_pentomino           pentomino_ty;
begin
dbms_output.put_line(to_char(p_stone));
for x in 1 .. 8
loop
  for y in 1 .. 5
  loop
    l_pentomino(x)(y).field := '.';
  end loop;
end loop;
for j in (select x + 4 xc, y + 1 yc, color from v_pentomino_stone where stone = p_stone)
loop
  l_pentomino(j.xc)(j.yc).field := j.color;
end loop;

for y in reverse 1 .. 5
loop
  for x in 1 .. 8
  loop
    dbms_output.put(' ' || l_pentomino(x)(y).field || ' ' );
  end loop;
  dbms_output.new_line;
end loop;
dbms_output.put_line('Done');
end print_stone;

/*************************************************************************************************************************************************/

procedure print_pentomino
is
begin
for y in reverse 1 .. pentomino_pkg.p_heigth
loop
  for x in 1 .. pentomino_pkg.p_width
  loop
    dbms_output.put(' ' || p_pentomino(x)(y).field || ' ' );
  end loop;
  dbms_output.new_line;
end loop;
dbms_output.put_line('Done');
end print_pentomino;

/*************************************************************************************************************************************************/

function stone_free (p_series in number) return number
is
begin
  return pentomino_pkg.p_stone(p_series).available;
end stone_free;

/*************************************************************************************************************************************************/

procedure resolve_pentomino (p_x in number, p_y in number)
is
l_bool   boolean;
l_x      number(2);
l_y      number(2);
l_pentomino_rows v_pentomino_row_ty;
l_count  number(5) := 1;
begin
  select series, orientation, x, y, color bulk collect into l_pentomino_rows from t_pentomino t
  where p_x between x_min and pentomino_pkg.p_width + x_max and p_y <= pentomino_pkg.p_heigth + y_max
    and stone_free(t.series) = 1
  order by series, orientation;

  while l_count < l_pentomino_rows.count
  loop
      l_bool        := true;
      <<done>>  -- Check if stone fits
      for k in l_count .. l_count + 4
      loop
        l_bool := p_pentomino(p_x + l_pentomino_rows(k).x)(p_y + l_pentomino_rows(k).y).field = pentomino_pkg.free;
        exit done when not l_bool;
      end loop;

      if l_bool
      then                            -- Place stone and make unavailable
        for l in l_count .. l_count + 4
        loop
          p_pentomino(p_x + l_pentomino_rows(l).x)(p_y + l_pentomino_rows(l).y).field := l_pentomino_rows(l).color;
        end loop;
        pentomino_pkg.p_stone(l_pentomino_rows(l_count).series).available := 0;

        l_x  := p_x;l_y := p_y;        -- Determine next starting point
        <<ready>>
        while l_bool
        loop
          if l_x >= pentomino_pkg.p_width then l_x := 1; l_y := l_y + 1; else l_x := l_x + 1; end if;
          exit ready when l_y > pentomino_pkg.p_heigth;
          l_bool := p_pentomino(l_x)(l_y).field != pentomino_pkg.free;
        end loop;

        if    l_y > pentomino_pkg.p_heigth then  save_pentomino;
        elsif not l_bool then  resolve_pentomino(l_x, l_y);
        end if;

        for m in l_count .. l_count + 4 -- Remove stone and make available
        loop
          p_pentomino(p_x + l_pentomino_rows(m).x)(p_y + l_pentomino_rows(m).y).field := pentomino_pkg.free;
        end loop;
        pentomino_pkg.p_stone(l_pentomino_rows(l_count).series).available := 1;
     end if;
    l_count := l_count + 5;
  end loop;

end resolve_pentomino;

/*************************************************************************************************************************************************/

procedure save_pentomino
is
l_text   varchar2(30);
begin
for y in reverse 1 .. pentomino_pkg.p_heigth
loop
  l_text := '';
  for x in 1 .. pentomino_pkg.p_width
  loop
    l_text := l_text || p_pentomino(x)(y).field;
  end loop;
  insert into pentomino_solutions (line_no, text) values (y, l_text);
end loop;
commit;
end save_pentomino;

end pentomino_pkg;
/

===========

set serveroutput on size unlimited
begin
for k in (select distinct stone from v_pentomino_stone order by stone)
loop
  pentomino_pkg.print_stone(k.stone);
end loop;
end;
/

begin
  pentomino_pkg.init_pentomino;
  pentomino_pkg.resolve_pentomino(1,1);
end;
/


===========
declare
l_bool boolean;
l_x_min number(20);
l_x_max number(20);
l_y_max number(20);
begin
pentomino_pkg.init_pentomino;
for j in (select distinct series, orientation from pentomino order by series, orientation)
loop
  l_x_min := 100;
  l_x_max := 0;
  l_y_max := 0;
  pentomino_pkg.print_stone(10 * j.series + j.orientation);

  for x_c in 1 .. pentomino_pkg.p_width
  loop
    for y_c in 1 .. pentomino_pkg.p_heigth
    loop
      l_bool := true;
      <<done1>>
      for s in (select x, y from v_pentomino where series = j.series and orientation = j.orientation)
      loop
        l_bool := x_c + s.x between 1 and pentomino_pkg.p_width and y_c + s.y between 1 and pentomino_pkg.p_heigth;
        exit done1 when not l_bool;
      end loop;
      if l_bool
      then
        l_x_min := least(l_x_min, x_c);
        l_x_max := greatest(l_x_max, x_c);
	l_y_max := greatest(l_y_max, y_c);
      end if;
    end loop;
  end loop;
  dbms_output.put_line('X-min:  ' || to_char(l_x_min));
  dbms_output.put_line('X-max:  ' || to_char(l_x_max));
  dbms_output.put_line('Y-max:  ' || to_char(l_y_max));
end loop;
end;
/




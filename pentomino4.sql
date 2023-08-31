--
-- Combination of series and orientation is unique
--
create table pentomino
( series       number(2)
, orientation  number(1)
, color        char(1)
, x_min       number(1)
, x_max       number(1)
, y_min       number(1)
, y_max       number(1));

alter table pentomino add constraint pentomino1_pk primary key (series, orientation) using index;

create table pentomino_position
( series       number(2)
, orientation  number(1)
, x            number(1)
, y            number(1)
, z            number(1));

-- alter table pentomino_position add constraint pentomino_position_pk primary key (series, orientation) using index;
alter table pentomino_position add constraint pentomino_position_fk1 foreign key (series, orientation) references pentomino (series, orientation) on delete cascade;

-- I
insert into pentomino values (1, 1, 'I', null, null, null, null);
insert into pentomino_position values (1, 1, 0, 0, 0);
insert into pentomino_position values (1, 1, 0, 1, 0);
insert into pentomino_position values (1, 1, 0, 2, 0);
insert into pentomino_position values (1, 1, 0, 3, 0);

-- T
insert into pentomino values (2, 1, 'T', null, null, null, null);
insert into pentomino_position values (2, 1, 0, 0, 0);
insert into pentomino_position values (2, 1, 0, 1, 0);
insert into pentomino_position values (2, 1, 0, 2, 0);
insert into pentomino_position values (2, 1,-1, 2, 0);
insert into pentomino_position values (2, 1, 1, 2, 0);

-- X
insert into pentomino values (3, 1, 'X', null, null, null, null);
insert into pentomino_position values (3, 1, 0, 0, 0);
insert into pentomino_position values (3, 1, 0, 1, 0);
insert into pentomino_position values (3, 1, 0, 2, 0);
insert into pentomino_position values (3, 1, 1, 1, 0);
insert into pentomino_position values (3, 1,-1, 1, 0);

-- J
insert into pentomino values (4, 1, 'J', null, null, null, null);
insert into pentomino_position values (4, 1, 0, 0, 0);
insert into pentomino_position values (4, 1, 0, 1, 0);
insert into pentomino_position values (4, 1, 1, 1, 0);
insert into pentomino_position values (4, 1, 2, 1, 0);
insert into pentomino_position values (4, 1, 3, 1, 0);

-- U
insert into pentomino values (5, 1, 'U', null, null, null, null);
insert into pentomino_position values (5, 1, 0, 0, 0);
insert into pentomino_position values (5, 1, 1, 0, 0);
insert into pentomino_position values (5, 1, 0, 1, 0);
insert into pentomino_position values (5, 1, 0, 2, 0);
insert into pentomino_position values (5, 1, 1, 2, 0);

-- L
insert into pentomino values (6, 1, 'L', null, null, null, null);       
insert into pentomino_position values (6, 1, 0, 0, 0);
insert into pentomino_position values (6, 1, 0, 1, 0);
insert into pentomino_position values (6, 1, 0, 2, 0);
insert into pentomino_position values (6, 1, 1, 2, 0);
insert into pentomino_position values (6, 1, 2, 2, 0);

-- P
insert into pentomino values (7, 1, 'P', null, null, null, null);
insert into pentomino_position values (7, 1, 0, 0, 0);
insert into pentomino_position values (7, 1, 0, 1, 0);
insert into pentomino_position values (7, 1, 0, 2, 0);
insert into pentomino_position values (7, 1, 1, 1, 0);
insert into pentomino_position values (7, 1, 1, 2, 0);
       
-- Y
insert into pentomino values (8, 1, 'Y', null, null, null, null);
insert into pentomino_position values (8, 1, 0, 0, 0);
insert into pentomino_position values (8, 1, 0, 1, 0);
insert into pentomino_position values (8, 1, 0, 2, 0);
insert into pentomino_position values (8, 1, 0, 3, 0);
insert into pentomino_position values (8, 1, 1, 2, 0);

-- W
insert into pentomino values (9, 1, 'W', null, null, null, null);
insert into pentomino_position values (9, 1, 0, 0, 0);
insert into pentomino_position values (9, 1,-1, 1, 0);
insert into pentomino_position values (9, 1,-1, 2, 0);
insert into pentomino_position values (9, 1, 0, 1, 0);
insert into pentomino_position values (9, 1, 1, 0, 0);

-- F
insert into pentomino values (10, 1, 'F', null, null, null, null);
insert into pentomino_position values (10, 1, 0, 0, 0);       
insert into pentomino_position values (10, 1, 0, 1, 0);       
insert into pentomino_position values (10, 1, 0, 2, 0);       
insert into pentomino_position values (10, 1,-1, 1, 0);       
insert into pentomino_position values (10, 1, 1, 2, 0);       

-- N
insert into pentomino values (11, 1, 'N', null, null, null, null);
insert into pentomino_position values (11, 1, 0, 0, 0);
insert into pentomino_position values (11, 1, 0, 1, 0);
insert into pentomino_position values (11, 1,-1, 1, 0);
insert into pentomino_position values (11, 1,-1, 2, 0);
insert into pentomino_position values (11, 1,-1, 3, 0);

-- Z
insert into pentomino values ( 12, 1, 'Z', null, null, null, null);
insert into pentomino_position values (12, 1, 0, 0, 0);
insert into pentomino_position values (12, 1, 0, 1, 0);
insert into pentomino_position values (12, 1, 0, 2, 0);
insert into pentomino_position values (12, 1,-1, 2, 0);
insert into pentomino_position values (12, 1, 1, 0, 0);


/*************************************************************************************************************************************************/

Name:        pentomino_pkg.sql

Last update: 16-th of September 2014

Author:      Theo stienissen

E-mail:      theo.stienissen@gmail.com


create or replace package pentomino_pkg
as

type point_ty         is record (free boolean);
type line_ty          is table of point_ty  index by binary_integer;
type square_ty        is table of line_ty   index by binary_integer;
type pentomino_ty     is table of square_ty index by binary_integer;
p_pentomino           pentomino_ty;

type stone_ty         is record (available pls_integer);
type stone_array_ty   is table of stone_ty index by pls_integer;
p_stone               stone_array_ty;

p_width       number(3) := 12;
p_heigth      number(3) := 5;
p_stones      number(2);

free          constant varchar2(1) := '.';
border        constant varchar2(1) := 'X';

procedure init_pentomino_2D (p_pentomino in out pentomino_ty);

procedure init_pentomino_3D (p_pentomino in out pentomino_ty);

function  depth_to_coordinates (p_depth in number) return matrix_pkg.point_ty;

-- Set min_x, min_y,
procedure normalize (p_series in number, p_orientation in number);

procedure normalize;

--
-- Print different projections of the stone
--
procedure print_stone_xy (p_series in number, p_orientation in number);

procedure print_stone_xz (p_series in number, p_orientation in number);

procedure print_stone_yz (p_series in number, p_orientation in number);

procedure print_pentomino;

procedure save_pentomino;

procedure deduplicate(p_series in number, p_orientation in number);

function  stone_free (p_series in number) return boolean;

procedure resolve_pentomino_2D (p_x in number, p_y in number);

procedure resolve_pentomino_3D (p_x in number, p_y in number, p_z in number);

end pentomino_pkg;
/

/*************************************************************************************************************************************************/

create or replace package body pentomino_pkg
as

procedure init_pentomino_2D (p_pentomino in out pentomino_ty)
is
begin
  for x in 0 .. pentomino_pkg.p_width - 1
  loop
    for y in 0 .. pentomino_pkg.p_heigth - 1
    loop
      p_pentomino(x)(y)(0).field  := pentomino_pkg.free;
    end loop;
  end loop;

end init_pentomino_2D;

/*************************************************************************************************************************************************/

procedure init_pentomino_3D (p_pentomino in out pentomino_ty)
is
begin
  for x in 0 .. pentomino_pkg.p_heigth - 1
  loop
    for y in 0 .. pentomino_pkg.p_heigth - 1
    loop
      for z in 0 .. pentomino_pkg.p_heigth - 1
      loop
         p_pentomino(x)(y)(z).field  := pentomino_pkg.free;
      end loop;
    end loop;
  end loop;

end init_pentomino_3D;

/*************************************************************************************************************************************************/

function  depth_to_coordinates (p_depth in number) return matrix_pkg.point_ty
is
l_point  matrix_pkg.point_ty;
l_sqr    number(3) := 0;
l_rest   number(3);
begin

for j in 1 .. p_heigth
loop
  l_sqr := l_sqr + j * j;
end loop;

<<get_out>>
for j in 1 .. l_height + 1
loop
  if depth >= l_sqr
  then l_point.z := p_heigth - j + 1; l_rest := depth - l_sqr;
       exit get_out;
  end if;
  l_sqr := l_sqr - j * j;
end loop;
l_point.x := 2 * mod(l_rest, p_heigth - z) + z;
l_point.y := 2 * floor(l_rest / (p_heigth - z)) + z;

return l_point;

end depth_to_coordinates;

/*************************************************************************************************************************************************/

procedure normalize (p_series in number, p_orientation in number)
is
begin
  update pentomino_position p
    set z = z - (select min(z) from pentomino_position where series = p_series and orientation = p_orientation)
    where p.series = p_series and p.orientation = p_orientation;

  update pentomino_position
    set y = y - (select min(p3.y) from pentomino_position p3 where p3.series = p_series and p3.orientation = p_orientation and p3.z = 0)
    where series = p_series and orientation = p_orientation;

  update pentomino_position
    set x = x - (select min(p2.x) from pentomino_position p2 where p2.series = p_series and p2.orientation = p_orientation and p2.z = 0 and p2.y = 0)
    where series = p_series and orientation = p_orientation;

  update pentomino
    set  x_min = (select min(x) from pentomino_position where series = p_series and orientation = p_orientation),
         x_max = (select max(x) from pentomino_position where series = p_series and orientation = p_orientation),
         y_min = (select min(y) from pentomino_position where series = p_series and orientation = p_orientation),
         y_max = (select max(y) from pentomino_position where series = p_series and orientation = p_orientation)
    where series = p_series and orientation = p_orientation;
commit;

end normalize;


/*************************************************************************************************************************************************/

procedure normalize
is
begin
for j in (select distinct series, orientation from pentomino)
loop
   normalize (j.series, j.orientation);
end loop;
end normalize;

/*************************************************************************************************************************************************/function  depth_to_co

procedure print_stone (p_series in number, p_orientation in number)
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


================

Not used:


type pentomino_point_ty      is record (field varchar2(1));
type pentomino_row_ty        is table of pentomino_point_ty index by pls_integer;
type pentomino_ty            is table of pentomino_pkg.pentomino_row_ty index by pls_integer;
p_pentomino                  pentomino_ty;


type v_pentomino_ty          is record (series number(2), orientation  number(1), x number(1), y number(1), color char(1));
type v_pentomino_row_ty      is table of v_pentomino_ty index by pls_integer;

--

  select count(distinct series) into pentomino_pkg.p_stones from pentomino;

  for j in 1 .. pentomino_pkg.p_stones
  loop
    p_stone(j).available := 1;
  end loop;

--  execute immediate 'truncate table t_pentomino';
--  insert into t_pentomino (series , orientation, x, y, color) select * from v_pentomino;
--  commit;


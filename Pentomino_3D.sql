--
-- This part translates the recursion depth to x, y, z co-ordinates
--
set serveroutput on size unlimited
declare

-- Matrix:
-- ( 11   ...    n1 )
--        ...
-- ( 1m   ...    mn )
--
-- type point_ty         is record (point1 number(2), point2 number(2));
type line_ty          is table of integer index by binary_integer;
type matrix_ty        is table of line_ty index by binary_integer;
matrix_a  matrix_ty;
matrix_b  matrix_ty;

l_height number(2) := 5;
l_sqr_save    number(3) := 0;
l_sqr    number(3) := 0;
l_rest   number(3);
z        number(2);
x        number(2);
y        number(2);

--
-- Multiplies 2 3 * 3 matrices
--
function multiply (p_matrix_a in matrix_ty, p_matrix_b in matrix_ty) return matrix_ty
is
l_matrix matrix_ty;
l_val    number(4);
begin
for n in 1 .. 3
loop
  for m in 1 .. 3
  loop
    l_val := 0;    
    for p in 1 .. 3
    loop
      l_val := l_val +  p_matrix_a (m)(p) *  p_matrix_b (p)(n);
    end loop;
    l_matrix(m)(n) := l_val;
  end loop;
end loop;

  return l_matrix;
end multiply;

--
-- 2 Dimensional mirror in x-y plane. z = 0.
--
function mirror_xy (p_matrix in matrix_ty) return matrix_ty
is
l_matrix matrix_ty;
begin
  for m in 1 .. 3
  loop
    for n in 1 .. 3
    loop
      l_matrix (m)(n) := p_matrix (n)(m);
    end loop;
  end loop;

  return l_matrix;
end mirror_xy;

procedure print_matrix (p_matrix in matrix_ty)
is
begin
dbms_output.put_line(rpad ('+', 13, '---+'));
for m in 1 .. 3
loop
  for n in 1 .. 3
  loop
    dbms_output.put('|' || to_char(p_matrix (n) (m), '9') || ' ');
  end loop;
  dbms_output.put_line('|' || chr(10) || rpad ('+', 13, '---+'));
end loop;
 dbms_output.put_line('.');
end print_matrix;

begin
for m in 1 .. 3
loop
  for n in 1 .. 3
  loop
    matrix_a (n) (m) := 0;
  end loop;
end loop;

matrix_a (2)(1) := -1;
matrix_a (1)(2) :=  1;
matrix_a (3)(3) :=  1;

print_matrix(matrix_a);

matrix_b := multiply (matrix_a, matrix_a);
print_matrix(matrix_b);

matrix_b := mirror_xy (matrix_a);
print_matrix(matrix_b);

for j in 1 .. l_height
loop
  l_sqr_save := l_sqr_save + j * j;
end loop;
dbms_output.put_line(to_char(l_sqr_save));

for depth in 0 .. l_sqr_save - 1
loop
l_sqr := l_sqr_save;

<<get_out>>
for j in 1 .. l_height + 1
loop
  if depth >= l_sqr
  then z := l_height - j + 1; l_rest := depth - l_sqr;
       exit get_out;
  end if;
  l_sqr := l_sqr - j * j;
end loop;
x := 2 * mod(l_rest, l_height - z) + z;
y := 2 * floor(l_rest / (l_height - z)) + z;

-- dbms_output.put_line(to_char(depth) || ' ' || to_char(z) || ' ' || to_char(l_rest) || ' ' || to_char(x) || ' ' || to_char(y));
end loop;
end;
/




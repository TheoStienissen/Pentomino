create table tmp
(id number(3)
, x_min number(1)
, x_max number(1)
, y_max number(1));



insert into tmp values (11,1,0,-4);
insert into tmp values (12,1,-4,0);
insert into tmp values (21,2,-1,-2);
insert into tmp values (22,1,-2,-2);
insert into tmp values (23,1,-2,-2);
insert into tmp values (24,3,0,-2);
insert into tmp values (31,1,-3,-1);
insert into tmp values (32,1,-1,-3);
insert into tmp values (33,1,-3,-1);
insert into tmp values (34,1,-1,-3);
insert into tmp values (35,4,0,-1);
insert into tmp values (36,1,-1,-3);
insert into tmp values (37,2,0,-3);
insert into tmp values (38,1,-3,-1);
insert into tmp values (41,1,-2,-3);
insert into tmp values (42,1,-2,-1);
insert into tmp values (43,1,-2,-1);
insert into tmp values (44,2,-1,-2);
insert into tmp values (51,1,-2,-2);
insert into tmp values (52,1,-2,-2);
insert into tmp values (53,1,-2,-2);
insert into tmp values (54,3,0,-2);
insert into tmp values (61,1,-1,-2);
insert into tmp values (62,1,-2,-1);
insert into tmp values (63,2,0,-2);
insert into tmp values (64,1,-2,-1);
insert into tmp values (65,1,-2,-1);
insert into tmp values (66,2,-1,-1);
insert into tmp values (67,1,-1,-2);
insert into tmp values (68,1,-1,-2);
insert into tmp values (71,1,-1,-3);
insert into tmp values (72,2,0,-3);
insert into tmp values (73,1,-1,-3);
insert into tmp values (74,2,0,-3);
insert into tmp values (75,1,-3,-1);
insert into tmp values (76,1,-3,-1);
insert into tmp values (77,2,-2,-1);
insert into tmp values (78,3,-1,-1);
insert into tmp values (81,2,-1,-2);
insert into tmp values (82,1,-2,-2);
insert into tmp values (83,3,0,-2);
insert into tmp values (84,1,-2,-2);
insert into tmp values (91,2,-1,-2);
insert into tmp values (92,2,-1,-2);
insert into tmp values (93,1,-2,-2);
insert into tmp values (94,2,-1,-2);
insert into tmp values (95,2,-1,-2);
insert into tmp values (96,1,-2,-2);
insert into tmp values (97,2,-1,-2);
insert into tmp values (98,3,0,-2);
insert into tmp values (101,2,-1,-2);
insert into tmp values (111,2,0,-3);
insert into tmp values (112,1,-1,-3);
insert into tmp values (113,1,-1,-3);
insert into tmp values (114,1,-3,-1);
insert into tmp values (115,3,-1,-1);
insert into tmp values (116,2,-2,-1);
insert into tmp values (117,1,-3,-1);
insert into tmp values (118,2,0,-3);
insert into tmp values (121,2,-1,-2);
insert into tmp values (122,1,-2,-2);
insert into tmp values (123,1,-2,-2);
insert into tmp values (124,3,0,-2);

insert into t_pentomino (series, orientation, x, y, color) select series, orientation, x, y, color from v_pentomino order by 1,2;

begin
for j in (select id, x_min, x_max, y_max from tmp)
loop
  update t_pentomino
     set x_min = j.x_min, x_max = j.x_max, y_max = j.y_max
     where series = trunc(j.id/10) and orientation = mod (j.id, 10);
end loop;
end;
/


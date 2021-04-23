SELECT * from entregan;
INSERT INTO entregan values (0, 'xxx', 0, '1-jan-02', 0);
Delete from Entregan where Clave = 0;

ALTER TABLE entregan add constraint cfentreganclave
foreign key (clave) references materiales(clave);
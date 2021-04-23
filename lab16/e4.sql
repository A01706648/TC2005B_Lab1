INSERT INTO entregan values (1000, 'AAAA800101', 5000, GETDATE(), 0);
ALTER TABLE entregan add constraint cantidad check (cantidad > 0) ;
if exists(select * from x_ygxx where bh='9908')
begin
  update X_YGXX set BH='9988' where BH='9908'
end
if not exists(select * from DM_SFFS where dm='18')
begin
  insert into DM_SFFS select '18',MC,ZT from DM_SFFS where dm='28'
end
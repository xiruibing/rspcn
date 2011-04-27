//查询基础数据的sql，按公司号查询的
select a.item_code,a.item_id,a.item_name,a.short_name,b.kind,'条',b.spec,PACK_BAR ,BOX_BAR ,um2.um_size/um1.um_size,c.pri,d.pri
from n_sd_item a,n_sd_item_tobacco b,(SELECT A.ITEM_ID,  A.UM_ID, COALESCE(B.UM_SIZE,
A.UM_SIZE) UM_SIZE  FROM (SELECT I.ITEM_ID, U.UM_ID,  U.UM_SIZE FROM n_SD_ITEM
I, n_SD_UM U) A LEFT JOIN N_SD_ITEM_UM B   ON A.ITEM_ID  = B.ITEM_ID AND A.UM_ID
= B.UM_ID) um1,(SELECT A.ITEM_ID,  A.UM_ID, COALESCE(B.UM_SIZE,
A.UM_SIZE) UM_SIZE  FROM (SELECT I.ITEM_ID, U.UM_ID,  U.UM_SIZE FROM n_SD_ITEM
I, n_SD_UM U) A LEFT JOIN N_SD_ITEM_UM B   ON A.ITEM_ID  = B.ITEM_ID AND A.UM_ID
= B.UM_ID) um2,n_sd_item_pri c,n_sd_item_pri d,n_sd_item_com e
where a.item_id=b.item_id and a.item_id=um1.item_id and a.item_id=um2.item_id
and um1.um_id='02' and um2.um_id='03' and a.item_id=c.item_id  
and a.item_id=d.item_id 
and e.com_id='LZ0000000000001' 
and c.com_id='LZ0000000000001' 
and d.com_id='LZ0000000000001'
and a.item_id=e.item_id
and c.pri_type='03' 
and d.pri_type='04' 
and a.is_mrb='1' 
and c.is_mrb='1' 
and e.is_mrb='1' 
and c.pri<>0
;


//查询基础数据的sql，查询全省的
select a.item_code,a.item_id,a.item_name,a.short_name,b.kind,'条',b.spec,PACK_BAR ,BOX_BAR ,um2.um_size/um1.um_size,max(c.pri),max(d.pri),brand_name,
case  when IS_IMPORTED='0' then '省内' when  IS_IMPORTED='1' then '省外' when  IS_IMPORTED='3' then '国外' end,case when BRD_KEY ='0' then '否' when BRD_KEY ='1' then '是' end 
from n_sd_item a,n_sd_item_tobacco b,(SELECT A.ITEM_ID,  A.UM_ID, COALESCE(B.UM_SIZE,
A.UM_SIZE) UM_SIZE  FROM (SELECT I.ITEM_ID, U.UM_ID,  U.UM_SIZE FROM n_SD_ITEM
I, n_SD_UM U) A LEFT JOIN N_SD_ITEM_UM B   ON A.ITEM_ID  = B.ITEM_ID AND A.UM_ID
= B.UM_ID) um1,(SELECT A.ITEM_ID,  A.UM_ID, COALESCE(B.UM_SIZE,
A.UM_SIZE) UM_SIZE  FROM (SELECT I.ITEM_ID, U.UM_ID,  U.UM_SIZE FROM n_SD_ITEM
I, n_SD_UM U) A LEFT JOIN N_SD_ITEM_UM B   ON A.ITEM_ID  = B.ITEM_ID AND A.UM_ID
= B.UM_ID) um2,n_sd_item_pri c,n_sd_item_pri d,n_sd_item_com e,n_sd_brand f
where a.item_id=b.item_id and a.item_id=um1.item_id and a.item_id=um2.item_id and a.brand_id1=f.brand_id
and um1.um_id='02' and um2.um_id='03' and a.item_id=c.item_id  and a.item_id=d.item_id and a.item_id=e.item_id
and c.pri_type='03' and d.pri_type='04' and a.is_mrb='1' and c.is_mrb='1' and e.is_mrb='1' and c.pri<>0
group by a.item_code,a.item_id,a.item_name,a.short_name,b.kind,'条',b.spec,PACK_BAR ,BOX_BAR ,um2.um_size/um1.um_size,brand_name,case  when IS_IMPORTED='0' then '省内' when  IS_IMPORTED='1' then '省外' when  IS_IMPORTED='3' then '国外' end,case when BRD_KEY ='0' then '否' when BRD_KEY ='1' then '是' end
;
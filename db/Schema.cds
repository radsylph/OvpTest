namespace adm.main;

using {
    cuid,
    sap.common.CodeList,
    managed
} from '@sap/cds/common';

entity category : cuid, managed {
    nam_cat : String(100);
    des_cat : String(150);
}

entity material : cuid, managed {
    nam_mat  : String(100);
    des_mat  : String(150);
    cat_mat  : Association to category;
    pri_mate : Integer;
}

entity currency : cuid, managed {
    nam_cur : String(100);
    des_cur : String(150);
    sym_cur : String(10);
    rat_cur : Decimal(10, 2);
}

entity buy_receipt : cuid, managed {
    dat_receipt : DateTime;
    tot_receipt : Decimal(10, 2);
}

entity sell_receipt : cuid, managed {   
    dat_receipt : DateTime;
    tot_receipt : Decimal(10, 2);
}

entity sell_movement : cuid, managed {
    rec_id       : Association to sell_receipt;
    mat_id       : Association to material;
    cur_id       : Association to currency;
    qua_movement : Integer;
}

entity buy_movement : cuid, managed {
    rec_id       : Association to buy_receipt;
    mat_id       : Association to material;
    cur_id       : Association to currency;
    qua_movement : Integer;
}


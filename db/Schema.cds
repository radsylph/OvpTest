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

entity receipt : cuid, managed {
    dat_receipt : DateTime;
    movements   : Composition of many movement
                      on movements.rec_id = $self;
}

entity movement : cuid, managed {
    rec_id       : Association to receipt;
    mat_id       : Association to material;
    cur_id       : Association to currency;
    qua_movement : Integer;
}

entity receipt_type : CodeList {
    key code  : String enum {
            Buy  = 'BUY';
            Sell = 'SELL';
        };
        name  : String @UI.Hidden;
        descr : String @UI.Hidden;
}

entity buy_receipt : cuid, managed {
    dat_receipt : DateTime;
    tot_receipt : Decimal(10, 2);
    rec_type    : Association to receipt_type;
    movements   : Composition of many buy_movement
                      on movements.rec_id = $self;
}

entity buy_movement : cuid, managed {
    rec_id       : Association to buy_receipt;
    mat_id       : Association to material;
    cur_id       : Association to currency;
    qua_movement : Integer;
}

entity sell_receipt : cuid, managed {
    dat_receipt : DateTime;
    tot_receipt : Decimal(10, 2);
    movements   : Composition of many sell_movement
                      on movements.rec_id = $self;
}

entity sell_movement : cuid, managed {
    rec_id       : Association to sell_receipt;
    mat_id       : Association to material;
    cur_id       : Association to currency;
    qua_movement : Integer;
}

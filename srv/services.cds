using {adm.main as db} from '../db/Schema';

service inventoryService @(path: '/inventory') {
    entity material as projection on db.material;
    entity category as projection on db.category;
}

service financeService @(path: '/finances') {
    entity material      as projection on db.material;
    entity currency      as projection on db.currency;
    entity buy_receipt   as projection on db.buy_receipt;
    entity sell_receipt  as projection on db.sell_receipt;
    entity sell_movement as projection on db.sell_movement;
    entity buy_movement  as projection on db.buy_movement;
}

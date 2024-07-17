using inventoryService as service from '../../srv/services';
annotate service.material with @(
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : nam_mat,
        },
        {
            $Type : 'UI.DataField',
            Value : des_mat,
        },
        {
            $Type : 'UI.DataField',
            Value : pri_mate,
        },
    ]
);


using {inventoryService as call} from '../services';

annotate call.material with {
    ID       @UI.Hidden;
    nam_mat  @title: '{i18n>nam_mat}';
    des_mat  @title: '{i18n>des_mat}';
    cat_mat  @title: '{i18n>cat_mat}';
    pri_mate @title: '{i18n>pri_mate}';
}

//hacer el ValueList
annotate call.material with {
    cat_mat @(Common: {
        Text                    : cat_mat.nam_cat,
        TextArrangement         : #TextOnly,
        ValueList               : {
            $Type         : 'Common.ValueListType',
            CollectionPath: 'category',
            Parameters    : [
                {
                    $Type            : 'Common.ValueListParameterInOut',
                    LocalDataProperty: cat_mat_ID,
                    ValueListProperty: 'ID'
                },
                {
                    $Type            : 'Common.ValueListParameterDisplayOnly',
                    ValueListProperty: 'nam_cat'
                }
            ]
        },
        ValueListWithFixedValues: true
    })
}

// @Common.ValueList: {
//     $Type         : 'Common.ValueListType',
//     CollectionPath: 'category',
//     Parameters    : [
//         {
//             $Type            : 'Common.ValueListParameterInOut',
//             LocalDataProperty: 'cat_mat_ID',
//             ValueListProperty: 'nam_cat'
//         },
//         {
//             $Type            : 'Common.ValueListParameterDisplayOnly',
//             ValueListProperty: 'des_cat'
//         }
//     ]
// }

annotate call.material with  @odata.draft.enabled  @(UI: {
    HeaderInfo            : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : '{i18n>mat_header1}',
        TypeNamePlural: '{i18n>mat_header2}',
        Title         : {
            $Type: 'UI.DataField',
            Value: '{i18n>mat_title}'
        }
    },

    SelectionFields       : [cat_mat_ID],

    FieldGroup #MaterialFG: {

        $Type: 'UI.FieldGroupType',
        Data : [
            {
                $Type: 'UI.DataField',
                Value: nam_mat,
                Label: '{i18n>mat_name}'
            },
            {
                $Type: 'UI.DataField',
                Value: des_mat,
                Label: '{i18n>mat_des}'
            },
            {
                $Type: 'UI.DataField',
                Value: cat_mat_ID,
                Label: '{i18n>mat_cat}'
            },
            {
                $Type: 'UI.DataField',
                Value: pri_mate,
                Label: '{i18n>mat_pri}'
            }
        ]
    },

    LineItem #test        : [
        {
            $Type: 'UI.DataField',
            Value: nam_mat
        },
        {
            $Type: 'UI.DataField',
            Value: des_mat
        },
        {
            $Type: 'UI.DataField',
            Value: cat_mat_ID
        },
        {
            $Type: 'UI.DataField',
            Value: pri_mate
        }
    ],

    Facets                : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#MaterialFG',
        Label : 'test',
        ID    : 'FieldGroup'
    }],
});

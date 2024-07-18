using {inventoryService as call} from '../services';

annotate call.material with {
    ID       @UI.Hidden;
    nam_mat  @title: '{i18n>mat_name}';
    des_mat  @title: '{i18n>mat_des}';
    cat_mat  @title: '{i18n>mat_cat}';
    pri_mate @title: '{i18n>mat_pri}';
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
            },
            {
                $Type: 'UI.DataField',
                Value: des_mat,
            },
            {
                $Type: 'UI.DataField',
                Value: cat_mat_ID,
            },
            {
                $Type: 'UI.DataField',
                Value: pri_mate,
            }
        ]
    },

    LineItem #MaterialLI  : [
        {
            $Type: 'UI.DataField',
            Value: nam_mat,
        },
        {
            $Type: 'UI.DataField',
            Value: des_mat,
        },
        {
            $Type: 'UI.DataField',
            Value: cat_mat_ID,
        },
        {
            $Type: 'UI.DataField',
            Value: pri_mate,
        }
    ],

    Facets                : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.FieldGroup#MaterialFG',
        Label : '{i18n>mat_fac}',
        ID    : 'FieldGroup'
    }],
});

annotate call.material with @(
    UI.Chart #Line              : {
        $Type              : 'UI.ChartDefinitionType',
        ChartType          : #Line,
        Description        : 'Line Chart',
        Measures           : [pri_mate],
        MeasureAttributes  : [{
            $Type    : 'UI.ChartMeasureAttributeType',
            Measure  : pri_mate,
            Role     : #Axis1,
            DataPoint: '@UI.DataPoint#LineDataPoint'
        }],
        Dimensions         : [nam_mat],
        DimensionAttributes: [{
            $Type    : 'UI.ChartDimensionAttributeType',
            Dimension: nam_mat,
            Role     : #Category,
        }]
    },
    UI.PresentationVariant #Line: {
        $Type            : 'UI.PresentationVariantType',
        Visualizations   : ['@UI.Chart#Line'],
        MaxItems         : 4,
        IncludeGrandTotal: true,
        SortOrder        : [{
            $Type     : 'Common.SortOrderType',
            Descending: true,
            Property  : pri_mate
        }]
    },

    UI.DataPoint #LineDataPoint : {
        $Type: 'UI.DataPointType',
        Title: 'Line Chart',
        Value: pri_mate
    }
);

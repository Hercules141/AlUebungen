report 50102 "Item Info Excel"
{
    UsageCategory = Lists;

    dataset
    {
        dataitem(ItemDataItem; Item)
        {
            column(ColumnName; "Item No. Var")
            {

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                field("Item No."; "Item No. var")
                {
                    ApplicationArea = All;

                }
            }
        }

        actions
        {
            area(processing)
            {
                action(ActionName)
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    // rendering
    // {
    //     layout(LayoutName)
    //     {
    //         Type = RDLC;
    //         LayoutFile = 'mylayout.rdl';
    //     }
    // }

    var
        "Item No. Var": Code[20];
}

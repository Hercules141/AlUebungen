report 50103 "Item Info CSV"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;



    dataset
    {
        dataitem(ItemDataItem; Item)
        {
            RequestFilterFields = "No.";
            column(ColumnName; "var Item No.")
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
                group(GroupName)
                {
                    field("Field Item No."; "var Item No.")
                    {
                        ApplicationArea = All;
                        TableRelation = Item."No.";
                    }
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

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            myInt: Integer;
        begin
            if "var Item No." = '' then
                Error('Item No. cannot be empty!');
        end;

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
        "var Item No.": code[20];
}
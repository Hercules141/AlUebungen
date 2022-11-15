report 50103 "Item Info CSV"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;


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
                // group(GroupName)
                // {
                //     field("Field Item No."; "var Item No.")
                //     {
                //         ApplicationArea = All;
                //         TableRelation = Item."No.";
                //     }
                // }
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            myInt: Integer;
        begin
            if CurrReport.ItemDataItem.GetFilters() = '' then
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
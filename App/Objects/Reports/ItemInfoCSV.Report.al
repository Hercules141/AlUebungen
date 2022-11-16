report 50103 "Item Info CSV"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
<<<<<<< HEAD
    ProcessingOnly = true;
=======

>>>>>>> main


    dataset
    {
        dataitem(ItemDataItem; Item)
        {
<<<<<<< HEAD

=======
>>>>>>> main
            RequestFilterFields = "No.";
            column(ColumnName; "var Item No.")
            {

            }
<<<<<<< HEAD

        }

=======
        }
>>>>>>> main
    }

    requestpage
    {
        layout
        {
<<<<<<< HEAD
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
=======

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
>>>>>>> main
            }
        }

        trigger OnQueryClosePage(CloseAction: Action): Boolean
        var
            myInt: Integer;
        begin
<<<<<<< HEAD
            if CurrReport.ItemDataItem.GetFilters() = '' then
=======
            if "var Item No." = '' then
>>>>>>> main
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
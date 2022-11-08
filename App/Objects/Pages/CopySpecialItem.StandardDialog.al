/// <summary>
/// Page CopyItemCardPage (ID 50104).
/// 
/// </summary>
page 50104 CopyItemStandardDialog
{
    Caption = 'Copy Item';
    PageType = StandardDialog;
    SourceTable = SonderpreiseTable;

    layout
    {
        area(content)
        {
            group(General)
            {
                //variation using variable for Item No only
                // field("Copy Item No"; "Item No To Copy")
                // {
                //     TableRelation = Item;
                //     // Lookup = true;
                //     // LookupPageId = SonderpreiseList;
                //     DrillDown = true;
                //     // DrillDownPageId =  SonderpreiseList;
                //     trigger OnValidate()
                //     begin
                //         Message('Item Number to Copy: %1', "Item No To Copy");
                //     end;
                // }

                field("Item No Field"; "Item No To Copy")
                {
                    TableRelation = Item;
                    NotBlank = true;
                }

                field("New Special Price Field"; "New Special Price")
                {
                    ApplicationArea = All;
                    NotBlank = true;
                }


            }
        }
    }

    procedure GetItemNoToCopy(): Code[10]
    begin
        exit("Item No To Copy");
    end;

    procedure GetNewSpecialPrice(): Decimal
    begin
        exit("New Special Price");
    end;


    procedure SetSpecialPrice(_SpecialPrice: Decimal)
    begin
        "New Special Price" := _SpecialPrice;
    end;

    var
        "Item No To Copy": Code[10];
        "New Special Price": Decimal;
        ItemManagement: Codeunit "Item Management";

    // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // var
    //     ItemToCopy: Record Item;
    // // RecSonder: Record SonderpreiseTable;
    // begin
    //     if (CloseAction = Action::OK) then begin
    //         // //one way to get the item record by Primary key (instead  only %1 could be filter with ranges etc.: %1..%2)
    //         // // ItemToCopy.SetFilter(ItemToCopy."No.", '%1', '1001'); //works, little cumbersome though
    //         // ItemToCopy.SetFilter(ItemToCopy."No.", '%1', "Item No To Copy");
    //         // ItemToCopy.FindSet();


    //         Message(Format(Rec));

    //         ItemToCopy.Get("Item No To Copy");
    //         // Message('Record not empty? : %1', ItemToCopy.FindSet());
    //         // ItemManagement.CopyItem(ItemToCopy, RecSonder, Rec);
    //         ItemManagement.CopyItem(ItemToCopy, Rec);

    //     end;


    // end;

}

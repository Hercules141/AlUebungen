page 50106 "Items under 100"
{
    Caption = 'Items under 100';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Items under 100";
    SourceTableView = sorting("Entry No.") order(descending);

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    TableRelation = Item."No.";
                }
                field("Added On"; Rec."Added On")
                {
                    ApplicationArea = All;
                }
                field("Item Stock"; Rec."Item Stock")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}
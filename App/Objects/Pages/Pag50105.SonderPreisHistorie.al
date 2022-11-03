page 50105 SonderPreisHistorie
{
    Caption = 'Sonder Preis Historie';
    PageType = List;
    SourceTable = SonderPreisHistorie;
    UsageCategory = Lists;
    SourceTableView = sorting("Entry No.") order(descending);

    layout
    {

        area(content)
        {

            repeater(General)
            {

                field("Entry No Field"; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
                field("Entry No FK Field"; Rec."Entry No. FK")
                {
                    ApplicationArea = All;
                }
                field("Item No Field"; Rec."Item No")
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                }
                field("Starting Date Field"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Ending Date Field"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                }
                field("Currency Code Field"; Rec."Currency Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Price Field"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Special Unit Price Field"; Rec."Special Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Historised by"; Rec."Historised by")
                {
                    ApplicationArea = all;
                }
            }
        }
    }
}

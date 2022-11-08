pageextension 50104 ExtSalesPriceList extends "Sales Price List"
{
    Caption = 'ExtSalesPriceList';
    layout
    {

    }

    actions
    {
        addbefore(SuggestLines)
        {
            action(Sonderpreisliste)
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    listSonder: Page SonderpreiseList;
                    cardSonder: Page SonderpreiseCardPage;
                begin
                    listSonder.Run();
                    // cardSonder.Run();
                end;
            }
        }
    }
}

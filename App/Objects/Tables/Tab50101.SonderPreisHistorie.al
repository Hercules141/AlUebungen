table 50101 SonderPreisHistorie
{
    Caption = 'SonderPreisHistorie';
    DataClassification = ToBeClassified;


    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;

        }
        //new Field
        field(9; "Entry No. FK"; Integer)
        {
            // TableRelation?
        }
        field(2; "Item No"; Code[20])
        {
        }
        field(3; "Variant Code"; Code[10])
        {
        }
        field(4; "Starting Date"; Date)
        {
        }
        field(5; "Ending Date"; Date)
        {
        }
        field(6; "Currency Code"; Code[10])
        {

        }
        field(7; "Unit Price"; Decimal)
        {

        }

        field(8; "Special Unit Price"; Decimal)
        {
        }
        field(10; "Historised by"; Text[255])
        {
        }
        field(11; "Historised on"; Date)
        {
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {

        }
        key(FK1; "Entry No. FK")
        {

        }
    }
}

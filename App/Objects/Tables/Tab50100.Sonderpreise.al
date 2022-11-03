

table 50100 SonderpreiseTable
{
    DataClassification = ToBeClassified;
    // LookupPageId = SonderpreiseList;
    // DrillDownPageId = SonderpreiseList;
    // Extensible = true;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }

        field(2; "Item No"; Code[20])
        {
            DataClassification = ToBeClassified;
            //alows for the "lookup/selection of Line in other/foreign table"
            TableRelation = Item."No.";
        }

        field(3; "Variant Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            //Table Relation with a filter to select Item variants that belong to specific item in row
            TableRelation = "Item Variant" where("Item No." = field("Item No"));

        }
        // TableRelation = lookup("Item Variant" where "Item No." = field());
        // TableRelation = "Item Variant";

        field(4; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Currency Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            //setzt den zellenwert auf einen wert den man nachschlägt oder ausrechnet
            TableRelation = Currency.Code;

        }
        field(7; "Unit Price"; Decimal)
        {
            // TableRelation = Item."Unit Price";
            //looks up the item and automatically sets the according price for this field
            FieldClass = FlowField;
            CalcFormula = lookup(Item."Unit Price" where("No." = field("Item No")));
        }

        field(8; "Special Unit Price"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        //Is automatically primary key, cause first defined key
        key(MyPK; "Entry No.")
        {
            // Clustered = true;
        }

        //subsequent Keys automatically secondary-/Foreign-/ Key / Index
        // key(SK1;)

        // key(FK; "Item No")
        // {
        //     Enabled = true; //maybe not necessary
        // }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Entry No.", "Item No", "Variant Code")
        {
        }
    }

}

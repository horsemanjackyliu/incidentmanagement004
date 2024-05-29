namespace teched;

using { o5pbp } from '../srv/external/o5pbp.cds';

using
{
    Language,
    Currency,
    Country,
    sap.common.CodeList,
    cuid,
    managed,
    temporal,
    User,
    extensible
}
from '@sap/cds/common';

entity Incidents
{
    key ID : UUID
        @Core.Computed;
    title : String(100)
        @title : 'Title';
    conversations : Composition of many Conversations on conversations.incidents = $self;
    urgency : Association to one Urgency;
    customer : Association to one o5pbp.A_BusinessPartner;
}

entity Conversations
{
    key ID : UUID
        @Core.Computed;
    timestamp : DateTime
        @cds.on.insert : $now;
    author : String(100)
        @cds.on.insert : $user;
    message : String(100);
    incidents : Association to one Incidents;
}

entity Urgency : CodeList
{
    key code : UrgencyCode;
}

entity CMIS
{
    key foldid : String(20);
    fileid : String(20);
}

type UrgencyCode : String enum
{
    High = 'H';
    Medium = 'M';
    Low = 'L';
}

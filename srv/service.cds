using { o5pbp } from './external/o5pbp.cds';

using { teched as my } from '../db/schema';

@path : '/service/incident_management004Svcs'
service ProcessorService
{
    entity customer as projection on o5pbp.A_BusinessPartner
    {
        BusinessPartner,
        FirstName,
        LastName
    };

    @odata.draft.enabled
    entity Incidents as
        projection on my.Incidents;

    @odata.draft.enabled
    entity Urgency as
        projection on my.Urgency;

    entity Conversations as
        projection on my.Conversations;
}

annotate ProcessorService with @requires :
[
    'authenticated-user'
];
